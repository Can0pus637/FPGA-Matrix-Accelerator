
module random_matrix#(
    parameter int DATA_WIDTH = 2,  // 每个元素 DATA_WIDTH 位：0~(2^DATA_WIDTH-1)
    parameter int M = 4,
    parameter int K = 4,
    parameter int N = 4
)(
    input  logic clk,
    input  logic rst,
    output logic signed [DATA_WIDTH-1:0] A [M][K],
    output logic signed [DATA_WIDTH-1:0] B [K][N],
    output logic gen_done
);

  // LFSR种子寄存器
  logic [7:0] seed_reg;
  // 时钟计数器，每5个时钟生成一次随机矩阵
  logic [5:0] clk_counter;

  // LFSR 下一个状态函数，采用多项式 x^8 + x^6 + x^5 + x^4 + 1
  function automatic logic [7:0] lfsr_next(input logic [7:0] l);
    logic feedback;
    begin
      feedback = l[7] ^ l[5] ^ l[4] ^ l[3];
      lfsr_next = {l[6:0], feedback};
    end
  endfunction

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      seed_reg   <= 8'h1;  // 初始化种子
      clk_counter<= 8;
      // 清零矩阵数据
      for (int i = 0; i < M; i++)
          for (int j = 0; j < K; j++)
              A[i][j] <= 0;
      for (int i = 0; i < K; i++)
          for (int j = 0; j < N; j++)
              B[i][j] <= 0;
    end else begin
      if (clk_counter == 8) begin
          // 每隔5个时钟生成一次随机矩阵
          logic [7:0] seed_local;
          seed_local = seed_reg;
          for (int i = 0; i < M; i++) begin
            for (int j = 0; j < K; j++) begin
              seed_local = lfsr_next(seed_local);
              A[i][j] <= {1'b0, seed_local[DATA_WIDTH-2:0]};

              
            end
          end
          for (int i = 0; i < K; i++) begin
            for (int j = 0; j < N; j++) begin
              seed_local = lfsr_next(seed_local);
              B[i][j] <= {1'b0, seed_local[DATA_WIDTH-2:0]};

            end
          end
          gen_done<=1;
          seed_reg <= seed_local;
          clk_counter <= 0;
      end else begin
          clk_counter <= clk_counter + 1;
          
      end
    end
  end

endmodule
