`timescale 1ns / 1ps

module PE_tb;
    parameter DATA_WIDTH = 8;

    // �ź�����
    logic clk;
    logic rst;
    logic  [DATA_WIDTH-1:0] A_in, B_in;
    logic  [(2*DATA_WIDTH):0] C_in;
    logic  [DATA_WIDTH-1:0] A_out, B_out;
    logic  [(2*DATA_WIDTH):0] C_out;
    logic valid_A, valid_B;

    // ʵ���� PE
    PE #(.DATA_WIDTH(DATA_WIDTH)) dut (
        .clk(clk),
        .rst(rst),
        .A_in(A_in),
        .B_in(B_in),
        .C_in(C_in),
        .A_out(A_out),
        .B_out(B_out),
        .C_out(C_out),
        .valid_A(valid_A),
        .valid_B(valid_B)
    );

    // ����ʱ�ӣ�10ns ���ڣ�100MHz��
    always #5 clk = ~clk;

    initial begin
        // **1. ��ʼ��**
        clk = 0;
        rst = 1;
        A_in = 0;
        B_in = 0;
        C_in = 0;
        valid_A = 0;
        valid_B = 0;

        #20 rst = 0;  // **�ͷŸ�λ**

        // **2. �������ݴ��䣨�޼��㣩**
        #10;
        A_in = 8'd3; B_in = 8'd4; 
        #10;
        A_in = 8'd5; B_in = 8'd6; 
        #10;
        A_in = 8'd7; B_in = 8'd8; 

        // **3. ���Լ��㣨MAC��**
        #10;
        C_in = 16'd10;  // **��ʼ C ֵ**
        A_in = 8'd2; B_in = 8'd3; 
        #10;
        A_in = 8'd4; B_in = 8'd5; 
        #10;
        valid_A = 0; valid_B = 0;  // ֹͣ���룬C_out Ӧ�ñ��� 36

        // **4. ��������**
        #10;
        $display("\n======= PE ������� =======");
        $display("���� C_out = %d", C_out);
        $stop;
    end

    // **����ź�**
    initial begin
        $monitor("Time=%0t, A_in=%d, B_in=%d, C_in=%d, A_out=%d, B_out=%d, C_out=%d, valid_A=%b, valid_B=%b",
                 $time, A_in, B_in, C_in, A_out, B_out, C_out, valid_A, valid_B);
    end

endmodule
