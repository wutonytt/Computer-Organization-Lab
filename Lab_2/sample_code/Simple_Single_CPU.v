// Author: 0716050 吳泓毅

module Simple_Single_CPU(
    clk_i,
    rst_i
    );

// Input port
input clk_i;
input rst_i;

// Internal Signals
wire [32-1:0] PC_i, PC_o, PC_plus_4, PC_Branch, PC_next;
wire [32-1:0] instr;
wire RegDst, RDaddr;
wire ALU_op, ALUSrc, ALUCtrl,ALU_result;
wire RegWrite;
wire RSdata, RTdata;
wire Branch;
wire SE_o, Shift_o;
wire operand2;
wire zero;

ProgramCounter PC(
    .clk_i(clk_i),
    .rst_i (rst_i),
    .pc_in_i(PC_i),
    .pc_out_o(PC_o)
    );

Adder Adder1(
    .src1_i(PC_o),
    .src2_i(32'd4),
    .sum_o(PC_plus_4)
    );

Instr_Memory IM(
    .pc_addr_i(PC_o),
    .instr_o(instr)
    );

MUX_2to1 #(.size(5)) Mux_Write_Reg(
    .data0_i(instr[20:16]),
    .data1_i(instr[15:11]),
    .select_i(RegDst),
    .data_o(RDaddr)
    );

Reg_File RF(
    .clk_i(clk_i),
    .rst_i(rst_i) ,
    .RSaddr_i(instr[25:21]) ,
    .RTaddr_i(instr[20:16]) ,
    .RDaddr_i(RDaddr) ,
    .RDdata_i(ALU_result)  ,
    .RegWrite_i(RegWrite),
    .RSdata_o(RSdata) ,
    .RTdata_o(RTdata)
    );

Decoder Decoder(
    .instr_op_i(instr[31:26]),
    .RegWrite_o(RegWrite),
    .ALU_op_o(ALU_op),
    .ALUSrc_o(ALUSrc),
    .RegDst_o(RegDst),
    .Branch_o(Branch)
    );

ALU_Ctrl AC(
    .funct_i(instr[5:0]),
    .ALUOp_i(ALU_op),
    .ALUCtrl_o(ALU_Ctrl)
    );

Sign_Extend SE(
    .data_i(instr[15:0]),
    .data_o(SE_o)
    );

MUX_2to1 #(.size(32)) Mux_ALUSrc(
    .data0_i(RTdata),
    .data1_i(SE_o),
    .select_i(ALUSrc),
    .data_o(operand2)
    );

ALU ALU(
    .src1_i(RSdata),
    .src2_i(operand2),
    .ctrl_i(ALU_Ctrl),
    .result_o(ALU_result),
    .zero_o(zero)
    );

Adder Adder2(
    .src1_i(PC_plus_4),
    .src2_i(Shift_o),
    .sum_o(PC_Branch)
    );

Shift_Left_Two_32 Shifter(
    .data_i(SE_o),
    .data_o(Shift_o)
    );

MUX_2to1 #(.size(32)) Mux_PC_Source(
    .data0_i(PC_plus_4),
    .data1_i(PC_Branch),
    .select_i(Branch & zero),
    .data_o(PC_next)
    );

endmodule
