`timescale 1ns/1ps

module tb_FIP_TC;

  // 参数定义
  parameter DATA_WIDTH = 2;
  parameter M = 4;
  parameter K = 4;  // 必须为偶数
  parameter N = 4;

  logic clk;
  logic rst;
  logic gen_done;

  // 输入矩阵 A (M×K) 和 B (K×N)
  logic [DATA_WIDTH-1:0] A [0:M-1][0:K-1];
  logic [DATA_WIDTH-1:0] B [0:K-1][0:N-1];

  // 输出向量：alaph (每行的点积) 和 beta (每列的点积)
  logic [2*DATA_WIDTH+1:0] alaph [0:M-1];
  logic [2*DATA_WIDTH+1:0] beta  [0:N-1];

  // 实例化计算模块
  // 请确保模块 Calc_Alpha_Beta_Adapted 内部的生成块名称与下列层次引用匹配：
  //   - for alaph：生成块名称为 gen_alaph[i]，内部 LUT 实例名为 LUT_alpha_inst
  //   - for beta: 生成块名称为 gen_beta_col[j]，内部 LUT 实例名为 LUT_beta_inst
  Calc_Alpha_Beta_Adapted #(
    .DATA_WIDTH(DATA_WIDTH),
    .M(M),
    .K(K),
    .N(N)
  ) calc_inst (
    .clk(clk),
    .rst(rst),
    .gen_done(gen_done),
    .A(A),
    .B(B),
    .alaph(alaph),
    .beta(beta)
  );

  // 时钟生成：周期10ns
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // 激励：复位后释放 rst，并将 gen_done 置高以允许运算，同时初始化 A 与 B 矩阵
  initial begin
    rst = 1;
    gen_done = 0;
    #20;
    rst = 0;
    gen_done = 1;
    
    // 初始化 A 矩阵（4×4），取值范围 0~3
    A[0] = '{0, 1, 2, 3};
    A[1] = '{1, 2, 3, 0};
    A[2] = '{2, 3, 0, 1};
    A[3] = '{3, 0, 1, 2};
    
    // 初始化 B 矩阵（4×4）
    B[0] = '{0, 1, 2, 3};
    B[1] = '{1, 2, 3, 0};
    B[2] = '{2, 3, 0, 1};
    B[3] = '{3, 0, 1, 2};
    
    #200;
    $finish;
  end

  // 每个时钟上升沿打印 A、B、alaph、beta 及每个 LUT 的中间信号
  always @(posedge clk) begin
    integer i, j;
    $display("-------------------------------------------------------");
    $display("Time = %0t", $time);

    // 打印 A 矩阵
    $display("Matrix A:");
    for (i = 0; i < M; i = i + 1) begin
      $write("A[%0d]: ", i);
      for (j = 0; j < K; j = j + 1)
        $write("%0d ", A[i][j]);
      $display("");
    end

    // 打印 B 矩阵
    $display("Matrix B:");
    for (i = 0; i < K; i = i + 1) begin
      $write("B[%0d]: ", i);
      for (j = 0; j < N; j = j + 1)
        $write("%0d ", B[i][j]);
      $display("");
    end

    // 打印计算结果
    $display("alaph results (row dot products):");
    for (i = 0; i < M; i = i + 1)
      $display("alaph[%0d] = %0d", i, alaph[i]);
      
    $display("beta results (column dot products):");
    for (j = 0; j < N; j = j + 1)
      $display("beta[%0d] = %0d", j, beta[j]);

    // 打印每个 alaph LUT 的中间信号
    for (i = 0; i < M; i = i + 1) begin
      $display("Row %0d LUT (alaph) internals:", i);
      // 注意层次引用：calc_inst.gen_alaph[i].LUT_alpha_inst
      $display("   t = %0d", calc_inst.gen_alaph[i].LUT_alpha_inst.t);
      $display("   bit_array = %b", calc_inst.gen_alaph[i].LUT_alpha_inst.bit_array);
      $display("   C (accumulated value) = %0d", calc_inst.gen_alaph[i].LUT_alpha_inst.C);
    end

    // 打印每个 beta LUT 的中间信号
    for (j = 0; j < N; j = j + 1) begin
      $display("Column %0d LUT (beta) internals:", j);
      // 注意层次引用：calc_inst.gen_beta_col[j].LUT_beta_inst
      $display("   t = %0d", calc_inst.gen_beta_col[j].LUT_beta_inst.t);
      $display("   bit_array = %b", calc_inst.gen_beta_col[j].LUT_beta_inst.bit_array);
      $display("   C (accumulated value) = %0d", calc_inst.gen_beta_col[j].LUT_beta_inst.C);
    end
  end

endmodule
