`timescale 1ns/1ps

module tb_Array_Input;

    // 参数定义
    parameter DATA_WIDTH = 2;
    parameter M = 4;
    parameter N = 4;
    parameter K = 4;

    // 信号定义
    logic clk;
    logic rst;
    logic done;
    logic clr;
    
    // A: 4行，每行K个数据
    logic [DATA_WIDTH-1:0] A [0:M-1][0:K-1];
    // B: K行，每行N个数据
    logic [DATA_WIDTH-1:0] B [0:K-1][0:N-1];
    // 输出矩阵
    logic [2*DATA_WIDTH+1:0] C_out [0:M-1][0:N-1];

    // DUT 实例化
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

    // 时钟生成：周期 10ns
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // 激励信号
    initial begin
        integer i, j;
        // 初始信号
        rst = 1;
        done = 0;
        clr = 0;
        
        // 初始化 A 数组，举例赋值为行号
        for(i = 0; i < M; i = i + 1)
            for(j = 0; j < K; j = j + 1)
                A[i][j] = i;
                
        // 初始化 B 数组，举例赋值为列号
        for(i = 0; i < K; i = i + 1)
            for(j = 0; j < N; j = j + 1)
                B[i][j] = j;
        
        // 保持复位一段时间后释放
        #15;
        rst = 0;
        
        // 模拟一次运算触发
        #20;
        done = 1;
        #10;
        done = 0;
        
        // 模拟清零操作
        #30;
        clr = 1;
        #10;
        clr = 0;
        
        // 继续运行一段时间后结束仿真
        #100;
        $finish;
    end

    // 每个时钟周期打印整个 C_out 矩阵
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
