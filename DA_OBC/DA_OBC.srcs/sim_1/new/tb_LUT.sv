`timescale 1ns / 1ps

module tb_LUT;
  parameter DATA_WIDTH = 3;
  parameter M = 4;
  parameter N = 4;
  parameter K = 4;

  logic rst;
  logic clk;
  logic gen_done;
  logic signed [DATA_WIDTH-1:0] A[K];
  logic signed [DATA_WIDTH-1:0] B[K];
  logic signed [2*DATA_WIDTH+1:0] C_out;

  LUT #(
    .DATA_WIDTH(DATA_WIDTH),
    .M(M),
    .N(N),
    .K(K)
  ) dut (
    .rst(rst),
    .clk(clk),
    .gen_done(gen_done),
    .A(A),
    .B(B),
    .C_out(C_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Stimulus generation
  initial begin
    rst = 1;
    gen_done = 0;
    for (int i = 0; i < K; i++) begin
      A[i] = 0;
      B[i] = 0;
    end
    #20 rst = 0;
    #10;
    // Set B coefficients
    B[0] = 3;
    B[1] = 1;
    B[2] = 2;
    B[3] = 2;
    // Set A inputs
    A[0] = 1;
    A[1] = 0;
    A[2] = 1;
    A[3] = 1;
    #10 gen_done = 1;
    #100 gen_done = 0;
    #200 $finish;
  end

  // On every rising edge, display all signals including notA0 array
  always @(posedge clk) begin
    $display("Time=%0t | rst=%b | gen_done=%b | A[0]=%0d A[1]=%0d A[2]=%0d A[3]=%0d | B[0]=%0d B[1]=%0d B[2]=%0d B[3]=%0d | t=%0d | bit_array=%b | notA0=%b | addr=%b | LUT_out=%0d | C=%0d | C_out=%0d", 
             $time, rst, gen_done, 
             A[0], A[1], A[2], A[3],
             B[0], B[1], B[2], B[3],
             dut.t,
             dut.bit_array,
             dut.A0,   // 新增显示 notA0 数组
             dut.addr,
             dut.LUT_out,
             dut.C,
             C_out);
  end
endmodule
