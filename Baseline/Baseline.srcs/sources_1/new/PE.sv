module PE #( 
    parameter DATA_WIDTH = 32
) (
    input logic clk,
    input logic rst,
    input logic signed [DATA_WIDTH-1:0] A_in,
    input logic signed [DATA_WIDTH-1:0] B_in,
    input logic signed [(2*DATA_WIDTH)-1:0] C_in,
    output logic signed [DATA_WIDTH-1:0] A_out,
    output logic signed [DATA_WIDTH-1:0] B_out,
    output logic signed [(2*DATA_WIDTH)-1:0] C_out
    //input logic valid_A,
    //input logic valid_B
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            A_out <= 0;
            B_out <= 0;
            C_out <= 0;
        end else begin
            A_out <= A_in;
            B_out <= B_in;
            C_out <= C_in + A_out * B_out;
            
        end
    end
endmodule
