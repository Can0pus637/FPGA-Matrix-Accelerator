`timescale 1ns / 1ps

module tb_LUT;

    // �������壬�� LUT ģ��һ��
    parameter DATA_WIDTH = 2;
    parameter M = 4;
    parameter N = 4;
    parameter K = 4;
    
    // �ź�����
    logic rst;
    logic clk;
    // ���� LUT ģ��� done��clr �Ƕ˿��źţ����ڲ�Ҳ��ģ�������
    // ������ʱ�ó�������������������ʵ�����ʱ����ȥ���˿ڶ���
    logic done;
    logic clr;
    
    // A��B �������㣨����Ҫ��ʵ���룩
    logic [DATA_WIDTH-1:0] A [K];
    logic [DATA_WIDTH-1:0] B [K];
    
    // ��� C_out
    logic [2*DATA_WIDTH:0] C_out;
    
    // ʵ���� DUT
    LUT #(
        .DATA_WIDTH(DATA_WIDTH),
        .M(M),
        .N(N),
        .K(K)
    ) dut (
        .rst(rst),
        .clk(clk),

        .A(A),
        .B(B),
        .C_out(C_out)
    );
    
    // ʱ�Ӳ��������� 10 ns
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // ��ʼ�� A��B ����ȫ���� 0
   
    initial begin
        A[0] = 2'b10;
        A[1] = 2'b01;
        A[2] = 2'b11;
        A[3] = 2'b01;
        
        B[0] = 2'b11;
        B[1] = 2'b01;
        B[2] = 2'b01;
        B[3] = 2'b11;
    end
    
    // ��λ�������۲츴λ�ڼ���ź�״̬
    initial begin
        // ��ʼ��λ������һ��ʱ����ͷ�
        rst = 1;
        // done �� clr ���ﲻ����������Ϊģ���ڲ���ֵ��������Ϊ0
        done = 0;
        clr  = 0;
        #10;
        rst = 0;
        // ����һ��ʱ����������
        #30000;
        $finish;
    end
    
    // ��� DUT �ڲ����źż����
    // ע�⣺������÷����ڲ��źţ��� dut.C��dut.t �ȣ�
    initial begin
        $monitor("Time=%0t | rst=%b | C=%b | t=%b | bit_array=%b | clr=%b | done=%b | C_out=%b|C_reg=%b", 
                 $time, rst, dut.C, dut.t, dut.bit_array, dut.clr, dut.done, C_out,dut.SA.C_reg);
    end

endmodule
