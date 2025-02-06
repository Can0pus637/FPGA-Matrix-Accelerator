module SystolicArray #( 
    parameter DATA_WIDTH = 8,
    parameter M = 2,
    parameter N = 2,
    parameter K = 2
)(
    input wire clk,
    input wire rst,
    input wire signed [DATA_WIDTH-1:0] A [M][K],  // A ��������
    input wire signed [DATA_WIDTH-1:0] B [K][N],  // B ��������
    output logic signed [(2*DATA_WIDTH)-1:0] C [M][N]  // ����������
);

    // **A �������Ҵ���**
    logic signed [DATA_WIDTH-1:0] apipe [M][K+1];
    // **B �������´���**
    logic signed [DATA_WIDTH-1:0] bpipe [K+1][N];
    // **C �����ۼ�**
    logic signed [(2*DATA_WIDTH)-1:0] cpipe [M][N];

    logic [3:0] t;  // ������������ʱ�Ӳ���
    always_ff @(posedge clk or posedge rst) begin
        if(rst) 
            t<=-1;
        else
            t=t+1;//clock 
    end
    always_ff @(posedge clk or posedge rst) begin 
       if (rst) begin
        for (int i = 0; i < M; i++)
            for (int j = 0; j < K+1; j++)
                apipe[i][j] <= 0;
        for (int i = 0; i < K+1; i++)
            for (int j = 0; j < N; j++)
                bpipe[i][j] <= 0;
        for (int i = 0; i < M; i++)
            for (int j = 0; j < N; j++)
                cpipe[i][j] <= 0;
    end else begin 
     
        for (int i = 0; i < M; i++) begin
            if (t >= i && t - i < K)  begin
                apipe[i][0] <= A[i][t - i];  
                bpipe[0][i] <= B[t - i][i];  
            end else begin
                apipe[i][0] <= 0; 
                bpipe[0][i] <= 0;
            end
        end

        

    end  
end

    // **���� PE ����**
    generate
        genvar m, n;
        for (m = 0; m < M; m++) begin
            for (n = 0; n < N; n++) begin
                PE #(.DATA_WIDTH(DATA_WIDTH)) pe_inst (
                    .clk(clk),
                    .rst(rst),
                    .A_in(apipe[m][n]),
                    .B_in(bpipe[m][n]),
                    .C_in(cpipe[m][n]),
                    .A_out(apipe[m][n+1]),
                    .B_out(bpipe[m+1][n]),
                    .C_out(cpipe[m][n])
                   // .valid_A(valid_A[m]),
                   // .valid_B(valid_B[n])
                );
            end
        end
    endgenerate

    // **�洢���� C ���**
    always_ff @(posedge clk) begin
        if (t == M + K + N - 2) begin
            for (int i = 0; i < M; i++)
                for (int j = 0; j < N; j++)
                    C[i][j] <= cpipe[i][j];
        end
    end

endmodule
