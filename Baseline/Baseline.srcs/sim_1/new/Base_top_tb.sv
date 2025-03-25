module Base_top_tb;  
    parameter int DATA_WIDTH = 2;
    parameter int M = 4;
    parameter int K = 4;
    parameter int N = 4;

    reg clk_p, clk_n; // 差分时钟
    reg rst;          
    wire  [(2*DATA_WIDTH):0] C [M][N]; 
    wire gen_array, start_cal, done_cal; // 监测信号

    // 实例化 Base_top
    Base_top #(.DATA_WIDTH(DATA_WIDTH), .M(M), .K(K), .N(N)) uut (
        .clk_p(clk_p),
        .clk_n(clk_n),
        .rst(rst),
        .C(C)
    );

    // 访问 Base_top 内部信号
    assign gen_array = uut.gen_array;
    assign start_cal = uut.start_cal;
    assign done_cal = uut.done_cal;

    // 时钟信号模拟
    initial begin
        clk_p = 0;
        clk_n = 1;
        forever #5 clk_p = ~clk_p; // 10ns 时钟周期
    end

    always @(clk_p) clk_n = ~clk_p; // 生成差分时钟信号

    // 仿真过程
    initial begin
        $dumpfile("Base_top_tb.vcd");
        $dumpvars(0, Base_top_tb);
        // 复位
        rst = 1;
        #20 rst = 0;
        // 运行 10000ns
        #100000;
        $finish;
    end

    // 监视 gen_array, start_cal, done_cal 以及 A, B, C
    always @(posedge clk_p) begin
        $display("------ Time=%0t ------", $time);
        $display("gen_array = %b, start_cal = %b, done_cal = %b", gen_array, start_cal, done_cal);

        // 打印 A 矩阵（通过层次引用访问 Base_top 内部的 A）
        $display("Matrix A:");
        for (int i = 0; i < M; i++) begin
            for (int j = 0; j < K; j++) begin
                $write("%d ", uut.A[i][j]);
            end
            $write("\n");
        end

        // 打印 B 矩阵（通过层次引用访问 Base_top 内部的 B）
        $display("Matrix B:");
        for (int i = 0; i < K; i++) begin
            for (int j = 0; j < N; j++) begin
                $write("%d ", uut.B[i][j]);
            end
            $write("\n");
        end

        // 打印 C 矩阵
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
