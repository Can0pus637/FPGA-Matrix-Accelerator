module PE #( 
    parameter DATA_WIDTH = 8
)(
    input wire clk,
    input wire rst,
    input wire clr,
    input logic [DATA_WIDTH-1:0] A1_in,
    input logic [DATA_WIDTH-1:0] A2_in,
    input logic [DATA_WIDTH-1:0] B1_in,
    input logic [DATA_WIDTH-1:0] B2_in,
    input logic [2*DATA_WIDTH+4:0] C_in, 
 
    output logic [DATA_WIDTH-1:0] A1_out,
    output logic [DATA_WIDTH-1:0] A2_out,
    output logic [DATA_WIDTH-1:0] B1_out,
    output logic [DATA_WIDTH-1:0] B2_out,
    output logic [2*DATA_WIDTH+4:0] C_out  
);

    logic [DATA_WIDTH+5:0] sum1, sum2;
    logic [2*DATA_WIDTH+5:0] prod; 
    
     

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            A1_out <= 0;
            A2_out <= 0;
            B1_out <= 0;
            B2_out <= 0;
            C_out  <= 0;
            prod  <= 0;
            sum1<= 0;
            sum2<= 0;
        end else if(clr)begin
            C_out<=0;
        end else begin
            
            A1_out <= A1_in;
            A2_out <= A2_in;
            B1_out <= B1_in;
            B2_out <= B2_in;
            
            
            sum1 <= A1_in + B2_in;
            sum2 <= A2_in + B1_in;
            prod <=sum1*sum2 ;
            C_out <=prod+C_in;
       
            //C_out <= (A2_in + B1_in )* (A1_in + B2_in)+C_in ;
            //C_out <=A1_in+ B2_in;
        end
    end
endmodule
