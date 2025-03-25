`timescale 1ns / 1ps

module PE_tb;
    // ��������
    parameter DATA_WITH = 8;
    parameter M         = 8;
    parameter K         = 8;
    parameter N         = 8;
    
    // ʱ�Ӻ͸�λ�ź�
    reg clk;
    reg rst;
    reg clr;
    
    // �����ź�
    reg [DATA_WITH:0] g1_in;
    reg [DATA_WITH:0] g2_in;
    reg [DATA_WITH:0] y1_in;
    reg [DATA_WITH:0] y2_in;
    reg [2*DATA_WITH+$clog2(DATA_WITH)-1:0] C_in;
    
    // ����ź�
    wire [DATA_WITH:0] g1_out;
    wire [DATA_WITH:0] g2_out;
    wire [DATA_WITH:0] y1_out;
    wire [DATA_WITH:0] y2_out;
    wire [2*DATA_WITH+$clog2(DATA_WITH)-1:0] C_out;
    
    // ʵ��������ģ��
    PE #(
        .DATA_WITH(DATA_WITH),
        .M(M),
        .K(K),
        .N(N)
    ) dut (
        .clk(clk),
        .rst(rst),
        .clr(clr),
        .g1_in(g1_in),
        .g2_in(g2_in),
        .y1_in(y1_in),
        .y2_in(y2_in),
        .C_in(C_in),
        .g1_out(g1_out),
        .g2_out(g2_out),
        .y1_out(y1_out),
        .y2_out(y2_out),
        .C_out(C_out)
    );
    
    // ʱ�Ӳ�����ÿ5ns��תһ�Σ�����10ns
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // ���Լ���
    initial begin
        // ��ʼ״̬����λʹ��
        rst   = 1;
        clr   = 0;
        g1_in = 0;
        g2_in = 0;
        y1_in = 0;
        y2_in = 0;
        C_in  = 0;
        
        // ���ָ�λһ��ʱ��
        #12;
        rst = 0;
        
        // ��һ��������ԣ���������
        // ��ʱ g1_out = g1_in + y1_in, g2_out = g2_in + y2_in
        g1_in = 9;
        y1_in = 3;
        g2_in = 4;
        y2_in = 2;
        C_in  = 10;
        #10;
        $display("Time %t: g1_out = %d, g2_out = %d, C_out = %d", $time, g1_out, g2_out, C_out);
        
        // ʩ�������źţ�ģ��ͬ�����㣨clr��Ч1��ʱ�����ڣ�
        clr = 1;
        #10;
        clr = 0;
        $display("After clear, Time %t: g1_out = %d, g2_out = %d, C_out = %d", $time, g1_out, g2_out, C_out);
        
        // �ڶ����������
        g1_in = 15;
        y1_in = 1;
        g2_in = 2;
        y2_in = 3;
        C_in  = 5;
        #10;
        $display("Time %t: g1_out = %d, g2_out = %d, C_out = %d", $time, g1_out, g2_out, C_out);
        
        // ��������
        #20;
        $finish;
    end

endmodule
