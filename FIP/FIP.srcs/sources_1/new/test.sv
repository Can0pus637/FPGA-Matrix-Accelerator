module test_fixed_index #(
    parameter DATA_WIDTH = 8,
    parameter K = 4,
    parameter M = 4,
    parameter N = 4
)(
    input  logic                 clk,
    input  logic                 rst,
    input  logic [DATA_WIDTH-1:0] Alpha_regA [M-1:0],
    input  logic [DATA_WIDTH-1:0] Alpha_regB [M-1:0],
    input  logic [2*DATA_WIDTH+4:0] Alpha_result_reg [M-1:0],
    output logic [2*DATA_WIDTH+4:0] Alpha_result [M-1:0]
);

    genvar i;
    generate
        for (i = 0; i < M; i = i+1) begin : alpha_gen
            Alpha_Beta_PE #(
                .DATA_WIDTH(DATA_WIDTH),
                .K(K),
                .M(M),
                .N(N)
            ) alphape_inst (
                .clk(clk),
                .rst(rst),
                // 固定索引1：所有实例都使用 Alpha_regA[1]、Alpha_regB[1]、Alpha_result_reg[1]
                .A_in(Alpha_regA[1]),
                .B_in(Alpha_regB[1]),
                .C_in(Alpha_result_reg[1]),
                // 每个实例输出到 Alpha_result[i]
                .out(Alpha_result[i])
            );
        end
    endgenerate

endmodule
