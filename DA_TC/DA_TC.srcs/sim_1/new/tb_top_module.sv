`timescale 1ns / 1ps

module tb_top_module;

  // ��������
  parameter DATA_WIDTH = 2;
  parameter M = 4;
  parameter N = 4;
  parameter K = 4;

  logic clk;
  logic rst;

  // ʵ���� TOP ģ��
  TOP_TC #(
    .DATA_WIDTH(DATA_WIDTH),
    .M(M),
    .N(N),
    .K(K)
  ) uut (
    .clk(clk),
    .rst(rst)
  );

  // ʱ�����ɣ����� 10ns
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // ��λ���壺20ns ���ͷŸ�λ
  initial begin
    rst = 1;
    #20;
    rst = 0;
  end

  // ÿ��ʱ�����ڴ�ӡ A��B��C_out �����Լ� random_matrix �� clk_counter
  always @(posedge clk) begin
    integer i, j;
    $display("Time: %0t", $time);
    $display("random_matrix clk_counter = %0d", uut.u_random_matrix.clk_counter);

    // ��ӡ A ����
    $display("Matrix A:");
    for (i = 0; i < M; i = i + 1) begin
      $write("A[%0d]: ", i);
      for (j = 0; j < K; j = j + 1) begin
        $write("%0d ", uut.u_random_matrix.A[i][j]);
      end
      $display("");
    end
    
    // ��ӡ B ����
    $display("Matrix B:");
    for (i = 0; i < K; i = i + 1) begin
      $write("B[%0d]: ", i);
      for (j = 0; j < N; j = j + 1) begin
        $write("%0d ", uut.u_random_matrix.B[i][j]);
      end
      $display("");
    end
    
    // ��ӡ C_out ����
    $display("Matrix C_out:");
    for (i = 0; i < M; i = i + 1) begin
      $write("C_out[%0d]: ", i);
      for (j = 0; j < N; j = j + 1) begin
        $write("%0d ", uut.u_Array_Input.C_out[i][j]);
      end
      $display("");
    end
    $display("--------------------------------------------------");
  end

  // ����һ��ʱ������
  initial begin
    #300;
    $finish;
  end

endmodule
