`timescale 1ns/1ps

module tb_random_matrix;

  // 参数定义
  parameter DATA_WIDTH = 2;
  parameter M = 2;
  parameter K = 2;
  parameter N = 2;

  logic clk;
  logic rst;

  // 定义输出矩阵（由 random_matrix 模块生成）
  logic [DATA_WIDTH-1:0] A [0:M-1][0:K-1];
  logic [DATA_WIDTH-1:0] B [0:K-1][0:N-1];

  // DUT 实例化
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

  // 时钟生成：10ns 周期
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // 激励信号：复位后运行一段时间
  initial begin
    rst = 1;
    #20;
    rst = 0;
    // 模拟足够多的时钟周期以观察多次矩阵更新
    #200;
    $finish;
  end

  // 每个时钟上升沿打印矩阵 A 和 B
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
