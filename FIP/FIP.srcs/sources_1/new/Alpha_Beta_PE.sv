module Alpha_Beta_PE#(
    parameter DATA_WIDTH=8,
    parameter K=4,
    parameter M=4,
    parameter N=4
)(
    input   wire clk,
    input   wire rst,
    input   logic [DATA_WIDTH-1:0] A_in,
    input   logic [DATA_WIDTH-1:0] B_in,
    input   logic [2*DATA_WIDTH+4:0] C_in,
    input   logic clr_all,
    output  logic [2*DATA_WIDTH+4:0] out
    );
    logic [2*DATA_WIDTH-1:0] prod;
    always_ff@(posedge clk or posedge rst)
        begin
        if(rst||clr_all)begin
            out<=0;
            prod<=0;
        end else begin
            prod<=B_in*A_in;
            out<=C_in+prod;
            end
        end
        

endmodule
