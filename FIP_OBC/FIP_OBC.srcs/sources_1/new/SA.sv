`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/21 22:40:18
// Design Name: 
// Module Name: SA
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


module SA#(
    parameter DATA_WIDTH=3,
    parameter M=4,
    parameter N=4,
    parameter K=4
    )(
    input clk,
    input rst,
    input done,
    input clr,
    input   logic [2:0] t,
    input logic [DATA_WIDTH-1:0] A0,
    input   logic signed [2*DATA_WIDTH+1:0] C_in,
    input   logic signed [2*DATA_WIDTH+1:0] p,
    output  logic signed [2*DATA_WIDTH+1:0] C_out
    );
    logic signed [2*DATA_WIDTH+1:0] C_reg;
    always_ff @(posedge clk or posedge rst)begin
        if(rst) begin
            C_reg<=0;
            C_out<=0;
        end else if(done) begin
            C_out<=C_out;
        end else if(clr) begin
            C_out<=0;
            C_out<=0;
        end else begin
             if(A0[t-3])
                C_out<=C_out+(C_in << (t-3));
             else
                C_out<=C_out-(C_in << (t-3));
             if((DATA_WIDTH+3)==t)
                C_out<=(C_out+p>>>1);
            end
        end
endmodule
