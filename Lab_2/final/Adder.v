// Author: 0716050 吳泓毅, 0716025 薛皓謙

module Adder(
    src1_i,
    src2_i,
    sum_o
    );

//I/O ports
input  [32-1:0]  src1_i;
input  [32-1:0]	 src2_i;
output [32-1:0]	 sum_o;

//Internal Signals
wire   [32-1:0]	 sum_o;

assign sum_o = src1_i + src2_i;

endmodule