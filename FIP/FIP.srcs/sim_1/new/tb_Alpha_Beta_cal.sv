`timescale 1ns/1ps
module tb_Alpha_Beta_cal;

  // 参数定义
  parameter DATA_WIDTH = 2;
  parameter K = 4;
  parameter M = 4;
  parameter N = 4;

  // 信号定义，直接用二维数组声明（符合 SystemVerilog 语法）
  logic clk;
  logic rst;
  logic [DATA_WIDTH-1:0] A [M][K];
  logic [DATA_WIDTH-1:0] B [K][N];
  logic [2*DATA_WIDTH+4:0] Alpha [M];
  logic [2*DATA_WIDTH+4:0] Beta  [N];
  logic clr_all;

  // 实例化待测模块
  Alpha_Beta_cal #(
    .DATA_WIDTH(DATA_WIDTH),
    .K(K),
    .M(M),
    .N(N)
  ) dut (
    .clk(clk),
    .rst(rst),
    .A(A),
    .B(B),
    .Alpha(Alpha),
    .Beta(Beta),
    .clr_all(clr_all)
  );

  // 时钟生成（周期10ns）
  initial begin
    clr_all=0;
    clk = 0;
    forever #5 clk = ~clk;
  end

  // 复位和初始化矩阵数据
  initial begin
    rst = 1;
    #10;
    rst = 0;
    
    // 初始化 A 矩阵：1 到 16
    A[0] = '{8'd1,  8'd2,  8'd3,  8'd4};
    A[1] = '{8'd5,  8'd6,  8'd7,  8'd8};
    A[2] = '{8'd9,  8'd10, 8'd11, 8'd12};
    A[3] = '{8'd13, 8'd14, 8'd15, 8'd16};
    
    // 初始化 B 矩阵：17 到 32
    B[0] = '{8'd17, 8'd18, 8'd19, 8'd20};
    B[1] = '{8'd21, 8'd22, 8'd23, 8'd24};
    B[2] = '{8'd25, 8'd26, 8'd27, 8'd28};
    B[3] = '{8'd29, 8'd30, 8'd31, 8'd32};
    
    // 运行足够时间以便观察中间信号变化
    #200;
    $finish;
  end

  // 每个时钟上升沿显示 t 以及内部中间信号
  // 这里使用层级引用来访问 Alpha_Beta_cal 内部的信号
  always @(posedge clk) begin
    if (!rst) begin
        $display("Alpha_Beta_end = %d", dut.Alpha_Beta_end);
      $display("Time %0t: t = %0d", $time, dut.t);
      // 显示每个 Alpha 的中间寄存器
      for (int i = 0; i < M; i++) begin
        $display("  Alpha_regA[%0d] = %0d, Alpha_regB[%0d] = %0d", 
                  i, dut.Alpha_regA[i], i, dut.Alpha_regB[i]);
      end
      // 显示每个 Beta 的中间寄存器
      for (int j = 0; j < N; j++) begin
        $display("  Beta_regA[%0d] = %0d, Beta_regB[%0d] = %0d", 
                  j, dut.Beta_regA[j], j, dut.Beta_regB[j]);
      end
      $display("");
    end
  end

endmodule
