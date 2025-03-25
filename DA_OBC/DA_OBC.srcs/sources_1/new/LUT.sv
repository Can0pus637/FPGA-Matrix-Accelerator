`timescale 1ns / 1ps

module LUT#(
    parameter DATA_WIDTH=3,
    parameter M=4,
    parameter N=4,
    parameter K=4
)(
    input rst,
    input clk,
    input gen_done,
    input  logic signed [DATA_WIDTH-1:0] A[K],
    input  logic signed [DATA_WIDTH-1:0] B[K],
    output logic signed  [2*DATA_WIDTH+1:0] C_out
);
    logic [4:0] t;
    logic clr;
    logic done;
    logic [K-1:0] bit_array;
    logic signed [2*DATA_WIDTH+1:0] LUT_out;
    logic signed [2*DATA_WIDTH+1:0] C;
    logic notA0;
    logic [DATA_WIDTH-1:0] A0;
    logic [K-2:0] addr;
    logic start;
    logic signed [2*DATA_WIDTH+1:0] p;
   
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            C <= 0;
            t <= 0;
            bit_array <= 0;
            clr <= 0;
            done <= 0;
            start<=0;
            
        end else if (gen_done) begin
            if (t == DATA_WIDTH+3) begin
                t <= 0;
                done <= 1;
                clr <= 1;
              
            end else if (done) begin
                done <= 0;
            end else if (clr) begin
                clr <= 0;
            end else begin
                t <= t + 1;
            end
            for (int i = 0; i < K; i++) begin
                bit_array[i] <= A[i][t];
                start<=1;
            end
            if(start) begin
                A0[t-1]<=bit_array[0];
                notA0 = ~bit_array[0];
                addr[2] = bit_array[3] ^ notA0;
                addr[1] = bit_array[2] ^ notA0;
                addr[0] = bit_array[1] ^ notA0;
                
                end
            case (addr)
                3'b000: LUT_out <= B[0] - B[1] - B[2] - B[3];
                3'b001: LUT_out <= B[0] + B[1] - B[2] - B[3];
                3'b010: LUT_out <= B[0] - B[1] + B[2] - B[3];
                3'b011: LUT_out <= B[0] + B[1] + B[2] - B[3];
                3'b100: LUT_out <= B[0] - B[1] - B[2] + B[3];
                3'b101: LUT_out <= B[0] + B[1] - B[2] + B[3];
                3'b110: LUT_out <= B[0] - B[1] + B[2] + B[3];
                3'b111: LUT_out <= B[0] + B[1] + B[2] + B[3];
                default: LUT_out <= 0;
            endcase
            C <= LUT_out;
         
         
           
        end
    end


always_comb begin
    logic signed [2*DATA_WIDTH+1:0] sum = 0;
    for (int i = 0; i < K; i++) begin
        sum = sum + B[i];
    end
    // 先将 sum 除以 2，再乘以 (2^DATA_WIDTH - 1)
    p = (((1 <<< DATA_WIDTH) - 1) * sum);
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
        .t(t),
        .A0(A0),
        .p(p)
    );
endmodule
