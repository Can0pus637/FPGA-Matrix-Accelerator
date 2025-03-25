`timescale 1ns / 1ps

module tb_LUT;

    // 参数定义，与 LUT 模块一致
    parameter DATA_WIDTH = 2;
    parameter M = 4;
    parameter N = 4;
    parameter K = 4;
    
    // 信号声明
    logic rst;
    logic clk;
    // 由于 LUT 模块的 done、clr 是端口信号，但内部也由模块产生，
    // 这里暂时用常数给定（不驱动），实际设计时建议去掉端口定义
    logic done;
    logic clr;
    
    // A、B 数组置零（不需要真实输入）
    logic [DATA_WIDTH-1:0] A [K];
    logic [DATA_WIDTH-1:0] B [K];
    
    // 输出 C_out
    logic [2*DATA_WIDTH:0] C_out;
    
    // 实例化 DUT
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
    
    // 时钟产生：周期 10 ns
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // 初始化 A、B 数组全部置 0
   
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
    
    // 复位激励：观察复位期间各信号状态
    initial begin
        // 开始复位，保持一段时间后释放
        rst = 1;
        // done 和 clr 这里不用驱动（因为模块内部赋值），可置为0
        done = 0;
        clr  = 0;
        #10;
        rst = 0;
        // 运行一段时间后结束仿真
        #30000;
        $finish;
    end
    
    // 监控 DUT 内部的信号及输出
    // 注意：层次引用访问内部信号（如 dut.C、dut.t 等）
    initial begin
        $monitor("Time=%0t | rst=%b | C=%b | t=%b | bit_array=%b | clr=%b | done=%b | C_out=%b|C_reg=%b", 
                 $time, rst, dut.C, dut.t, dut.bit_array, dut.clr, dut.done, C_out,dut.SA.C_reg);
    end

endmodule
