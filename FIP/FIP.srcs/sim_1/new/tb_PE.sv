module tb_PE;

    parameter DATA_WIDTH = 8;

    logic clk;
    logic rst;
    logic [DATA_WIDTH-1:0] A1_in;
    logic [DATA_WIDTH-1:0] A2_in;
    logic [DATA_WIDTH-1:0] B1_in;
    logic [DATA_WIDTH-1:0] B2_in;
    logic [2*DATA_WIDTH+4:0] C_in;
    logic [DATA_WIDTH-1:0] A1_out;
    logic [DATA_WIDTH-1:0] A2_out;
    logic [DATA_WIDTH-1:0] B1_out;
    logic [DATA_WIDTH-1:0] B2_out;
    logic [2*DATA_WIDTH+4:0] C_out;

    // ʵ���� PE ģ��
    PE #(.DATA_WIDTH(DATA_WIDTH)) uut (
        .clk(clk),
        .rst(rst),
        .A1_in(A1_in),
        .A2_in(A2_in),
        .B1_in(B1_in),
        .B2_in(B2_in),
        .C_in(C_in),
        .A1_out(A1_out),
        .A2_out(A2_out),
        .B1_out(B1_out),
        .B2_out(B2_out),
        .C_out(C_out)
    );

    // ʱ���ź�����
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // ʱ������Ϊ10ns
    end

    // ��ʼ�������ź�
    initial begin
        rst = 1;
        A1_in = 0;
        A2_in = 0;
        B1_in = 0;
        B2_in = 0;
        C_in = 0;
        #10;
        rst = 0;
        
        // ������������
        #10;
        A1_in = 3;
        A2_in = 4;
        B1_in = 5;
        B2_in = 2;
        C_in = 10;

        #10;
        A1_in = 0;
        A2_in = 0;
        B1_in = 0;
        B2_in = 0;
        C_in = 0;
        #10;
        $stop;
    end

    // �������仯
    always @(posedge clk) begin
        $display("Time: %0t ns, A1_in=%0d, A2_in=%0d, B1_in=%0d, B2_in=%0d, C_in=%0d, C_out=%0d",
                 $time, A1_in, A2_in, B1_in, B2_in, C_in, C_out);
    end

endmodule
