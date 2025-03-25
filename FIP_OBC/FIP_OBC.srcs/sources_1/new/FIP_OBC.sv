`timescale 1ns / 1ps

module FIP_OBC#(
    parameter DATA_WIDTH = 3,
    parameter M = 4,      // A ������
    parameter K = 4,      // A ������������Ϊż����ͬʱ B ������ҲΪ K��
    parameter N = 4       // B ������������Ҫ�� M = N��
)(
    input  logic clk,
    input  logic rst,
    input  logic gen_done,
    // ������� A: M��K, B: K��N
    input  logic [DATA_WIDTH-1:0] A [0:M-1][0:K-1],
    input  logic [DATA_WIDTH-1:0] B [0:K-1][0:N-1],
    // ������ս����final_out = C - alaph - beta
    output logic [2*DATA_WIDTH+1:0] final_out [0:M-1][0:M-1]
);

  // �ڲ��źţ�alaph��beta��C
  logic [2*DATA_WIDTH+1:0] alaph_internal [0:M-1];
  logic [2*DATA_WIDTH+1:0] beta_internal  [0:N-1];
  logic [2*DATA_WIDTH+1:0] C_internal [0:M-1][0:M-1];

  // =====================================================
  // 1. ���� alaph���� A ��ÿһ�У���ż�����������в�ֺ��� LUT ������
  genvar i, k_idx;
  generate
    for (i = 0; i < M; i = i + 1) begin: gen_alaph_row
      // �����ֺ�������A_even �� A_odd��ÿ������Ϊ K/2
      logic [DATA_WIDTH:0] A_even [0:(K/2)-1];
      logic [DATA_WIDTH:0] A_odd  [0:(K/2)-1];
      for (k_idx = 0; k_idx < K/2; k_idx = k_idx + 1) begin: split_A
        assign A_even[k_idx] = A[i][2*k_idx];       // ȡ A ��ż���У��±� 0,2,4,...��
        assign A_odd[k_idx]  = A[i][2*k_idx+1];       // ȡ A �������У��±� 1,3,5,...��
      end

      LUT #(
          .DATA_WIDTH(DATA_WIDTH+1),
          .M(M),
          .N(N),
          .K(K/2)
      ) LUT_alpha_inst (
          .rst(rst),
          .clk(clk),
          .gen_done(gen_done),
          .A(A_even),
          .B(A_odd),
          .C_out(alaph_internal[i])
      );
    end
  endgenerate

  // =====================================================
  // 2. ���� beta���� B ��ÿһ�У���ż�����������в�ֺ��� LUT ������
  genvar j;
  generate
    for (j = 0; j < N; j = j + 1) begin: gen_beta_col
      // �����ֺ�������B_even �� B_odd��ÿ������Ϊ K/2��B ������Ϊ K��
      logic [DATA_WIDTH:0] B_even [0:(K/2)-1];
      logic [DATA_WIDTH:0] B_odd  [0:(K/2)-1];
      for (k_idx = 0; k_idx < K/2; k_idx = k_idx + 1) begin: split_B
        assign B_even[k_idx] = B[2*k_idx][j];      // ȡ B ��ż���У����±� 0,2,4,...��
        assign B_odd[k_idx]  = B[2*k_idx+1][j];      // ȡ B �������У����±� 1,3,5,...��
      end

      LUT #(
          .DATA_WIDTH(DATA_WIDTH+1),
          .M(M),
          .N(N),
          .K(K/2)
      ) LUT_beta_inst (
          .rst(rst),
          .clk(clk),
          .gen_done(gen_done),
          .A(B_even),
          .B(B_odd),
          .C_out(beta_internal[j])
      );
    end
  endgenerate

  // =====================================================
  localparam L = K/2;
    genvar p, q, k;
  generate
    // ����ÿ����� C_internal[p][q]
    for (p = 0; p < M; p = p + 1) begin : row_loop
      for (q = 0; q < M; q = q + 1) begin : col_loop
        // ��ÿ�� (p,q) ������������Ϊ L �����飺
        // midA_val[k] = A[p][2*k] + B[2*k+1][q]
        // midB_val[k] = A[p][2*k+1] + B[2*k][q]
        wire [DATA_WIDTH:0] midA_val [0:L-1];
        wire [DATA_WIDTH:0] midB_val [0:L-1];
        for (k = 0; k < L; k = k + 1) begin : gen_mid_vals
          assign midA_val[k] = A[p][2*k]   + B[2*k+1][q];
          assign midB_val[k] = A[p][2*k+1] + B[2*k][q];
        end

        // ʵ���� LUT ģ�飬���� midA_val �� midB_val ���ڻ�
        LUT #(
          .DATA_WIDTH(DATA_WIDTH+1), // ÿ���м�ӷ�������Ϊ DATA_WIDTH+1
          .K(L)                      // ���鳤�� L
        ) LUT_inst (
          .rst(rst),
          .clk(clk),
          .gen_done(gen_done),               // �ɸ�����Ҫ�� gen_done �ź�
          .A(midA_val),              // �������� midA_val
          .B(midB_val),              // �������� midB_val
          .C_out(C_internal[p][q])   // ����ڻ������� C_internal[p][q]
        );
      end
    end
  endgenerate

  // =====================================================
  // 5. ���� final_out = C_internal - alaph_internal - beta_internal
  // ����ÿ�� final_out[i][j]�����㣺
  //    final_out[i][j] = C_internal[i][j] - alaph_internal[i] - beta_internal[j]
  genvar f_i, f_j;
  generate
    for (f_i = 0; f_i < M; f_i = f_i + 1) begin: final_out_gen
      for (f_j = 0; f_j < M; f_j = f_j + 1) begin: final_out_gen_inner
        assign final_out[f_i][f_j] = C_internal[f_i][f_j] - alaph_internal[f_i] - beta_internal[f_j];
      end
    end
  endgenerate

endmodule
