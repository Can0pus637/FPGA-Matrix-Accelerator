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

    // ���� random_matrix ���ɵ� A �� B ����
    logic [DATA_WIDTH-1:0] A [M][K];
    logic [DATA_WIDTH-1:0] B [K][N];

    // Array_Input ���������
  //  logic [2*DATA_WIDTH+1:0] C_out [M][N];

    // ���� done �� clr �źſ��Ը���ʵ��������ƣ�������ʱ����

    assign done = 1'b0;
    assign clr  = 1'b0;

    // ʵ���� random_matrix ģ��
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

    // ʵ���� Array_Input ģ��
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
