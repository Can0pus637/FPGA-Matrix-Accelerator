module SystolicArray #(
    parameter DATA_WIDTH = 8,
    parameter M = 2,
    parameter N = 2,
    parameter K = 2
)(
    input  wire clk,
    input  wire rst,
    input  logic start_cal,
    output logic done_cal,
    input  wire [DATA_WIDTH-1:0] A [M][K],  
    input  wire [DATA_WIDTH-1:0] B [K][N],  
    output logic [(2*DATA_WIDTH):0] C [M][N]  
);

    // 内部流水线寄存器
    logic [DATA_WIDTH-1:0] apipe [M][K+1];
    logic [DATA_WIDTH-1:0] bpipe [K+1][N];
    logic [(2*DATA_WIDTH):0] cpipe [M][N];
    logic [7:0] t;  // 计数器

    // 计数器及 done_cal 信号
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            t <= 0;
            done_cal <= 0;
        end else if (start_cal) begin
            if (t < (M + N + K))
                t <= t + 1;
            else begin
                done_cal <= 1;
                t <= 0;  // 完成后重置计数器
            end
        end
    end

    // 流水线寄存器更新与清零
    always_ff @(posedge clk or posedge rst) begin
        if (rst || done_cal) begin
            // 清零所有流水线寄存器和输出 C
            for (int i = 0; i < M; i++) begin
                for (int j = 0; j < (K+1); j++) begin
                    apipe[i][j] <= 0;
                end
            end
            for (int i = 0; i < (K+1); i++) begin
                for (int j = 0; j < N; j++) begin
                    bpipe[i][j] <= 0;
                end
            end
            for (int i = 0; i < M; i++) begin
                for (int j = 0; j < N; j++) begin
                    cpipe[i][j] <= 0;
                    C[i][j] <= 0;
                end
            end
        end else if (start_cal && (t < (M+N+K))) begin
            // 根据当前计数器 t 更新流水线的初始输入
            for (int i = 0; i < M; i++) begin
                if ((i <= t) && ((t - i) < K))
                    apipe[i][0] <= A[i][t - i];
                else
                    apipe[i][0] <= 0;
            end
            for (int j = 0; j < N; j++) begin
                if ((j <= t) && ((t - j) < K))
                    bpipe[0][j] <= B[t - j][j];
                else
                    bpipe[0][j] <= 0;
            end
        end
    end

    // 当计算结束时，将流水线最后的结果传给输出 C
    always_ff @(posedge clk) begin
        //if (done_cal) begin
            for (int i = 0; i < M; i++) begin
                for (int j = 0; j < N; j++) begin
                    C[i][j] <= cpipe[i][j];
        //        end
            end
        end
    end

    // PE 实例化，保持不变
    generate
        genvar m, n;
        for (m = 0; m < M; m++) begin
            for (n = 0; n < N; n++) begin
                PE #(.DATA_WIDTH(DATA_WIDTH)) pe_inst (
                    .clk(clk),
                    .rst(rst || done_cal),
                    .A_in(apipe[m][n]),
                    .B_in(bpipe[m][n]),
                    .C_in(cpipe[m][n]),
                    .A_out(apipe[m][n+1]),
                    .B_out(bpipe[m+1][n]),
                    .C_out(cpipe[m][n])
                );
            end
        end
    endgenerate

endmodule
