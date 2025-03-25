module Base_top_tb;
    parameter int DATA_WIDTH = 8;
    parameter int M = 100;
    parameter int K = 100;
    parameter int N = 100;

    reg clk_p, clk_n; // ���ʱ��
    reg rst;          
    wire signed [DATA_WIDTH-1:0] A [M][K]; // ȷ�� A �� Base_top ����
    wire signed [DATA_WIDTH-1:0] B [K][N]; // ȷ�� B �� Base_top ����
    wire signed [(2*DATA_WIDTH)-1:0] C [M][N]; 

    // ʵ���� Base_top
    Base_top #(.DATA_WIDTH(DATA_WIDTH), .M(M), .K(K), .N(N)) uut (
        .clk_p(clk_p),
        .clk_n(clk_n),
        .rst(rst),
        .C(C),
        .A(A),  // ���� A
        .B(B)   // ���� B
    );

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
        #10 rst = 0;

        // ���� 200 ns
        #200;
        $finish;
    end

    // ���� A, B, C
    always @(posedge clk_p) begin
        $display("------ Time=%0t ------", $time);
        
        $display("Matrix A:");
        for (int i = 0; i < M; i++) begin
            for (int j = 0; j < K; j++) begin
                $write("%d ", A[i][j]);
            end
            $write("\n");
        end

        $display("Matrix B:");
        for (int i = 0; i < K; i++) begin
            for (int j = 0; j < N; j++) begin
                $write("%d ", B[i][j]);
            end
            $write("\n");
        end

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
