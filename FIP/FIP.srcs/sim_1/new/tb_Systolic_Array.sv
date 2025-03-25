module Systolic_Array_tb;   
    // ����
    parameter DATA_WIDTH = 8;
    parameter M = 4;
    parameter N = 4;
    parameter K = 4;

    // �źŶ���
    logic clk;
    logic rst;
    logic [DATA_WIDTH-1:0] A [M][K];  
    logic [DATA_WIDTH-1:0] B [K][N];  
    logic [2*DATA_WIDTH+4:0] C [M][N]; 

    // ʵ��������ģ�飨DUT��
    Systolic_Array #(
        .DATA_WIDTH(DATA_WIDTH),
        .M(M),
        .N(N),
        .K(K)
    ) dut (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .C(C)
    );

    // ����ʱ���ź�
    always #5 clk = ~clk; // 10ns���ڣ�100MHzʱ��

    // ��ʼ��
    initial begin
        $dumpfile("systolic_array_tb.vcd"); // �����ļ�
        $dumpvars(0, Systolic_Array_tb); 

        clk = 0;
        rst = 1;

        // ��λ
        #20 rst = 0;

        // **��д A ����1 �� 16**
        A[0][0] = 1;  A[0][1] = 2;  A[0][2] = 3;  A[0][3] = 4;
        A[1][0] = 5;  A[1][1] = 6;  A[1][2] = 7;  A[1][3] = 8;
        A[2][0] = 9;  A[2][1] = 10; A[2][2] = 11; A[2][3] = 12;
        A[3][0] = 13; A[3][1] = 14; A[3][2] = 15; A[3][3] = 16;

        // **��д B ����17 �� 32**
        B[0][0] = 17; B[0][1] = 18; B[0][2] = 19; B[0][3] = 20;
        B[1][0] = 21; B[1][1] = 22; B[1][2] = 23; B[1][3] = 24;
        B[2][0] = 25; B[2][1] = 26; B[2][2] = 27; B[2][3] = 28;
        B[3][0] = 29; B[3][1] = 30; B[3][2] = 31; B[3][3] = 32;

        // ���в���ӡ�ܵ����ݡ�cpipe_next�Լ� Systolic_Array_end
        for (int t = 0; t < 20; t++) begin
            #10; // �ȴ�һ��ʱ������

            $display("=== Cycle %d ===", t);
            $display("Systolic_Array_end = %d", dut.Systolic_Array_end);
            $display("clr = %d", dut.clr);
            // **��ӡ apipe1 �� apipe2**
            $display("apipe1:");
            for (int i = 0; i < N+1; i++) begin
                for (int j = 0; j < M; j++) begin
                    $write("%d ", dut.apipe1[i][j]);
                end
                $display;
            end

            $display("apipe2:");
            for (int i = 0; i < N+1; i++) begin
                for (int j = 0; j < M; j++) begin
                    $write("%d ", dut.apipe2[i][j]);
                end
                $display;
            end

            // **��ӡ bpipe1 �� bpipe2**
            $display("bpipe1:");
            for (int i = 0; i < N; i++) begin
                for (int j = 0; j < M+1; j++) begin
                    $write("%d ", dut.bpipe1[i][j]);
                end
                $display;
            end

            $display("bpipe2:");
            for (int i = 0; i < N; i++) begin
                for (int j = 0; j < M+1; j++) begin
                    $write("%d ", dut.bpipe2[i][j]);
                end
                $display;
            end

            // **��ӡ cpipe_next**
            $display("cpipe_next:");
            for (int i = 0; i < N; i++) begin
                for (int j = 0; j < M; j++) begin
                    $write("%d ", dut.cpipe_next[i][j]);
                end
                $display;
            end
            
        end

        #20;
        
    end

endmodule
