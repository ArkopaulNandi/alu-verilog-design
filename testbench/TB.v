`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2025 21:15:33
// Design Name: 
// Module Name: TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TB;
wire [3:0]Add, Diff, Twos, Inc, Dec, Bit_and, Bit_or, Bit_xor, Ones, Sh_left, Sh_right, Ar_right, Ro_left, Ro_right;
wire [3:0]y;
wire Cout;
reg [3:0]A,B,S;

alu dut(Add, Diff, Twos, Inc, Dec, Bit_and, Bit_or, Bit_xor, Ones, Sh_left, Sh_right, Ar_right, Ro_left, Ro_right, y, Cout, A,B,S);

initial begin
A = 4'b1001; B = 4'b0001;
#10 S = 4'b0000;
#10 S = 4'b1100;
#10 S = 4'b1001;
end
endmodule
