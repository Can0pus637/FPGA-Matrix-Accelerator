`timescale 1ns / 1ps

module PE#(
    parameter DATA_WITH=8,
    parameter M=4,
    parameter K=4,
    parameter N=4
    )(
    input wire clk,
    input wire rst,
    input wire clr,
    input logic [DATA_WITH:0] g1_in,
    input logic [DATA_WITH:0] g2_in,
    input logic [DATA_WITH:0] y1_in,
    input logic [DATA_WITH:0] y2_in,
    input logic [2*DATA_WITH+$clog2(DATA_WITH)-1:0] C_in,
    output logic [DATA_WITH:0] g1_out,
    output logic [DATA_WITH:0] g2_out,
    output logic [DATA_WITH:0] y1_out,
    output logic [DATA_WITH:0] y2_out,
    output logic [2*DATA_WITH+$clog2(DATA_WITH)-1:0] C_out
    );
    logic [2*DATA_WITH:0]prod;
    always_ff@(posedge clk or posedge rst) begin
    if(rst)begin
        g1_out<=0;
        g2_out<=0;
        y1_out<=0;
        y2_out<=0;
        C_out <=0;
        prod<=0;
    end else if(clr)begin
        g1_out<=0;
        g2_out<=0;
        y1_out<=0;
        y2_out<=0;
        C_out <=0;
        prod<=0;
    end else begin
        y1_out<=y1_in;
        y2_out<=y2_in;
        g1_out<=g1_in+y1_in;
        g2_out<=g2_in+y2_in;
        prod<=g1_out*g2_out;
        C_out<=C_in+prod;
        end
    end
endmodule
