//吳泓毅 0716050

`timescale 1ns/1ps

module alu(
           rst_n,         // negative reset            (input)
           src1,          // 32 bits source 1          (input)
           src2,          // 32 bits source 2          (input)
           ALU_control,   // 4 bits ALU control input  (input)
		 //bonus_control, // 3 bits bonus control input(input) 
           result,        // 32 bits result            (output)
           zero,          // 1 bit when the output is 0, zero must be set (output)
           cout,          // 1 bit carry out           (output)
           overflow       // 1 bit overflow            (output)
           );


input           rst_n;
input  [32-1:0] src1;
input  [32-1:0] src2;
input   [4-1:0] ALU_control;
//input   [3-1:0] bonus_control; 

output [32-1:0] result;
output          zero;
output          cout;
output          overflow;

reg    [32-1:0] result;
reg             zero;
reg             cout;
reg             overflow;

wire   [32-1:0] result_temp;
wire   [32-1:0] cout_temp;
wire            set;

assign set = (src1[31]^(~src2[31])^cout_temp[30]); 

// alu_top(src1, src2, less, A_invert, B_invert, cin, operation, result, cout);
alu_top g0(src1[0], src2[0], set, ALU_control[3], ALU_control[2], ALU_control[3]^ALU_control[2], ALU_control[1:0], result_temp[0], cout_temp[0]);
alu_top g1(src1[1], src2[1], 1'b0, ALU_control[3], ALU_control[2], cout_temp[0], ALU_control[1:0], result_temp[1], cout_temp[1]);
alu_top g2(src1[2], src2[2], 1'b0, ALU_control[3], ALU_control[2], cout_temp[1], ALU_control[1:0], result_temp[2], cout_temp[2]);
alu_top g3(src1[3], src2[3], 1'b0, ALU_control[3], ALU_control[2], cout_temp[2], ALU_control[1:0], result_temp[3], cout_temp[3]);
alu_top g4(src1[4], src2[4], 1'b0, ALU_control[3], ALU_control[2], cout_temp[3], ALU_control[1:0], result_temp[4], cout_temp[4]);
alu_top g5(src1[5], src2[5], 1'b0, ALU_control[3], ALU_control[2], cout_temp[4], ALU_control[1:0], result_temp[5], cout_temp[5]);
alu_top g6(src1[6], src2[6], 1'b0, ALU_control[3], ALU_control[2], cout_temp[5], ALU_control[1:0], result_temp[6], cout_temp[6]);
alu_top g7(src1[7], src2[7], 1'b0, ALU_control[3], ALU_control[2], cout_temp[6], ALU_control[1:0], result_temp[7], cout_temp[7]);
alu_top g8(src1[8], src2[8], 1'b0, ALU_control[3], ALU_control[2], cout_temp[7], ALU_control[1:0], result_temp[8], cout_temp[8]);
alu_top g9(src1[9], src2[9], 1'b0, ALU_control[3], ALU_control[2], cout_temp[8], ALU_control[1:0], result_temp[9], cout_temp[9]);
alu_top g10(src1[10], src2[10], 1'b0, ALU_control[3], ALU_control[2], cout_temp[9], ALU_control[1:0], result_temp[10], cout_temp[10]);
alu_top g11(src1[11], src2[11], 1'b0, ALU_control[3], ALU_control[2], cout_temp[10], ALU_control[1:0], result_temp[11], cout_temp[11]);
alu_top g12(src1[12], src2[12], 1'b0, ALU_control[3], ALU_control[2], cout_temp[11], ALU_control[1:0], result_temp[12], cout_temp[12]);
alu_top g13(src1[13], src2[13], 1'b0, ALU_control[3], ALU_control[2], cout_temp[12], ALU_control[1:0], result_temp[13], cout_temp[13]);
alu_top g14(src1[14], src2[14], 1'b0, ALU_control[3], ALU_control[2], cout_temp[13], ALU_control[1:0], result_temp[14], cout_temp[14]);
alu_top g15(src1[15], src2[15], 1'b0, ALU_control[3], ALU_control[2], cout_temp[14], ALU_control[1:0], result_temp[15], cout_temp[15]);
alu_top g16(src1[16], src2[16], 1'b0, ALU_control[3], ALU_control[2], cout_temp[15], ALU_control[1:0], result_temp[16], cout_temp[16]);
alu_top g17(src1[17], src2[17], 1'b0, ALU_control[3], ALU_control[2], cout_temp[16], ALU_control[1:0], result_temp[17], cout_temp[17]);
alu_top g18(src1[18], src2[18], 1'b0, ALU_control[3], ALU_control[2], cout_temp[17], ALU_control[1:0], result_temp[18], cout_temp[18]);
alu_top g19(src1[19], src2[19], 1'b0, ALU_control[3], ALU_control[2], cout_temp[18], ALU_control[1:0], result_temp[19], cout_temp[19]);
alu_top g20(src1[20], src2[20], 1'b0, ALU_control[3], ALU_control[2], cout_temp[19], ALU_control[1:0], result_temp[20], cout_temp[20]);
alu_top g21(src1[21], src2[21], 1'b0, ALU_control[3], ALU_control[2], cout_temp[20], ALU_control[1:0], result_temp[21], cout_temp[21]);
alu_top g22(src1[22], src2[22], 1'b0, ALU_control[3], ALU_control[2], cout_temp[21], ALU_control[1:0], result_temp[22], cout_temp[22]);
alu_top g23(src1[23], src2[23], 1'b0, ALU_control[3], ALU_control[2], cout_temp[22], ALU_control[1:0], result_temp[23], cout_temp[23]);
alu_top g24(src1[24], src2[24], 1'b0, ALU_control[3], ALU_control[2], cout_temp[23], ALU_control[1:0], result_temp[24], cout_temp[24]);
alu_top g25(src1[25], src2[25], 1'b0, ALU_control[3], ALU_control[2], cout_temp[24], ALU_control[1:0], result_temp[25], cout_temp[25]);
alu_top g26(src1[26], src2[26], 1'b0, ALU_control[3], ALU_control[2], cout_temp[25], ALU_control[1:0], result_temp[26], cout_temp[26]);
alu_top g27(src1[27], src2[27], 1'b0, ALU_control[3], ALU_control[2], cout_temp[26], ALU_control[1:0], result_temp[27], cout_temp[27]);
alu_top g28(src1[28], src2[28], 1'b0, ALU_control[3], ALU_control[2], cout_temp[27], ALU_control[1:0], result_temp[28], cout_temp[28]);
alu_top g29(src1[29], src2[29], 1'b0, ALU_control[3], ALU_control[2], cout_temp[28], ALU_control[1:0], result_temp[29], cout_temp[29]);
alu_top g30(src1[30], src2[30], 1'b0, ALU_control[3], ALU_control[2], cout_temp[29], ALU_control[1:0], result_temp[30], cout_temp[30]);
alu_top g31(src1[31], src2[31], 1'b0, ALU_control[3], ALU_control[2], cout_temp[30], ALU_control[1:0], result_temp[31], cout_temp[31]);

always @(*)
begin
    result = result_temp;
    zero = (result == 0) ? 1'b1 : 1'b0;
    cout = (ALU_control[1:0] == 2'b10) & cout_temp[31];
    overflow = (ALU_control[1:0] == 2'b10) & (cout_temp[30] ^ cout_temp[31]);
end

endmodule
