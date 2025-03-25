`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/19 15:51:21
// Design Name: 
// Module Name: Array
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Array#(
    parameter DATA_WITH=8,
    parameter M=4,
    parameter K=4,
    parameter N=4
    )(
    input clk,
    input rst,
    input clr,
    input logic [DATA_WITH-1:0] A[M][K],
    input logic [DATA_WITH-1:0] B[K][N],
    output logic [DATA_WITH-1:0] C[M][N]
    );

    logic [8:0] t;

    logic [DATA_WITH:0] Y[K+1][N];
    logic [DATA_WITH:0] G[K+1][N];
    logic [2*DATA_WITH+$clog2(DATA_WITH)-1:0] C_reg;
    always_ff @(posedge clk or posedge rst)begin
    if(rst) begin
        for(int m;m<M;m++)
           for(int n;n<N;n++) begin
                C[m][n]<=0;
           end
        
        for(int k;k<K;k++) 
            for(int n;n<N;n++)begin
                Y[k][n]<=0;
                G[k][n]<=0;
           end
         t<=0;
         

    end else if(clr)begin
        
    end else begin

        if (t == 0&&t<N) begin
            for (int i = 0; i < K; i++) begin
                Y[i][t] <= B[i][t];
            end
        end else begin
            for (int i = 0; i < K; i++) begin
                Y[i][t] <= B[i][t] - B[i][t-1];
            end
        end
        
        
        if (t ==1&&t-1<K ) begin
            for (int j = 0; 2*j < K; j++) begin
                G[t-1][2*j]   <= A[t-1][2*j+1] + Y[2*j][t-1];
                G[t-1][2*j+1] <= A[t-1][2*j]   + Y[2*j+1][t-1];
            end
        
            //for (int j = 0; 2*j < K; j++) begin   
//                g1_in<=G[t-1][2*j];
//                g2_in<=G[t-1][2*j+1];
//                y1_in<=Y[2*j][t];
//                y2_in<=Y[2*j+1][t];
                        
               // end
            end
        end   
    end
generate 
    genvar k, n;
         for (k = 0; k < K; k = k + 1) begin : col_loop
                for (n = 0; n <N/2 ; n = n + 1) begin : row_loop
                    PE#(
                    .DATA_WITH(DATA_WITH),
                    .M(M),
                    .K(K),
                    .N(N)
                    )(
                    .clk(clk),
                    .rst(rst),
                    .clr(clr),
                    .g1_in(G[k][2*n]),
                    .g2_in(G[k][2*n+1]),
                    .y1_in(Y[2*n][k]),
                    .y2_in(Y[2*n+1][K]),
                    .C_in(C_reg),
                    .g1_out(G[k+1][2*n]),
                    .g2_out(G[k+1][2*n+1]),
//                    .y1_out(),
//                    .y2_out(),
                    .C_out(C_reg)
                    );
        end
    end
endgenerate
endmodule
