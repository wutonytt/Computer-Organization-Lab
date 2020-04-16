//吳泓毅 0716050

`timescale 1ns/1ps

module alu_top(
               src1,       //1 bit source 1 (input)
               src2,       //1 bit source 2 (input)
               less,       //1 bit less     (input)
               A_invert,   //1 bit A_invert (input)
               B_invert,   //1 bit B_invert (input)
               cin,        //1 bit carry in (input)
               operation,  //operation      (input)
               result,     //1 bit result   (output)
               cout       //1 bit carry out(output)
               );

input         src1;
input         src2;
input         less;
input         A_invert;
input         B_invert;
input         cin;
input [2-1:0] operation;

output        result;
output        cout;

reg           result;
reg           cout;
reg           a_out, b_out;

always@( * )
begin
    a_out = src1 ^ A_invert;
    b_out = src2 ^ B_invert;

    case (operation)
        2'b00:
        begin
            result = a_out & b_out;
            cout = 1'b0;
        end
        2'b01:
        begin
            result = a_out | b_out;
            cout = 1'b0;
        end
        2'b10:
        begin
            result = a_out ^ b_out ^ cin;
            cout = (a_out & b_out) | (b_out & cin) | (cin & a_out);
        end
        2'b11:
        begin
            result = less;
            cout = (a_out & b_out) | (b_out & cin) | (cin & a_out);
        end
    endcase
end

endmodule
