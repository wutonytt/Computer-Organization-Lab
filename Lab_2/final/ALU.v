// Author: 0716050 吳泓毅, 0716025 薛皓謙

module ALU(
    src1_i,
    src2_i,
    ctrl_i,
    shamt,
    result_o,
    zero_o
    );

//I/O ports
input  [32-1:0]  src1_i;
input  [32-1:0]	 src2_i;
input  [4-1:0]   ctrl_i;
input  [4:0]     shamt;

output [32-1:0]	 result_o;
output           zero_o;

//Internal signals
reg    [32-1:0]  result_o;
wire             zero_o;

always @(*)
begin
    case (ctrl_i)
        4'b0000: result_o = src1_i & src2_i;                //and
        4'b0001: result_o = src1_i | src2_i;                //or
        4'b0010: result_o = src1_i + src2_i;                //add
        4'b0110: result_o = src1_i - src2_i;                //sub
        4'b0111: result_o = ($signed(src1_i) < $signed(src2_i)) ? 1 : 0;      //slt
        4'b0011: result_o = (src1_i < src2_i) ? 1 : 0;      //sltiu
        4'b1100: result_o = ~(src1_i | src2_i);             //nor
        4'b1000: result_o = $signed(src2_i) >>> src1_i;     //srav
        4'b1101: result_o = $signed(src2_i) >>> shamt;      //sra
        4'b1001: result_o = src2_i << 16;                   //lui
        4'b1010: result_o = (src1_i == src2_i) ? 0 : 1;     //bne
        4'b1111: 
            begin
                result_o[31:16] = src1_i[31:16];
                result_o[15:0] = src1_i[15:0] | src2_i[15:0];//ori
            end

        default: result_o = 0;
    endcase
end

assign zero_o = (result_o == 0) ^ (ctrl_i == 4'b1010);

endmodule
