`timescale 1ns/1ps

module tb_FIP_TC;

  // ��������
  parameter DATA_WIDTH = 2;
  parameter M = 4;
  parameter K = 4;  // ����Ϊż��
  parameter N = 4;

  logic clk;
  logic rst;
  logic gen_done;

  // ������� A (M��K) �� B (K��N)
  logic [DATA_WIDTH-1:0] A [0:M-1][0:K-1];
  logic [DATA_WIDTH-1:0] B [0:K-1][0:N-1];

  // ���������alaph (ÿ�еĵ��) �� beta (ÿ�еĵ��)
  logic [2*DATA_WIDTH+1:0] alaph [0:M-1];
  logic [2*DATA_WIDTH+1:0] beta  [0:N-1];

  // ʵ��������ģ��
  // ��ȷ��ģ�� Calc_Alpha_Beta_Adapted �ڲ������ɿ����������в������ƥ�䣺
  //   - for alaph�����ɿ�����Ϊ gen_alaph[i]���ڲ� LUT ʵ����Ϊ LUT_alpha_inst
  //   - for beta: ���ɿ�����Ϊ gen_beta_col[j]���ڲ� LUT ʵ����Ϊ LUT_beta_inst
  Calc_Alpha_Beta_Adapted #(
    .DATA_WIDTH(DATA_WIDTH),
    .M(M),
    .K(K),
    .N(N)
  ) calc_inst (
    .clk(clk),
    .rst(rst),
    .gen_done(gen_done),
    .A(A),
    .B(B),
    .alaph(alaph),
    .beta(beta)
  );

  // ʱ�����ɣ�����10ns
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // ��������λ���ͷ� rst������ gen_done �ø����������㣬ͬʱ��ʼ�� A �� B ����
  initial begin
    rst = 1;
    gen_done = 0;
    #20;
    rst = 0;
    gen_done = 1;
    
    // ��ʼ�� A ����4��4����ȡֵ��Χ 0~3
    A[0] = '{0, 1, 2, 3};
    A[1] = '{1, 2, 3, 0};
    A[2] = '{2, 3, 0, 1};
    A[3] = '{3, 0, 1, 2};
    
    // ��ʼ�� B ����4��4��
    B[0] = '{0, 1, 2, 3};
    B[1] = '{1, 2, 3, 0};
    B[2] = '{2, 3, 0, 1};
    B[3] = '{3, 0, 1, 2};
    
    #200;
    $finish;
  end

  // ÿ��ʱ�������ش�ӡ A��B��alaph��beta ��ÿ�� LUT ���м��ź�
  always @(posedge clk) begin
    integer i, j;
    $display("-------------------------------------------------------");
    $display("Time = %0t", $time);

    // ��ӡ A ����
    $display("Matrix A:");
    for (i = 0; i < M; i = i + 1) begin
      $write("A[%0d]: ", i);
      for (j = 0; j < K; j = j + 1)
        $write("%0d ", A[i][j]);
      $display("");
    end

    // ��ӡ B ����
    $display("Matrix B:");
    for (i = 0; i < K; i = i + 1) begin
      $write("B[%0d]: ", i);
      for (j = 0; j < N; j = j + 1)
        $write("%0d ", B[i][j]);
      $display("");
    end

    // ��ӡ������
    $display("alaph results (row dot products):");
    for (i = 0; i < M; i = i + 1)
      $display("alaph[%0d] = %0d", i, alaph[i]);
      
    $display("beta results (column dot products):");
    for (j = 0; j < N; j = j + 1)
      $display("beta[%0d] = %0d", j, beta[j]);

    // ��ӡÿ�� alaph LUT ���м��ź�
    for (i = 0; i < M; i = i + 1) begin
      $display("Row %0d LUT (alaph) internals:", i);
      // ע�������ã�calc_inst.gen_alaph[i].LUT_alpha_inst
      $display("   t = %0d", calc_inst.gen_alaph[i].LUT_alpha_inst.t);
      $display("   bit_array = %b", calc_inst.gen_alaph[i].LUT_alpha_inst.bit_array);
      $display("   C (accumulated value) = %0d", calc_inst.gen_alaph[i].LUT_alpha_inst.C);
    end

    // ��ӡÿ�� beta LUT ���м��ź�
    for (j = 0; j < N; j = j + 1) begin
      $display("Column %0d LUT (beta) internals:", j);
      // ע�������ã�calc_inst.gen_beta_col[j].LUT_beta_inst
      $display("   t = %0d", calc_inst.gen_beta_col[j].LUT_beta_inst.t);
      $display("   bit_array = %b", calc_inst.gen_beta_col[j].LUT_beta_inst.bit_array);
      $display("   C (accumulated value) = %0d", calc_inst.gen_beta_col[j].LUT_beta_inst.C);
    end
  end

endmodule
