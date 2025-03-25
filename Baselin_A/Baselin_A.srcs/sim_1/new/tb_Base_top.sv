`timescale 1ns/1ps

module tb_Base_top;

  // 参数定义
  parameter DATA_WIDTH = 2;
  parameter M = 4;
  parameter K = 4;
  parameter N = 4;
  parameter GAP_CYCLES = 5;

  // 信号定义
  logic clk_p;
  logic clk_n;
  logic rst;
  // 输出数组 C
  logic [(2*DATA_WIDTH):0] C [M][N];

  // 实例化顶层模块 Base_top
  Base_top #(
      .DATA_WIDTH(DATA_WIDTH),
      .M(M),
      .K(K),
      .N(N),
      .GAP_CYCLES(GAP_CYCLES)
  ) dut (
      .clk_p(clk_p),
      .clk_n(clk_n),
      .rst(rst),
      .C(C)
  );

  // 生成差分时钟信号
  initial begin
      clk_p = 0;
      forever #5 clk_p = ~clk_p;  // clk_p 周期为10ns
  end
  assign clk_n = ~clk_p;  // 简单取反作为差分时钟

  // 复位信号生成
  initial begin
      rst = 1;
      #20;
      rst = 0;
  end

  // 监控输出 C 数组（这里只监控第一行部分信号，可根据需要扩展）
  always @(posedge clk_p) begin
      $display("Time %t: C[0][0]=%0d, C[0][1]=%0d, C[0][2]=%0d, C[0][3]=%0d",
                $time, C[0][0], C[0][1], C[0][2], C[0][3]);
  end

  // 仿真运行时间
  initial begin
      #1000;  // 根据需要延长仿真时间
      $finish;
  end

endmodule
