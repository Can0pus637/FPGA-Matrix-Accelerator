`timescale 1ns / 1ps

module SystolicArray_tb;
    parameter DATA_WIDTH = 8;
    parameter M = 2;
    parameter N = 2;
    parameter K = 2;


    logic clk;
    logic rst;
    logic signed [DATA_WIDTH-1:0] A [M][K];
    logic signed [DATA_WIDTH-1:0] B [K][N];
    logic signed [(2*DATA_WIDTH)-1:0] C [M][N];


    SystolicArray #(
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

 
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        A = '{default: 0};  
        B = '{default: 0};  
        
        #10 rst = 0;  
        A[0][0] = 8'd1; A[0][1] = 8'd2;
        A[1][0] = 8'd3; A[1][1] = 8'd4;

        B[0][0] = 8'd5; B[0][1] = 8'd6;
        B[1][0] = 8'd7; B[1][1] = 8'd8;
    end
    always @(posedge clk) begin
        $display("\n======= t = %0d =======", dut.t);
        $display("A Pipe:");
        for (int i = 0; i < M; i++) begin
            for (int j = 0; j < K+1; j++)
                $write("%d ", dut.apipe[i][j]);
            $write("\n");
        end
        $display("B Pipe:");
        for (int i = 0; i < K+1; i++) begin
            for (int j = 0; j < N; j++)
                $write("%d ", dut.bpipe[i][j]);
            $write("\n");
        end
        $display("C Pipe:");
        for (int i = 0; i < K; i++) begin
            for (int j = 0; j < N; j++)
                $write("%d ", dut.cpipe[i][j]);
            $write("\n");
        end
    end

endmodule
