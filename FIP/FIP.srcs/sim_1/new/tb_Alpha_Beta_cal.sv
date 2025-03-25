`timescale 1ns/1ps
module tb_Alpha_Beta_cal;

  // ��������
  parameter DATA_WIDTH = 2;
  parameter K = 4;
  parameter M = 4;
  parameter N = 4;

  // �źŶ��壬ֱ���ö�ά�������������� SystemVerilog �﷨��
  logic clk;
  logic rst;
  logic [DATA_WIDTH-1:0] A [M][K];
  logic [DATA_WIDTH-1:0] B [K][N];
  logic [2*DATA_WIDTH+4:0] Alpha [M];
  logic [2*DATA_WIDTH+4:0] Beta  [N];
  logic clr_all;

  // ʵ��������ģ��
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

  // ʱ�����ɣ�����10ns��
  initial begin
    clr_all=0;
    clk = 0;
    forever #5 clk = ~clk;
  end

  // ��λ�ͳ�ʼ����������
  initial begin
    rst = 1;
    #10;
    rst = 0;
    
    // ��ʼ�� A ����1 �� 16
    A[0] = '{8'd1,  8'd2,  8'd3,  8'd4};
    A[1] = '{8'd5,  8'd6,  8'd7,  8'd8};
    A[2] = '{8'd9,  8'd10, 8'd11, 8'd12};
    A[3] = '{8'd13, 8'd14, 8'd15, 8'd16};
    
    // ��ʼ�� B ����17 �� 32
    B[0] = '{8'd17, 8'd18, 8'd19, 8'd20};
    B[1] = '{8'd21, 8'd22, 8'd23, 8'd24};
    B[2] = '{8'd25, 8'd26, 8'd27, 8'd28};
    B[3] = '{8'd29, 8'd30, 8'd31, 8'd32};
    
    // �����㹻ʱ���Ա�۲��м��źű仯
    #200;
    $finish;
  end

  // ÿ��ʱ����������ʾ t �Լ��ڲ��м��ź�
  // ����ʹ�ò㼶���������� Alpha_Beta_cal �ڲ����ź�
  always @(posedge clk) begin
    if (!rst) begin
        $display("Alpha_Beta_end = %d", dut.Alpha_Beta_end);
      $display("Time %0t: t = %0d", $time, dut.t);
      // ��ʾÿ�� Alpha ���м�Ĵ���
      for (int i = 0; i < M; i++) begin
        $display("  Alpha_regA[%0d] = %0d, Alpha_regB[%0d] = %0d", 
                  i, dut.Alpha_regA[i], i, dut.Alpha_regB[i]);
      end
      // ��ʾÿ�� Beta ���м�Ĵ���
      for (int j = 0; j < N; j++) begin
        $display("  Beta_regA[%0d] = %0d, Beta_regB[%0d] = %0d", 
                  j, dut.Beta_regA[j], j, dut.Beta_regB[j]);
      end
      $display("");
    end
  end

endmodule
