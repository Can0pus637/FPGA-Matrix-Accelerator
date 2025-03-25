`timescale 1ns/1ps

module tb_Array_Input;

    // ��������
    parameter DATA_WIDTH = 2;
    parameter M = 4;
    parameter N = 4;
    parameter K = 4;

    // �źŶ���
    logic clk;
    logic rst;
    logic done;
    logic clr;
    
    // A: 4�У�ÿ��K������
    logic [DATA_WIDTH-1:0] A [0:M-1][0:K-1];
    // B: K�У�ÿ��N������
    logic [DATA_WIDTH-1:0] B [0:K-1][0:N-1];
    // �������
    logic [2*DATA_WIDTH+1:0] C_out [0:M-1][0:N-1];

    // DUT ʵ����
    Array_Input #(
        .DATA_WIDTH(DATA_WIDTH),
        .M(M),
        .N(N),
        .K(K)
    ) dut (
        .clk(clk),
        .rst(rst),
        .done(done),
        .clr(clr),
        .A(A),
        .B(B),
        .C_out(C_out)
    );

    // ʱ�����ɣ����� 10ns
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // �����ź�
    initial begin
        integer i, j;
        // ��ʼ�ź�
        rst = 1;
        done = 0;
        clr = 0;
        
        // ��ʼ�� A ���飬������ֵΪ�к�
        for(i = 0; i < M; i = i + 1)
            for(j = 0; j < K; j = j + 1)
                A[i][j] = i;
                
        // ��ʼ�� B ���飬������ֵΪ�к�
        for(i = 0; i < K; i = i + 1)
            for(j = 0; j < N; j = j + 1)
                B[i][j] = j;
        
        // ���ָ�λһ��ʱ����ͷ�
        #15;
        rst = 0;
        
        // ģ��һ�����㴥��
        #20;
        done = 1;
        #10;
        done = 0;
        
        // ģ���������
        #30;
        clr = 1;
        #10;
        clr = 0;
        
        // ��������һ��ʱ����������
        #100;
        $finish;
    end

    // ÿ��ʱ�����ڴ�ӡ���� C_out ����
    always @(posedge clk) begin
        integer i, j;
        $display("Time: %0t", $time);
        for(i = 0; i < M; i = i + 1) begin
            $write("Row %0d: ", i);
            for(j = 0; j < N; j = j + 1) begin
                $write("%0d ", C_out[i][j]);
            end
            $display("");
        end
        $display("--------------------------------------------------");
    end

endmodule
