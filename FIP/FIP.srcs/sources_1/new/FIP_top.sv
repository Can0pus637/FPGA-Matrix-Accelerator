module FIP_top#(
    parameter DATA_WIDTH = 2,
    parameter M = 4,
    parameter N = 4,
    parameter K = 4
)(
    input clk_p,
    input clk_n,
    input rst,
    output  logic [2*DATA_WIDTH:0]   C[M][N]
    );
    logic [DATA_WIDTH-1:0]     A[M][K]; 
    logic [DATA_WIDTH-1:0]     B[K][N];
    logic   Alpha_Beta_end;
    logic   Systolic_Array_end;
    logic   [2*DATA_WIDTH+4:0]   Alpha[M];
    logic   [2*DATA_WIDTH+4:0]   Beta[N];
    logic   [2*DATA_WIDTH+4:0]   Systolic_Array_result[M][N];
    logic   clr_all;
    logic   gen_en;
    logic   gen_array;
    logic [7:0] t;
    wire clk;
    IBUFGDS clkgen (
        .O(clk),
        .I(clk_p),
        .IB(clk_n)
    );
    always_ff @(posedge clk or posedge rst) begin
    if(rst)begin 
        for (int m = 0; m < M; m++) begin
            for (int n = 0; n < N; n++) begin
                C[m][n] <= '0;
            end
        end
    clr_all<=0;
    t<=0;
    gen_array<=1;
    gen_en<=1;
    end else begin
        if(gen_array)begin
            gen_array<=0;
    
        end else begin
        if(Alpha_Beta_end&&Systolic_Array_end)begin
            for (int m = 0; m < M; m++) begin
                for (int n = 0; n < N; n++) begin
                    C[m][n] <= Systolic_Array_result[m][n]-Alpha[m]-Beta[n];
                        //C[m][n] <= Systolic_Array_result[m][n];
                    clr_all<=1;
                 end
            end
        end else if(clr_all) begin
            clr_all<=0;
        end
        if(t<M+K-1||t<N+K-1)begin
            t<=t+1;
         end
        else if(t<M+K+2&&t<N+K+2&&gen_en) begin
            gen_array <= 1;
            t <= t + 1;
            gen_en<=0;
        end
        else begin
            t<=0;
            gen_en<=1;
            end
        end
    end
end      
     Systolic_Array #(.DATA_WIDTH(DATA_WIDTH),.M(M),.N(N),.K(K)) Systolic_Array (
         .clk(clk),
         .rst(rst),
         .A(A),
         .B(B),
         .C(Systolic_Array_result),
         .Systolic_Array_end(Systolic_Array_end)
     );
    Alpha_Beta_cal #(.DATA_WIDTH(DATA_WIDTH),.M(M),.N(N),.K(K)) Alpha_Beta_cal (
         .clk(clk),
         .rst(rst),
         .gen_array(gen_array),
         .A(A),
         .B(B),
         .clr_all(clr_all),
         .Alpha(Alpha),
         .Beta(Beta),
         .Alpha_Beta_end(Alpha_Beta_end)
     );
    random_matrix #(.DATA_WIDTH(DATA_WIDTH), .M(M), .K(K), .N(N)) randomGen (
        .clk(clk),
        .rst(rst),
        .gen_array(gen_array),
        .A(A),  
        .B(B)   
    );

endmodule
