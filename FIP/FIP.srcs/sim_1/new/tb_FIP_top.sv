`timescale 1ns/1ps
module tb_FIP_top;
    // ��������
    parameter DATA_WIDTH = 2;
    parameter M = 6;
    parameter N = 6;
    parameter K = 6;

    // ���ʱ���ź�
    reg clk_p;
    reg clk_n;

    // ��λ
    reg rst;

    // ʵ��������ģ�� FIP_top
    FIP_top #(
        .DATA_WIDTH(DATA_WIDTH), 
        .M(M), 
        .N(N), 
        .K(K)
    ) dut (
        .clk_p(clk_p),
        .clk_n(clk_n),
        .rst(rst),
        .C()  // ������� C������۲�ɲ㼶���� dut.C
    );

    // ���ʱ�Ӳ�����10 ns���ڣ���Ƶ��100 MHz��
    // clk_p��ת�󣬽�������clk_n��clk_p�෴
    initial begin
        clk_p = 0;
        clk_n = 1;
        forever #5 clk_p = ~clk_p; // ÿ5ns��תһ�� -> ����10ns
    end

    always @(clk_p) clk_n = ~clk_p; // ���ֲ�ּ����෴

    // ��λ�źŲ���
    initial begin
        rst = 1;
        #10;
        rst = 0;
    end

    // ÿ������ʱ��ӡ������Ϣ
    // ����ʵ������� IBUFGDS ����� clk �������������߼���ʱ�ӣ�
    // ����򻯴���ֱ���� clk_p �������ش�ӡ���ɡ�
    // ���뾫ȷͬ��������ڲ� clk�������ò������ dut.clk��
    always @(posedge clk_p) begin
        if (!rst) begin
            $display("===== Time = %0t =====", $time);
            $display("t = %0d, clr_all = %b, gen_array = %b", dut.t, dut.clr_all, dut.gen_array);
            $display("Systolic_Array_end = %b, Alpha_Beta_end = %b", dut.Systolic_Array_end, dut.Alpha_Beta_end);
            $display("Systolic_Array_count = %b", dut.Systolic_Array.Systolic_Array_count);

            // ��ӡ���� Systolic_Array_result (�������м���)
            $display("Systolic_Array_result:");
            for (int i = 0; i < M; i++) begin
                for (int j = 0; j < N; j++) begin
                    $write("%0d ", dut.Systolic_Array_result[i][j]);
                end
                $display("");
            end

            // ��ӡ Alpha �� Beta ����
            $display("Alpha:");
            for (int i = 0; i < M; i++) begin
                $write("%0d ", dut.Alpha[i]);
            end
            $display("");

            $display("Beta:");
            for (int j = 0; j < N; j++) begin
                $write("%0d ", dut.Beta[j]);
            end
            $display("");

            // ��ӡ����������ɵ� Matrix A �� Matrix B
            $display("Top-level Matrix A:");
            for (int i = 0; i < M; i++) begin
                for (int j = 0; j < K; j++) begin
                    $write("%0d ", dut.A[i][j]);
                end
                $display("");
            end
            $display("Top-level Matrix B:");
            for (int i = 0; i < K; i++) begin
                for (int j = 0; j < N; j++) begin
                    $write("%0d ", dut.B[i][j]);
                end
                $display("");
            end

            // �����ڲ��źŴ�ӡ��apipe1��apipe2 �ȣ����ֲ���
            $display("apipe1:");
            for (int i = 0; i < dut.Systolic_Array.N; i++) begin
                for (int j = 0; j < dut.Systolic_Array.M+1; j++) begin
                    $write("%0d ", dut.Systolic_Array.apipe1[i][j]);
                end
                $display("");
            end

            $display("apipe2:");
            for (int i = 0; i < dut.Systolic_Array.N; i++) begin
                for (int j = 0; j < dut.Systolic_Array.M+1; j++) begin
                    $write("%0d ", dut.Systolic_Array.apipe2[i][j]);
                end
                $display("");
            end

            $display("cpipe_next:");
            for (int i = 0; i < dut.Systolic_Array.N; i++) begin
                for (int j = 0; j < dut.Systolic_Array.M; j++) begin
                    $write("%0d ", dut.Systolic_Array.C[i][j]);
                end
                $display("");
            end

            $display("c:");
            for (int i = 0; i < N; i++) begin
                for (int j = 0; j < M; j++) begin
                    $write("%0d ", dut.C[i][j]);
                end
                $display("");
            end

            $display("----------------------------------------------------");
        end
    end

    // ��������
    initial begin
        #3000;
        $finish;
    end

endmodule
