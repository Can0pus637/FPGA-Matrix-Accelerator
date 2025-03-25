`timescale 1ns/1ps 
module tb_FIP_TC;

  // ��������
  parameter DATA_WIDTH = 2;
  parameter M = 4;
  parameter K = 4;  // ����Ϊż��
  parameter N = 4;

  logic clk;
  logic rst;
  logic gen_done;

  // ������� A (M��K) �� B (K��N)
  logic [DATA_WIDTH-1:0] A [0:M-1][0:K-1];
  logic [DATA_WIDTH-1:0] B [0:K-1][0:N-1];

  // ������� final_out (�ߴ� M��M)
  logic [2*DATA_WIDTH+1:0] final_out [0:M-1][0:M-1];

  // ʵ���� DUT
  FIP_TC #(
    .DATA_WIDTH(DATA_WIDTH),
    .M(M),
    .K(K),
    .N(N)
  ) dut (
    .clk(clk),
    .rst(rst),
    .gen_done(gen_done),
    .A(A),
    .B(B),
    .final_out(final_out)
  );

  // ʱ�����ɣ����� 10ns
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // �����źţ���λ���ͷ� rst����ʹ gen_done Ϊ�ߣ�ͬʱ��ʼ�� A �� B
  initial begin
    rst = 1;
    gen_done = 0;
    #20;
    rst = 0;
    gen_done = 1;
    
    // ��ʼ������ A Ϊ 4��4���������� 1��16�����У�
A[0] = '{1, 2, 3, 0};
A[1] = '{1, 2, 3, 0};
A[2] = '{1, 2, 3, 0};
A[3] = '{1, 2, 3, 0};


    // ��ʼ������ B Ϊ 4��4���������� 17��32�����У�
B[0] = '{1, 2, 3, 0};
B[1] = '{1, 2, 3, 0};
B[2] = '{1, 2, 3, 0};
B[3] = '{1, 2, 3, 0};

    
    #200;
    $finish;
  end

  // ÿ��ʱ�������ش�ӡ���е����ź�
  always @(posedge clk) begin
    integer i, j, r, c;
    $display("-------------------------------------------------------");
    $display("Time = %0t", $time);
    
    // ��ӡ���� A
    $display("Matrix A:");
    for (i = 0; i < M; i = i + 1) begin
      $write("A[%0d]: ", i);
      for (j = 0; j < K; j = j + 1)
        $write("%0d ", A[i][j]);
      $display("");
    end

    // ��ӡ���� B
    $display("Matrix B:");
    for (i = 0; i < K; i = i + 1) begin
      $write("B[%0d]: ", i);
      for (j = 0; j < N; j = j + 1)
        $write("%0d ", B[i][j]);
      $display("");
    end

    // ��ӡ alaph_internal
    $display("alaph_internal (from LUT_alpha_inst):");
    for (i = 0; i < M; i = i + 1) begin
      $write("%0d ", dut.alaph_internal[i]);
      $display("");
    end

    // ��ӡ beta_internal
    $display("beta_internal (from LUT_beta_inst):");
    for (j = 0; j < N; j = j + 1) begin
      $write("%0d ", dut.beta_internal[j]);
      $display("");
    end

    // ��ӡ�м���� midA
//    $display("midA:");
//    for (r = 0; r < M; r = r + 1) begin
//      for (c = 0; c < (K/2); c = c + 1) begin
//        $write("%0d ", dut.midA[r][c]);
//      end
//      $display("");
//    end

//    // ��ӡ�м���� midB
//    $display("midB:");
//    for (r = 0; r < M; r = r + 1) begin
//      for (c = 0; c < (K/2); c = c + 1) begin
//        $write("%0d ", dut.midB[r][c]);
//      end
//      $display("");
//    end

    // ��ӡ C_internal (���� LUT_final_inst)
    $display("C_internal (from LUT_final_inst):");
    for (i = 0; i < M; i = i + 1) begin
      for (j = 0; j < M; j = j + 1) begin
        $write("%0d ", dut.C_internal[i][j]);
      end
      $display("");
    end

    // ��ӡ������� final_out
    $display("final_out:");
    for (i = 0; i < M; i = i + 1) begin
      for (j = 0; j < M; j = j + 1) begin
        $write("%0d ", final_out[i][j]);
      end
      $display("");
    end

  end

endmodule
