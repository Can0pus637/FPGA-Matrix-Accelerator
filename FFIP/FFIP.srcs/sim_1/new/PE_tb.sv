`timescale 1ns / 1ps

module PE_tb;
    // 参数定义
    parameter DATA_WITH = 8;
    parameter M         = 8;
    parameter K         = 8;
    parameter N         = 8;
    
    // 时钟和复位信号
    reg clk;
    reg rst;
    reg clr;
    
    // 输入信号
    reg [DATA_WITH:0] g1_in;
    reg [DATA_WITH:0] g2_in;
    reg [DATA_WITH:0] y1_in;
    reg [DATA_WITH:0] y2_in;
    reg [2*DATA_WITH+$clog2(DATA_WITH)-1:0] C_in;
    
    // 输出信号
    wire [DATA_WITH:0] g1_out;
    wire [DATA_WITH:0] g2_out;
    wire [DATA_WITH:0] y1_out;
    wire [DATA_WITH:0] y2_out;
    wire [2*DATA_WITH+$clog2(DATA_WITH)-1:0] C_out;
    
    // 实例化被测模块
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
    
    // 时钟产生，每5ns翻转一次，周期10ns
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // 测试激励
    initial begin
        // 初始状态：复位使能
        rst   = 1;
        clr   = 0;
        g1_in = 0;
        g2_in = 0;
        y1_in = 0;
        y2_in = 0;
        C_in  = 0;
        
        // 保持复位一段时间
        #12;
        rst = 0;
        
        // 第一组输入测试：正常运算
        // 此时 g1_out = g1_in + y1_in, g2_out = g2_in + y2_in
        g1_in = 9;
        y1_in = 3;
        g2_in = 4;
        y2_in = 2;
        C_in  = 10;
        #10;
        $display("Time %t: g1_out = %d, g2_out = %d, C_out = %d", $time, g1_out, g2_out, C_out);
        
        // 施加清零信号，模拟同步清零（clr有效1个时钟周期）
        clr = 1;
        #10;
        clr = 0;
        $display("After clear, Time %t: g1_out = %d, g2_out = %d, C_out = %d", $time, g1_out, g2_out, C_out);
        
        // 第二组输入测试
        g1_in = 15;
        y1_in = 1;
        g2_in = 2;
        y2_in = 3;
        C_in  = 5;
        #10;
        $display("Time %t: g1_out = %d, g2_out = %d, C_out = %d", $time, g1_out, g2_out, C_out);
        
        // 结束仿真
        #20;
        $finish;
    end

endmodule
