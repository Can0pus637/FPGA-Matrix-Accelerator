`timescale 1ns/1ps

module tb_Base_top;

  // ��������
  parameter DATA_WIDTH = 2;
  parameter M = 4;
  parameter K = 4;
  parameter N = 4;
  parameter GAP_CYCLES = 5;

  // �źŶ���
  logic clk_p;
  logic clk_n;
  logic rst;
  // ������� C
  logic [(2*DATA_WIDTH):0] C [M][N];

  // ʵ��������ģ�� Base_top
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

  // ���ɲ��ʱ���ź�
  initial begin
      clk_p = 0;
      forever #5 clk_p = ~clk_p;  // clk_p ����Ϊ10ns
  end
  assign clk_n = ~clk_p;  // ��ȡ����Ϊ���ʱ��

  // ��λ�ź�����
  initial begin
      rst = 1;
      #20;
      rst = 0;
  end

  // ������ C ���飨����ֻ��ص�һ�в����źţ��ɸ�����Ҫ��չ��
  always @(posedge clk_p) begin
      $display("Time %t: C[0][0]=%0d, C[0][1]=%0d, C[0][2]=%0d, C[0][3]=%0d",
                $time, C[0][0], C[0][1], C[0][2], C[0][3]);
  end

  // ��������ʱ��
  initial begin
      #1000;  // ������Ҫ�ӳ�����ʱ��
      $finish;
  end

endmodule
