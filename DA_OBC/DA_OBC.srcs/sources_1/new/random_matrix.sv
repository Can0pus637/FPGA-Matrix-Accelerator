
module random_matrix#(
    parameter int DATA_WIDTH = 2,  // ÿ��Ԫ�� DATA_WIDTH λ��0~(2^DATA_WIDTH-1)
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

  // LFSR���ӼĴ���
  logic [7:0] seed_reg;
  // ʱ�Ӽ�������ÿ5��ʱ������һ���������
  logic [5:0] clk_counter;

  // LFSR ��һ��״̬���������ö���ʽ x^8 + x^6 + x^5 + x^4 + 1
  function automatic logic [7:0] lfsr_next(input logic [7:0] l);
    logic feedback;
    begin
      feedback = l[7] ^ l[5] ^ l[4] ^ l[3];
      lfsr_next = {l[6:0], feedback};
    end
  endfunction

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      seed_reg   <= 8'h1;  // ��ʼ������
      clk_counter<= 8;
      // �����������
      for (int i = 0; i < M; i++)
          for (int j = 0; j < K; j++)
              A[i][j] <= 0;
      for (int i = 0; i < K; i++)
          for (int j = 0; j < N; j++)
              B[i][j] <= 0;
    end else begin
      if (clk_counter == 8) begin
          // ÿ��5��ʱ������һ���������
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
