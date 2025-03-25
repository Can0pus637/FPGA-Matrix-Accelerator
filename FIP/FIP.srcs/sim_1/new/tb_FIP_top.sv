`timescale 1ns/1ps
module tb_FIP_top;
    // 参数定义
    parameter DATA_WIDTH = 2;
    parameter M = 6;
    parameter N = 6;
    parameter K = 6;

    // 差分时钟信号
    reg clk_p;
    reg clk_n;

    // 复位
    reg rst;

    // 实例化顶层模块 FIP_top
    FIP_top #(
        .DATA_WIDTH(DATA_WIDTH), 
        .M(M), 
        .N(N), 
        .K(K)
    ) dut (
        .clk_p(clk_p),
        .clk_n(clk_n),
        .rst(rst),
        .C()  // 最终输出 C，如需观察可层级引用 dut.C
    );

    // 差分时钟产生：10 ns周期（即频率100 MHz）
    // clk_p翻转后，紧跟着让clk_n与clk_p相反
    initial begin
        clk_p = 0;
        clk_n = 1;
        forever #5 clk_p = ~clk_p; // 每5ns翻转一次 -> 周期10ns
    end

    always @(clk_p) clk_n = ~clk_p; // 保持差分极性相反

    // 复位信号产生
    initial begin
        rst = 1;
        #10;
        rst = 0;
    end

    // 每个正沿时打印调试信息
    // 由于实际设计中 IBUFGDS 输出的 clk 才是真正用于逻辑的时钟，
    // 这里简化处理，直接在 clk_p 的上升沿打印即可。
    // 若想精确同步到设计内部 clk，可以用层次引用 dut.clk。
    always @(posedge clk_p) begin
        if (!rst) begin
            $display("===== Time = %0t =====", $time);
            $display("t = %0d, clr_all = %b, gen_array = %b", dut.t, dut.clr_all, dut.gen_array);
            $display("Systolic_Array_end = %b, Alpha_Beta_end = %b", dut.Systolic_Array_end, dut.Alpha_Beta_end);
            $display("Systolic_Array_count = %b", dut.Systolic_Array.Systolic_Array_count);

            // 打印顶层 Systolic_Array_result (即最终中间结果)
            $display("Systolic_Array_result:");
            for (int i = 0; i < M; i++) begin
                for (int j = 0; j < N; j++) begin
                    $write("%0d ", dut.Systolic_Array_result[i][j]);
                end
                $display("");
            end

            // 打印 Alpha 和 Beta 数组
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

            // 打印顶层随机生成的 Matrix A 和 Matrix B
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

            // 其它内部信号打印（apipe1、apipe2 等）保持不变
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

    // 结束仿真
    initial begin
        #3000;
        $finish;
    end

endmodule
