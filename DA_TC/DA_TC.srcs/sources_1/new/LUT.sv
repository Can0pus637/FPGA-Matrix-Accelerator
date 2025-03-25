`timescale 1ns / 1ps

module LUT#(
    parameter DATA_WIDTH=2,
    parameter M=4,
    parameter N=4,
    parameter K=4
    )(
    input rst,
    input clk,
    input gen_done,
    input  logic [DATA_WIDTH-1:0]     A[K],
    input  logic [DATA_WIDTH-1:0]     B[K],
    
    output logic [2*DATA_WIDTH+1:0]     C_out
    );
    logic [2:0] t;
    logic  clr;
    logic  done;
    logic [K-1:0] bit_array;
    logic [2*DATA_WIDTH+1:0] C;
    always_ff@(posedge clk or posedge rst)begin
    if(rst)begin
        C<=0;
        t<=0;
        bit_array<=0;    
        clr<=0;
        done<=0;
    end else if (gen_done) begin
        
        if(t==DATA_WIDTH+1) begin
            t<=0;
            done<=1;
            clr<=1;
        end else if(done)
            done<=0;
        else if(clr)
            clr<=0;
        else begin
            t<=t+1 ;
        end for(int i=0;i<K;i++) begin
            bit_array[i] <= A[i][t];
        end
            case(bit_array)
                4'b0000: C <= 0;
                4'b0001: C <= B[0];
                4'b0010: C <= B[1];
                4'b0011: C <= B[1] + B[0];
                4'b0100: C <= B[2];      
                4'b0101: C <= B[2] + B[0];
                4'b0110: C <= B[2] + B[1];
                4'b0111: C <= B[2] + B[1] + B[0];
                4'b1000: C <= B[3];     
                4'b1001: C <= B[3] + B[0];
                4'b1010: C <= B[3] + B[1];
                4'b1011: C <= B[3] + B[1] + B[0];
                4'b1100: C <= B[3] + B[2];
                4'b1101: C <= B[3] + B[2] + B[0];
                4'b1110: C <= B[3] + B[2] + B[1];
                4'b1111: C <= B[3] + B[2] + B[1] + B[0];
                default: C <= 0;
            endcase
        end
    end
    
    SA #(
        .DATA_WIDTH(DATA_WIDTH),
        .M(M),
        .N(N),
        .K(K)
    ) SA (
        .clk(clk),
        .rst(rst),
        .done(done),
        .clr(clr),
        .C_in(C),
        .C_out(C_out),
        .t(t)
    );

endmodule
