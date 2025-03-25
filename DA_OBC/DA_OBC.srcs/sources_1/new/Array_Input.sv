`timescale 1ns / 1ps

module Array_Input#(
    parameter DATA_WIDTH=3,
    parameter M=4,
    parameter N=4,
    parameter K=4
    )(
    input clk,
    input rst,
    input gen_done,
    input clr,
    input logic  signed[DATA_WIDTH-1:0] A[M][K],
    input logic signed[DATA_WIDTH-1:0] B[K][N],
    output logic signed[2*DATA_WIDTH+1:0] C_out[M][N]
    );
//    logic Apipe[M][K+1];
//    logic Bpipe[K+1][N];
//    logic [7:0] t;
//    always_ff@(posedge clk or posedge rst)begin
//    if(rst)begin 
//        end else begin
//        end
//    end    
    genvar i, j, k;
    generate
        for(i = 0; i < M; i = i + 1) begin: gen_rows
            for(j = 0; j < N; j = j + 1) begin: gen_cols
                logic [DATA_WIDTH-1:0] B_temp [K];
                for(k = 0; k < K; k = k + 1) begin: extract_B
                    assign B_temp[k] = B[k][j];
                end
                
                LUT #(
                    .DATA_WIDTH(DATA_WIDTH),
                    .M(M),
                    .N(N),
                    .K(K)
                ) LUT_inst (
                    .rst(rst),
                    .clk(clk),
                    .gen_done(gen_done),
                    .A(A[i]),    
                    .B(B_temp), 
                    .C_out(C_out[i][j])
                );
            end
        end
    endgenerate
endmodule
