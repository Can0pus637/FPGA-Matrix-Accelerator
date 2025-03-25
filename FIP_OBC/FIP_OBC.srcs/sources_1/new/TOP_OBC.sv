`timescale 1ns / 1ps

module TOP_OBC #(
    parameter DATA_WIDTH = 3,
    parameter M = 4,
    parameter N = 4,
    parameter K = 4
)(
    input  clk,
    input  rst,
    output logic [2*DATA_WIDTH+1:0] C_out[M][N]
);

    // 声明 random_matrix 生成的 A 和 B 矩阵
    logic [DATA_WIDTH-1:0] A [M][K];
    logic [DATA_WIDTH-1:0] B [K][N];

    // Array_Input 的输出矩阵
  //  logic [2*DATA_WIDTH+1:0] C_out [M][N];

    // 这里 done 与 clr 信号可以根据实际需求设计，这里暂时拉低

    assign done = 1'b0;
    assign clr  = 1'b0;

    // 实例化 random_matrix 模块
    random_matrix #(
        .DATA_WIDTH(DATA_WIDTH),
        
        .M(M),
        .K(K),
        .N(N)
    ) u_random_matrix (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .gen_done(gen_done)
    );

    // 实例化 Array_Input 模块
    FIP_OBC #(
        .DATA_WIDTH(DATA_WIDTH),
        .M(M),
        .N(N),
        .K(K)
    ) u_Array_Input (
        .clk(clk),
        .rst(rst),
        .gen_done(gen_done),
        .A(A),
        .B(B),
        .final_out(C_out)
    );

endmodule
