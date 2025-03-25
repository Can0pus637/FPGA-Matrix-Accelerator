module random_matrix#( 
    parameter int DATA_WIDTH = 2,  // 每个元素2位：0~3
    parameter int M = 2,
    parameter int K = 2,
    parameter int N = 2
)(
    input  logic clk,
    input  logic gen_array,
    input  logic rst,
    output logic [DATA_WIDTH-1:0] A [M][K],
    output logic [DATA_WIDTH-1:0] B [K][N]
);

  // 使用一个16位寄存器作为LFSR种子，初始值为10086
  logic [15:0] seed_reg;

  // 采用多项式：x^16 + x^14 + x^13 + x^11 + 1
  function automatic logic [15:0] lfsr_next(input logic [15:0] l);
    logic feedback;
    begin
      feedback = l[15] ^ l[13] ^ l[12] ^ l[10];
      lfsr_next = {l[14:0], feedback};
    end
  endfunction

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      // 初始化：清零矩阵和种子
      seed_reg <= 16'd10086;
      for (int i = 0; i < M; i++) begin
        for (int j = 0; j < K; j++) begin
          A[i][j] <= 0;
        end
      end
      for (int i = 0; i < K; i++) begin
        for (int j = 0; j < N; j++) begin
          B[i][j] <= 0;
        end
      end
    end else if (gen_array) begin
      // 用局部变量保存种子，避免在循环中直接更新全局种子
      logic [15:0] seed_local;
      seed_local = seed_reg;
      
      // 生成 A 矩阵数据
      for (int i = 0; i < M; i++) begin
        for (int j = 0; j < K; j++) begin
          seed_local = lfsr_next(seed_local);
          A[i][j] <= seed_local[DATA_WIDTH-1:0]; // 取低2位
        end
      end
      
      // 生成 B 矩阵数据
      for (int i = 0; i < K; i++) begin
        for (int j = 0; j < N; j++) begin
          seed_local = lfsr_next(seed_local);
          B[i][j] <= seed_local[DATA_WIDTH-1:0]; // 取低2位
        end
      end
      
      // 更新全局种子
      seed_reg <= seed_local;
    end
  end

endmodule
