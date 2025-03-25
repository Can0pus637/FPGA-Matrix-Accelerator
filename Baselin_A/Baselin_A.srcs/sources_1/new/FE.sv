module PE #( 
    parameter DATA_WIDTH = 32
) (
    input logic clk,
    input logic rst,
    input logic  [DATA_WIDTH-1:0] A_in,
    input logic  [DATA_WIDTH-1:0] B_in,
    input logic  [(2*DATA_WIDTH):0] C_in,
    input done_cal_flag,
    output logic  [DATA_WIDTH-1:0] A_out,
    output logic  [DATA_WIDTH-1:0] B_out,
    output logic  [(2*DATA_WIDTH):0] C_out
    //input logic valid_A,
    //input logic valid_B
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            A_out <= 0;
            B_out <= 0;
            C_out <= 0;
        end else if(done_cal_flag) begin
            C_out <= 0;
        end
        else begin
            A_out <= A_in;
            B_out <= B_in;
            C_out <= C_in + A_out * B_out;
            
        end
    end
endmodule
