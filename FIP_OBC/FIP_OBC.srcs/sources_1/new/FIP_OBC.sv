`timescale 1ns / 1ps

module FIP_OBC#(
    parameter DATA_WIDTH = 3,
    parameter M = 4,      // A 的行数
    parameter K = 4,      // A 的列数（必须为偶数，同时 B 的行数也为 K）
    parameter N = 4       // B 的列数（这里要求 M = N）
)(
    input  logic clk,
    input  logic rst,
    input  logic gen_done,
    // 输入矩阵 A: M×K, B: K×N
    input  logic [DATA_WIDTH-1:0] A [0:M-1][0:K-1],
    input  logic [DATA_WIDTH-1:0] B [0:K-1][0:N-1],
    // 输出最终结果：final_out = C - alaph - beta
    output logic [2*DATA_WIDTH+1:0] final_out [0:M-1][0:M-1]
);

  // 内部信号：alaph、beta、C
  logic [2*DATA_WIDTH+1:0] alaph_internal [0:M-1];
  logic [2*DATA_WIDTH+1:0] beta_internal  [0:N-1];
  logic [2*DATA_WIDTH+1:0] C_internal [0:M-1][0:M-1];

  // =====================================================
  // 1. 计算 alaph：对 A 的每一行，将偶数列与奇数列拆分后用 LUT 计算点积
  genvar i, k_idx;
  generate
    for (i = 0; i < M; i = i + 1) begin: gen_alaph_row
      // 定义拆分后向量：A_even 与 A_odd，每个长度为 K/2
      logic [DATA_WIDTH:0] A_even [0:(K/2)-1];
      logic [DATA_WIDTH:0] A_odd  [0:(K/2)-1];
      for (k_idx = 0; k_idx < K/2; k_idx = k_idx + 1) begin: split_A
        assign A_even[k_idx] = A[i][2*k_idx];       // 取 A 的偶数列（下标 0,2,4,...）
        assign A_odd[k_idx]  = A[i][2*k_idx+1];       // 取 A 的奇数列（下标 1,3,5,...）
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
  // 2. 计算 beta：对 B 的每一列，将偶数行与奇数行拆分后用 LUT 计算点积
  genvar j;
  generate
    for (j = 0; j < N; j = j + 1) begin: gen_beta_col
      // 定义拆分后向量：B_even 与 B_odd，每个长度为 K/2（B 的行数为 K）
      logic [DATA_WIDTH:0] B_even [0:(K/2)-1];
      logic [DATA_WIDTH:0] B_odd  [0:(K/2)-1];
      for (k_idx = 0; k_idx < K/2; k_idx = k_idx + 1) begin: split_B
        assign B_even[k_idx] = B[2*k_idx][j];      // 取 B 的偶数行（行下标 0,2,4,...）
        assign B_odd[k_idx]  = B[2*k_idx+1][j];      // 取 B 的奇数行（行下标 1,3,5,...）
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
    // 对于每个输出 C_internal[p][q]
    for (p = 0; p < M; p = p + 1) begin : row_loop
      for (q = 0; q < M; q = q + 1) begin : col_loop
        // 对每个 (p,q) 构造两个长度为 L 的数组：
        // midA_val[k] = A[p][2*k] + B[2*k+1][q]
        // midB_val[k] = A[p][2*k+1] + B[2*k][q]
        wire [DATA_WIDTH:0] midA_val [0:L-1];
        wire [DATA_WIDTH:0] midB_val [0:L-1];
        for (k = 0; k < L; k = k + 1) begin : gen_mid_vals
          assign midA_val[k] = A[p][2*k]   + B[2*k+1][q];
          assign midB_val[k] = A[p][2*k+1] + B[2*k][q];
        end

        // 实例化 LUT 模块，计算 midA_val 与 midB_val 的内积
        LUT #(
          .DATA_WIDTH(DATA_WIDTH+1), // 每个中间加法结果宽度为 DATA_WIDTH+1
          .K(L)                      // 数组长度 L
        ) LUT_inst (
          .rst(rst),
          .clk(clk),
          .gen_done(gen_done),               // 可根据需要接 gen_done 信号
          .A(midA_val),              // 输入数组 midA_val
          .B(midB_val),              // 输入数组 midB_val
          .C_out(C_internal[p][q])   // 输出内积，构成 C_internal[p][q]
        );
      end
    end
  endgenerate

  // =====================================================
  // 5. 计算 final_out = C_internal - alaph_internal - beta_internal
  // 对于每个 final_out[i][j]，计算：
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
