module Base_top_tb;  
    parameter int DATA_WIDTH = 2;
    parameter int M = 4;
    parameter int K = 4;
    parameter int N = 4;

    reg clk_p, clk_n; // ���ʱ��
    reg rst;          
    wire  [(2*DATA_WIDTH):0] C [M][N]; 
    wire gen_array, start_cal, done_cal; // ����ź�

    // ʵ���� Base_top
    Base_top #(.DATA_WIDTH(DATA_WIDTH), .M(M), .K(K), .N(N)) uut (
        .clk_p(clk_p),
        .clk_n(clk_n),
        .rst(rst),
        .C(C)
    );

    // ���� Base_top �ڲ��ź�
    assign gen_array = uut.gen_array;
    assign start_cal = uut.start_cal;
    assign done_cal = uut.done_cal;

    // ʱ���ź�ģ��
    initial begin
        clk_p = 0;
        clk_n = 1;
        forever #5 clk_p = ~clk_p; // 10ns ʱ������
    end

    always @(clk_p) clk_n = ~clk_p; // ���ɲ��ʱ���ź�

    // �������
    initial begin
        $dumpfile("Base_top_tb.vcd");
        $dumpvars(0, Base_top_tb);
        // ��λ
        rst = 1;
        #20 rst = 0;
        // ���� 10000ns
        #100000;
        $finish;
    end

    // ���� gen_array, start_cal, done_cal �Լ� A, B, C
    always @(posedge clk_p) begin
        $display("------ Time=%0t ------", $time);
        $display("gen_array = %b, start_cal = %b, done_cal = %b", gen_array, start_cal, done_cal);

        // ��ӡ A ����ͨ��������÷��� Base_top �ڲ��� A��
        $display("Matrix A:");
        for (int i = 0; i < M; i++) begin
            for (int j = 0; j < K; j++) begin
                $write("%d ", uut.A[i][j]);
            end
            $write("\n");
        end

        // ��ӡ B ����ͨ��������÷��� Base_top �ڲ��� B��
        $display("Matrix B:");
        for (int i = 0; i < K; i++) begin
            for (int j = 0; j < N; j++) begin
                $write("%d ", uut.B[i][j]);
            end
            $write("\n");
        end

        // ��ӡ C ����
        $display("Matrix C:");
        for (int i = 0; i < M; i++) begin
            for (int j = 0; j < N; j++) begin
                $write("%d ", C[i][j]);
            end
            $write("\n");
        end
        $display("----------------------\n");
    end

endmodule
