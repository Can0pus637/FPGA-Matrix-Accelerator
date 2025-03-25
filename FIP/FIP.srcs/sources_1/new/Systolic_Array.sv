module Systolic_Array#(
    parameter DATA_WIDTH = 8,
    parameter M = 4,
    parameter N = 4,
    parameter K = 4
)(
    input clk,
    input rst,
    input   logic [DATA_WIDTH-1:0]     A[M][K],   
    input   logic [DATA_WIDTH-1:0]     B[K][N], 
    output  logic [2*DATA_WIDTH+4:0]   C[M][N],
    output  logic       Systolic_Array_end
    );
    logic  [DATA_WIDTH-1:0] apipe1   [K][K+1] ;
    logic  [DATA_WIDTH-1:0] apipe2   [K][K+1] ;
    logic  [DATA_WIDTH-1:0] bpipe1   [K+1][K] ;
    logic  [DATA_WIDTH-1:0] bpipe2   [K+1][K] ;
    logic  [16:0] t;
    //logic  [(2*DATA_WIDTH)+4:0] cpipe_next[M][N];
    logic  clr;
    logic [3:0]      Systolic_Array_count;
  always_ff @(posedge clk or posedge rst) begin
    
    if (rst) begin
        for (int i = 0; i < N+1; i++) begin
            for (int j = 0; j < M; j++) begin
                apipe1[i][j] <= '0;
                apipe2[i][j] <= '0;
            end
        end
        for (int i = 0; i < N; i++) begin
            for (int j = 0; j < M+1; j++) begin
                bpipe1[i][j] <= '0;
                bpipe2[i][j] <= '0;
            end
        end
        for (int i = 0; i < N; i++) begin
            for (int j = 0; j < M; j++) begin
                C[i][j] <= '0;
                C[i][j] <= 0;
            end
        end
        t <= 0;
        clr<=0;
        Systolic_Array_count<=0;
        Systolic_Array_end<=0;
    end else begin
        if((t>=M+K-1&&t>=N+K-1)||(Systolic_Array_count!=0))begin
            Systolic_Array_count<=Systolic_Array_count+1;
            if(clr) begin
                clr<=0;
                Systolic_Array_count<=0;
            end else if(Systolic_Array_count==K) begin
                clr<=1;
                Systolic_Array_end<=1;
                
//                for (int i = 0; i < N; i++) begin
//                    for (int j = 0; j < M; j++) begin
//                        C[i][j] <= C[i][j];
//                        cpipe_next[i][j] <= 0;
//                    end
//                end
            end 
        end 
        //else begin
         if(Systolic_Array_count==1)begin 
            t<=-2; 
         end else begin
            t <= t + 1;
         end
           for(int n=0; n<M&&n<N; n=n+1) begin
             if(n<t) begin  
                if(t-n-1>=0 ) begin
                    if((2*(t-n-1)<K))begin
                        apipe1[n][0] <= A[n][2*(t-n-1)];
                        apipe2[n][0] <= A[n][2*(t-n-1)+1];
                    end else begin
                        apipe1[n][0] <=0;
                        apipe2[n][0] <= 0;          
                    end
                    if((2*(t-n-1)<K))begin
                        bpipe1[0][n] <= B[2*(t-n-1)][n];
                        bpipe2[0][n] <= B[2*(t-n-1)+1][n];
                    end else begin
                        bpipe1[0][n] <=0;
                        bpipe2[0][n]<= 0;  
                    end
                end
            end
       // end 
    end
    if(Systolic_Array_end) begin
    Systolic_Array_end<=0;
        end
    end
end
    generate
        genvar m, n;
         for (m = 0; m < M; m = m + 1) begin : col_loop
                for (n = 0; n <N ; n = n + 1) begin : row_loop
               
                    PE #(.DATA_WIDTH(DATA_WIDTH)) pe_inst (
                        .clk(clk),
                        .rst(rst),
                        
                        .A1_in(apipe1[n][m]),  
                        .A2_in(apipe2[n][m]),  
                        
                        .B1_in(bpipe1[n][m]),  
                        .B2_in(bpipe2[n][m]),  
                        
                        .A1_out(apipe1[n][m+1]),  
                        .A2_out(apipe2[n][m+1]),  
                        .B1_out(bpipe1[n+1][m]),  
                        .B2_out(bpipe2[n+1][m]),  
               
                        .C_in(C[n][m]),  
                        .C_out(C[n][m]) , 
                        .clr(clr)
                    );
                end
            end
    endgenerate
    
endmodule
    