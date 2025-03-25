module random_matrix#( 
    parameter int DATA_WIDTH = 2,  // ÿ��Ԫ��2λ��0~3
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

  // ʹ��һ��16λ�Ĵ�����ΪLFSR���ӣ���ʼֵΪ10086
  logic [15:0] seed_reg;

  // ���ö���ʽ��x^16 + x^14 + x^13 + x^11 + 1
  function automatic logic [15:0] lfsr_next(input logic [15:0] l);
    logic feedback;
    begin
      feedback = l[15] ^ l[13] ^ l[12] ^ l[10];
      lfsr_next = {l[14:0], feedback};
    end
  endfunction

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      // ��ʼ����������������
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
      // �þֲ������������ӣ�������ѭ����ֱ�Ӹ���ȫ������
      logic [15:0] seed_local;
      seed_local = seed_reg;
      
      // ���� A ��������
      for (int i = 0; i < M; i++) begin
        for (int j = 0; j < K; j++) begin
          seed_local = lfsr_next(seed_local);
          A[i][j] <= seed_local[DATA_WIDTH-1:0]; // ȡ��2λ
        end
      end
      
      // ���� B ��������
      for (int i = 0; i < K; i++) begin
        for (int j = 0; j < N; j++) begin
          seed_local = lfsr_next(seed_local);
          B[i][j] <= seed_local[DATA_WIDTH-1:0]; // ȡ��2λ
        end
      end
      
      // ����ȫ������
      seed_reg <= seed_local;
    end
  end

endmodule
