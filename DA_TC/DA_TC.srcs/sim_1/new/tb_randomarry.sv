`timescale 1ns/1ps

module tb_random_matrix;

  // ��������
  parameter DATA_WIDTH = 2;
  parameter M = 2;
  parameter K = 2;
  parameter N = 2;

  logic clk;
  logic rst;

  // ������������� random_matrix ģ�����ɣ�
  logic [DATA_WIDTH-1:0] A [0:M-1][0:K-1];
  logic [DATA_WIDTH-1:0] B [0:K-1][0:N-1];

  // DUT ʵ����
  random_matrix #(
    .DATA_WIDTH(DATA_WIDTH),
    .M(M),
    .K(K),
    .N(N)
  ) dut (
    .clk(clk),
    .rst(rst),
    .A(A),
    .B(B)
  );

  // ʱ�����ɣ�10ns ����
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // �����źţ���λ������һ��ʱ��
  initial begin
    rst = 1;
    #20;
    rst = 0;
    // ģ���㹻���ʱ�������Թ۲��ξ������
    #200;
    $finish;
  end

  // ÿ��ʱ�������ش�ӡ���� A �� B
  always @(posedge clk) begin
    integer i, j;
    $display("Time: %0t", $time);
    $display("Matrix A:");
    for (i = 0; i < M; i = i + 1) begin
      $write("A[%0d]: ", i);
      for (j = 0; j < K; j = j + 1) begin
        $write("%0d ", A[i][j]);
      end
      $display("");
    end
    $display("Matrix B:");
    for (i = 0; i < K; i = i + 1) begin
      $write("B[%0d]: ", i);
      for (j = 0; j < N; j = j + 1) begin
        $write("%0d ", B[i][j]);
      end
      $display("");
    end
    $display("-----------------------------");
  end

endmodule
