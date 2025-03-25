`timescale 1ns/1ps
module tb_FIP_OBC;
  parameter DATA_WIDTH = 3;
  parameter M = 4;
  parameter K = 4;
  parameter N = 4;

  reg clk;
  reg rst;
  reg gen_done;

  // ������� A (4��4) �� B (4��4)
  reg [DATA_WIDTH-1:0] A [0:M-1][0:K-1];
  reg [DATA_WIDTH-1:0] B [0:K-1][0:N-1];

  // �������
  wire [2*DATA_WIDTH+1:0] final_out [0:M-1][0:M-1];

  // ʵ���� FIP_OBC ģ��
  FIP_OBC #(
    .DATA_WIDTH(DATA_WIDTH),
    .M(M),
    .K(K),
    .N(N)
  ) uut (
    .clk(clk),
    .rst(rst),
    .gen_done(gen_done),
    .A(A),
    .B(B),
    .final_out(final_out)
  );

  // ʱ�Ӳ���
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // ֱ�Ӷ� A �� B ��ֵ������ 0 �� 3����ʹ��ѭ����
  initial begin
    // A ����ֵ
    A[0][0] = 0; A[0][1] = 1; A[0][2] = 2; A[0][3] = 3;
    A[1][0] = 1; A[1][1] = 2; A[1][2] = 3; A[1][3] = 0;
    A[2][0] = 2; A[2][1] = 3; A[2][2] = 0; A[2][3] = 1;
    A[3][0] = 3; A[3][1] = 0; A[3][2] = 1; A[3][3] = 2;
    
    // B ����ֵ
    B[0][0] = 0; B[0][1] = 1; B[0][2] = 2; B[0][3] = 3;
    B[1][0] = 1; B[1][1] = 2; B[1][2] = 3; B[1][3] = 0;
    B[2][0] = 2; B[2][1] = 3; B[2][2] = 0; B[2][3] = 1;
    B[3][0] = 3; B[3][1] = 0; B[3][2] = 1; B[3][3] = 2;
  end

  // ���� rst �� gen_done �ź�
  initial begin
    rst = 1;
    gen_done = 0;
    #12;
    rst = 0;
    #8;
    gen_done = 1;
  end

  // ÿ����������ʾ LUT �ڲ��źš�������� A��B �Լ� C_internal
  // �˴��� FIP_OBC �� C_internal[0][0] ��Ӧ�� LUT ʵ��Ϊ�����������·��Ϊ��
  //   uut.row_loop[0].col_loop[0].LUT_inst
  always @(posedge clk) begin
    $display("Time: %0t", $time);
    
    // ��ʾ LUT �ڲ��źţ��� C0,0 Ϊ����
    $display("LUT_out = %d", uut.row_loop[0].col_loop[0].LUT_inst.LUT_out);
    $display("LUT A: %d, %d, %d, %d",
             uut.row_loop[0].col_loop[0].LUT_inst.A[0],
             uut.row_loop[0].col_loop[0].LUT_inst.A[1],
             uut.row_loop[0].col_loop[0].LUT_inst.A[2],
             uut.row_loop[0].col_loop[0].LUT_inst.A[3]);
    $display("LUT B: %d, %d, %d, %d",
             uut.row_loop[0].col_loop[0].LUT_inst.B[0],
             uut.row_loop[0].col_loop[0].LUT_inst.B[1],
             uut.row_loop[0].col_loop[0].LUT_inst.B[2],
             uut.row_loop[0].col_loop[0].LUT_inst.B[3]);
    $display("A0 = %d", uut.row_loop[0].col_loop[0].LUT_inst.A0);
    $display("addr = %b", uut.row_loop[0].col_loop[0].LUT_inst.addr);
    
    // ��ʾ����� A��B ����
    $display("Input A matrix:");
    $display("%d %d %d %d", A[0][0], A[0][1], A[0][2], A[0][3]);
    $display("%d %d %d %d", A[1][0], A[1][1], A[1][2], A[1][3]);
    $display("%d %d %d %d", A[2][0], A[2][1], A[2][2], A[2][3]);
    $display("%d %d %d %d", A[3][0], A[3][1], A[3][2], A[3][3]);

    $display("Input B matrix:");
    $display("%d %d %d %d", B[0][0], B[0][1], B[0][2], B[0][3]);
    $display("%d %d %d %d", B[1][0], B[1][1], B[1][2], B[1][3]);
    $display("%d %d %d %d", B[2][0], B[2][1], B[2][2], B[2][3]);
    $display("%d %d %d %d", B[3][0], B[3][1], B[3][2], B[3][3]);

    // ��ʾ FIP_OBC �ڲ��� C_internal ����
    $display("C_internal matrix:");
    $display("%d %d %d %d", uut.C_internal[0][0], uut.C_internal[0][1],
                               uut.C_internal[0][2], uut.C_internal[0][3]);
    $display("%d %d %d %d", uut.C_internal[1][0], uut.C_internal[1][1],
                               uut.C_internal[1][2], uut.C_internal[1][3]);
    $display("%d %d %d %d", uut.C_internal[2][0], uut.C_internal[2][1],
                               uut.C_internal[2][2], uut.C_internal[2][3]);
    $display("%d %d %d %d", uut.C_internal[3][0], uut.C_internal[3][1],
                               uut.C_internal[3][2], uut.C_internal[3][3]);
    $display("--------------------------------------------------");
  end

  // �������
  initial begin
    #200;
    $finish;
  end

endmodule
