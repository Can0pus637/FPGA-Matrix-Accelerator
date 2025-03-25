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

  // 最终输出 final_out (尺寸 M×M)
  logic [2*DATA_WIDTH+1:0] final_out [0:M-1][0:M-1];

  // 实例化 DUT
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

  // 时钟生成：周期 10ns
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // 激励信号：复位后释放 rst，并使 gen_done 为高，同时初始化 A 与 B
  initial begin
    rst = 1;
    gen_done = 0;
    #20;
    rst = 0;
    gen_done = 1;
    
    // 初始化矩阵 A 为 4×4，例子数据 1～16（按行）
A[0] = '{1, 2, 3, 0};
A[1] = '{1, 2, 3, 0};
A[2] = '{1, 2, 3, 0};
A[3] = '{1, 2, 3, 0};


    // 初始化矩阵 B 为 4×4，例子数据 17～32（按行）
B[0] = '{1, 2, 3, 0};
B[1] = '{1, 2, 3, 0};
B[2] = '{1, 2, 3, 0};
B[3] = '{1, 2, 3, 0};

    
    #200;
    $finish;
  end

  // 每个时钟上升沿打印所有调试信号
  always @(posedge clk) begin
    integer i, j, r, c;
    $display("-------------------------------------------------------");
    $display("Time = %0t", $time);
    
    // 打印矩阵 A
    $display("Matrix A:");
    for (i = 0; i < M; i = i + 1) begin
      $write("A[%0d]: ", i);
      for (j = 0; j < K; j = j + 1)
        $write("%0d ", A[i][j]);
      $display("");
    end

    // 打印矩阵 B
    $display("Matrix B:");
    for (i = 0; i < K; i = i + 1) begin
      $write("B[%0d]: ", i);
      for (j = 0; j < N; j = j + 1)
        $write("%0d ", B[i][j]);
      $display("");
    end

    // 打印 alaph_internal
    $display("alaph_internal (from LUT_alpha_inst):");
    for (i = 0; i < M; i = i + 1) begin
      $write("%0d ", dut.alaph_internal[i]);
      $display("");
    end

    // 打印 beta_internal
    $display("beta_internal (from LUT_beta_inst):");
    for (j = 0; j < N; j = j + 1) begin
      $write("%0d ", dut.beta_internal[j]);
      $display("");
    end

    // 打印中间矩阵 midA
//    $display("midA:");
//    for (r = 0; r < M; r = r + 1) begin
//      for (c = 0; c < (K/2); c = c + 1) begin
//        $write("%0d ", dut.midA[r][c]);
//      end
//      $display("");
//    end

//    // 打印中间矩阵 midB
//    $display("midB:");
//    for (r = 0; r < M; r = r + 1) begin
//      for (c = 0; c < (K/2); c = c + 1) begin
//        $write("%0d ", dut.midB[r][c]);
//      end
//      $display("");
//    end

    // 打印 C_internal (来自 LUT_final_inst)
    $display("C_internal (from LUT_final_inst):");
    for (i = 0; i < M; i = i + 1) begin
      for (j = 0; j < M; j = j + 1) begin
        $write("%0d ", dut.C_internal[i][j]);
      end
      $display("");
    end

    // 打印最终输出 final_out
    $display("final_out:");
    for (i = 0; i < M; i = i + 1) begin
      for (j = 0; j < M; j = j + 1) begin
        $write("%0d ", final_out[i][j]);
      end
      $display("");
    end

  end

endmodule
