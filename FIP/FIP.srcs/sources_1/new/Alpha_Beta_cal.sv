
module Alpha_Beta_cal#(
    parameter DATA_WIDTH=8,
    parameter K=4,
    parameter M=4,
    parameter N=4
)(
    input clk,
    input rst,
    input clr_all,
    input gen_array,
    input   logic [DATA_WIDTH-1:0]     A[M][K],   
    input   logic [DATA_WIDTH-1:0]     B[K][N], 
    output  logic [2*DATA_WIDTH+4:0]   Alpha[M],
    output  logic [2*DATA_WIDTH+4:0]   Beta[N],
    output  logic Alpha_Beta_end
    );
    logic [2*DATA_WIDTH+4:0]   Alpha_regA[M];
    logic [2*DATA_WIDTH+4:0]   Alpha_regB[M];
    logic [2*DATA_WIDTH+4:0]   Beta_regA[N];
    logic [2*DATA_WIDTH+4:0]   Beta_regB[N];
    logic [7:0]   t;
    logic Alpha_end;
    logic Beta_end;

always_ff @(posedge clk or posedge rst) begin
    if(rst||clr_all) begin
        for(int m=0;m<M;m=m+1) begin
            Alpha[m]<=0;
            Alpha_regA[m]<=0;
            Alpha_regB[m]<=0;
        end
        for(int n=0;n<N;n=n+1) begin
            Beta[n]<=0;
            Beta_regA[n]<=0;
            Beta_regB[n]<=0;
        end
            t<=0;
            Alpha_end<=0;
            Beta_end<=0;
            Alpha_Beta_end<=0;
    end else begin 
        if(!gen_array) begin
        t<=t+1;
        if(t<M/2) begin
            for(int m=0;m<M;m=m+1) begin
                Alpha_regA[m]<=A[m][2*t];
                Alpha_regB[m]<=A[m][2*t+1];
            end end else begin
                Alpha_end<=1;
                for(int m=0;m<M;m=m+1) begin
                    Alpha_regA[m]<=0;
                    Alpha_regB[m]<=0;
        end end 
        if(t<N/2) begin
            for(int n=0;n<N;n=n+1) begin
                Beta_regA[n]<=B[2*t][n];
                Beta_regB[n]<=B[2*t+1][n];
            end end else begin
                Beta_end<=1;
                for(int n=0;n<N;n=n+1) begin
                    Beta_regA[n]<=0;
                    Beta_regB[n]<=0;
       end end 
       if(Beta_end&&Alpha_end) begin
            Alpha_Beta_end<=1;
            end
        end
    end 
end

generate
    genvar i;
    for (i = 0; i < M; i = i+1) begin : alpha_gen
        Alpha_Beta_PE #(
            .DATA_WIDTH(DATA_WIDTH),
            .K(K),
            .M(M),
            .N(N)) alphape_inst (
            .clk(clk),
            .rst(rst),
            .A_in(Alpha_regA[i]),
            .B_in(Alpha_regB[i]),
            .C_in(Alpha[i]),
            .out(Alpha [i]),
            .clr_all(clr_all)
        );
   end
endgenerate
generate
    genvar j;
    for (j = 0; j < N; j = j+1) begin : beta_gen
        Alpha_Beta_PE #(
            .DATA_WIDTH(DATA_WIDTH),
            .K(K),
            .M(M),
            .N(N)
        ) betape_inst (
            .clk(clk),
            .rst(rst),
            .A_in(Beta_regA[j]),
            .B_in(Beta_regB[j]),
            .C_in(Beta[j]),
            .clr_all(clr_all),
            .out(Beta[j])
        );
    end
endgenerate
endmodule
