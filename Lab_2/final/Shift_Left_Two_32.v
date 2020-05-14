// Author:0716025 薛皓謙, 0716050 吳泓毅

module Shift_Left_Two_32(
    data_i,
    data_o
    );

//I/O ports
input [32-1:0] data_i;
output [32-1:0] data_o;

reg [31:0] data_o;

always@(data_i)
begin
	data_o <= data_i<<2;
end

endmodule
