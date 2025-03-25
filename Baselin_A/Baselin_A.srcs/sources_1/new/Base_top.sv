module Base_top#(
    parameter int DATA_WIDTH = 2,
    parameter int M = 4,
    parameter int K = 4,
    parameter int N = 4,
    parameter int GAP_CYCLES = 5  // ������ɺ�ȴ���ʱ��������
)(
    input wire clk_p,   
    input wire clk_n,   
    input wire rst,  
    output logic [(2*DATA_WIDTH):0] C [M][N]
);
    // �źŶ���
    logic [DATA_WIDTH-1:0] A [M][K];
    logic [DATA_WIDTH-1:0] B [K][N];
    wire clk;
    logic cal_start;
    logic gen_start;
    logic done_cal;
    
    // ʱ�ӻ���
    IBUFGDS clkgen (
        .O(clk),
        .I(clk_p),
        .IB(clk_n)
    );
    
    // ���� A �� B ��ģ�飨�򻯺�� random_matrix��
    random_matrix #(
        .DATA_WIDTH(DATA_WIDTH),
        .M(M),
        .K(K),
        .N(N)
    ) randomGen (
        .clk(clk),
        .rst(rst),
        .gen_start(gen_start),
        .A(A),  
        .B(B)
    );
    
    // Systolic Array ����ģ��
    SystolicArray #(
        .DATA_WIDTH(DATA_WIDTH),
        .M(M),
        .N(N),
        .K(K)
    ) systolicArray (
        .clk(clk),
        .rst(rst),
        .start_cal(cal_start),
        .done_cal(done_cal), 
        .A(A),
        .B(B),
        .C(C)
    );
    
//    // ILA ʵ�������䣩
//    ila_0 u_ila_0(
//        .clk     (clk),
//        .probe0  (A[0][0]),
//        .probe1  (A[1][0]),
//        .probe2  (A[2][0]),
//        .probe3  (A[3][0]),
//        .probe4  (B[0][1]),
//        .probe5  (B[1][1]),
//        .probe6  (B[2][1]),
//        .probe7  (B[3][1]),
//        .probe8  (C[0][2]),
//        .probe9  (C[1][2]),
//        .probe10 (C[2][2]),
//        .probe11 (C[3][2]),
//        .probe12 (C[0][3]),
//        .probe13 (C[1][3]),
//        .probe14 (C[2][3]),
//        .probe15 (C[3][3])
//    );
    
    // ����״̬��
    typedef enum logic [1:0] {
        S_GEN,   // �����������ɣ�gen_start Ϊ1
        S_CAL,   // �������㿪ʼ��cal_start Ϊ1
        S_WAIT,  // �ȴ��������
        S_GAP    // ������ɺ�ȴ�һ�μ���������¿�ʼ
    } state_t;
    state_t state, next_state;
    logic [7:0] gap_counter; // ���ڵȴ����
    
    // ״̬��˳���߼�
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S_GEN;
            gap_counter <= 0;
        end else begin
            state <= next_state;
            if (state == S_GAP)
                gap_counter <= gap_counter + 1;
            else
                gap_counter <= 0;
        end
    end
    
    // ״̬������߼�������ź�����
    always_comb begin
        // Ĭ���ź�
        gen_start = 0;
        cal_start = 0;
        next_state = state;
        case (state)
            S_GEN: begin
                // ������ S_GEN ״̬ʱ����� gen_start ����
                gen_start = 1;
                next_state = S_CAL;
            end
            S_CAL: begin
                // S_CAL ״̬�£���� cal_start ����
                cal_start = 1;
                next_state = S_WAIT;
            end
            S_WAIT: begin
                // �ȴ� SystolicArray ����������
                if (done_cal)
                    next_state = S_GAP;
                else
                    next_state = S_WAIT;
            end
            S_GAP: begin
                // �ȴ� GAP_CYCLES ��ʱ�����ں�����״̬��
                if (gap_counter >= GAP_CYCLES)
                    next_state = S_GEN;
                else
                    next_state = S_GAP;
            end
            default: next_state = S_GEN;
        endcase
    end

endmodule
