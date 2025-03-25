module random_matrix#(
    parameter int DATA_WIDTH = 2,  // ÿ��Ԫ�� DATA_WIDTH λ��0~(2^DATA_WIDTH-1)
    parameter int M = 2,
    parameter int K = 2,
    parameter int N = 2
)(
    input  logic clk,
    input  logic rst,
    input  logic gen_start,  // �ⲿ�������ɾ�����źţ��� t==0 ʱ�� 1
    output logic [DATA_WIDTH-1:0] A [M][K],
    output logic [DATA_WIDTH-1:0] B [K][N]
);

  // ʹ��һ��8λ�Ĵ�����Ϊ LFSR ����
  logic [7:0] seed_reg;

  // LFSR ��һ��״̬���������ö���ʽ x^8 + x^6 + x^5 + x^4 + 1
  function automatic logic [7:0] lfsr_next(input logic [7:0] l);
    logic feedback;
    begin
      feedback = l[7] ^ l[5] ^ l[4] ^ l[3];
      lfsr_next = {l[6:0], feedback};
    end
  endfunction

  // �� gen_start Ϊ 1 ʱ���ɾ�������
  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      seed_reg <= 8'h1;  // ��ʼ������
      // �����������
      for (int i = 0; i < M; i++)
          for (int j = 0; j < K; j++)
              A[i][j] <= 0;
      for (int i = 0; i < K; i++)
          for (int j = 0; j < N; j++)
              B[i][j] <= 0;
    end else if (gen_start) begin
      logic [7:0] seed_local;
      seed_local = seed_reg;
      // ���� A ��������
      for (int i = 0; i < M; i++) begin
        for (int j = 0; j < K; j++) begin
          seed_local = lfsr_next(seed_local);
          A[i][j] <= seed_local[DATA_WIDTH-1:0];  // ȡ�� DATA_WIDTH λ
        end
      end
      // ���� B ��������
      for (int i = 0; i < K; i++) begin
        for (int j = 0; j < N; j++) begin
          seed_local = lfsr_next(seed_local);
          B[i][j] <= seed_local[DATA_WIDTH-1:0];
        end
      end
      seed_reg <= seed_local;  // ����ȫ������
    end
  end

endmodule
