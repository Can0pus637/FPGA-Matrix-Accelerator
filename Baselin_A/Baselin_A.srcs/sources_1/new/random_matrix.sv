module random_matrix#(
    parameter int DATA_WIDTH = 2,  // 每个元素 DATA_WIDTH 位：0~(2^DATA_WIDTH-1)
    parameter int M = 2,
    parameter int K = 2,
    parameter int N = 2
)(
    input  logic clk,
    input  logic rst,
    input  logic gen_start,  // 外部触发生成矩阵的信号，当 t==0 时置 1
    output logic [DATA_WIDTH-1:0] A [M][K],
    output logic [DATA_WIDTH-1:0] B [K][N]
);

  // 使用一个8位寄存器作为 LFSR 种子
  logic [7:0] seed_reg;

  // LFSR 下一个状态函数，采用多项式 x^8 + x^6 + x^5 + x^4 + 1
  function automatic logic [7:0] lfsr_next(input logic [7:0] l);
    logic feedback;
    begin
      feedback = l[7] ^ l[5] ^ l[4] ^ l[3];
      lfsr_next = {l[6:0], feedback};
    end
  endfunction

  // 当 gen_start 为 1 时生成矩阵数据
  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      seed_reg <= 8'h1;  // 初始化种子
      // 清零矩阵数据
      for (int i = 0; i < M; i++)
          for (int j = 0; j < K; j++)
              A[i][j] <= 0;
      for (int i = 0; i < K; i++)
          for (int j = 0; j < N; j++)
              B[i][j] <= 0;
    end else if (gen_start) begin
      logic [7:0] seed_local;
      seed_local = seed_reg;
      // 生成 A 矩阵数据
      for (int i = 0; i < M; i++) begin
        for (int j = 0; j < K; j++) begin
          seed_local = lfsr_next(seed_local);
          A[i][j] <= seed_local[DATA_WIDTH-1:0];  // 取低 DATA_WIDTH 位
        end
      end
      // 生成 B 矩阵数据
      for (int i = 0; i < K; i++) begin
        for (int j = 0; j < N; j++) begin
          seed_local = lfsr_next(seed_local);
          B[i][j] <= seed_local[DATA_WIDTH-1:0];
        end
      end
      seed_reg <= seed_local;  // 更新全局种子
    end
  end

endmodule
