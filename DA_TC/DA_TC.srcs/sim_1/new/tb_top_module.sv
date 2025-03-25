`timescale 1ns / 1ps

module tb_top_module;

  // 参数定义
  parameter DATA_WIDTH = 2;
  parameter M = 4;
  parameter N = 4;
  parameter K = 4;

  logic clk;
  logic rst;

  // 实例化 TOP 模块
  TOP_TC #(
    .DATA_WIDTH(DATA_WIDTH),
    .M(M),
    .N(N),
    .K(K)
  ) uut (
    .clk(clk),
    .rst(rst)
  );

  // 时钟生成：周期 10ns
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // 复位脉冲：20ns 后释放复位
  initial begin
    rst = 1;
    #20;
    rst = 0;
  end

  // 每个时钟周期打印 A、B、C_out 矩阵以及 random_matrix 的 clk_counter
  always @(posedge clk) begin
    integer i, j;
    $display("Time: %0t", $time);
    $display("random_matrix clk_counter = %0d", uut.u_random_matrix.clk_counter);

    // 打印 A 矩阵
    $display("Matrix A:");
    for (i = 0; i < M; i = i + 1) begin
      $write("A[%0d]: ", i);
      for (j = 0; j < K; j = j + 1) begin
        $write("%0d ", uut.u_random_matrix.A[i][j]);
      end
      $display("");
    end
    
    // 打印 B 矩阵
    $display("Matrix B:");
    for (i = 0; i < K; i = i + 1) begin
      $write("B[%0d]: ", i);
      for (j = 0; j < N; j = j + 1) begin
        $write("%0d ", uut.u_random_matrix.B[i][j]);
      end
      $display("");
    end
    
    // 打印 C_out 矩阵
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

  // 仿真一定时间后结束
  initial begin
    #300;
    $finish;
  end

endmodule
