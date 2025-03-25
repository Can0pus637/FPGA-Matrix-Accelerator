`timescale 1ns / 1ps

module PE_tb;
    parameter DATA_WIDTH = 8;

    // 信号声明
    logic clk;
    logic rst;
    logic  [DATA_WIDTH-1:0] A_in, B_in;
    logic  [(2*DATA_WIDTH):0] C_in;
    logic  [DATA_WIDTH-1:0] A_out, B_out;
    logic  [(2*DATA_WIDTH):0] C_out;
    logic valid_A, valid_B;

    // 实例化 PE
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

    // 生成时钟（10ns 周期，100MHz）
    always #5 clk = ~clk;

    initial begin
        // **1. 初始化**
        clk = 0;
        rst = 1;
        A_in = 0;
        B_in = 0;
        C_in = 0;
        valid_A = 0;
        valid_B = 0;

        #20 rst = 0;  // **释放复位**

        // **2. 测试数据传输（无计算）**
        #10;
        A_in = 8'd3; B_in = 8'd4; 
        #10;
        A_in = 8'd5; B_in = 8'd6; 
        #10;
        A_in = 8'd7; B_in = 8'd8; 

        // **3. 测试计算（MAC）**
        #10;
        C_in = 16'd10;  // **初始 C 值**
        A_in = 8'd2; B_in = 8'd3; 
        #10;
        A_in = 8'd4; B_in = 8'd5; 
        #10;
        valid_A = 0; valid_B = 0;  // 停止输入，C_out 应该保持 36

        // **4. 结束仿真**
        #10;
        $display("\n======= PE 计算完成 =======");
        $display("最终 C_out = %d", C_out);
        $stop;
    end

    // **监测信号**
    initial begin
        $monitor("Time=%0t, A_in=%d, B_in=%d, C_in=%d, A_out=%d, B_out=%d, C_out=%d, valid_A=%b, valid_B=%b",
                 $time, A_in, B_in, C_in, A_out, B_out, C_out, valid_A, valid_B);
    end

endmodule
