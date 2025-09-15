`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Arkopaul Nandi
// 
// Create Date: 06.09.2025 19:19:34
// Design Name: Arithmetic and Logical Unit
// Module Name: alu
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


module alu(output [3:0]Add, Diff, Twos, Inc, Dec, Bit_and, Bit_or, Bit_xor, Ones, Sh_left, Sh_right, Ar_right, Ro_left, Ro_right, output reg [3:0]y, output Cout, 
input [3:0]A,B,S);
wire Cout_add, Cout_diff, Cout_twos, Cout_inc, Cout_dec;
// Arithmetic Unit
// Add
Ripple_adder R0(Add, Cout_add, A, B, 0);
// Subtract
Ripple_adder R1(Diff, Cout_diff, A, (~B), 1);
// 2's Complement
Ripple_adder R2(Twos, Cout_twos, 0, (~B), 1);
// Increment
Ripple_adder R3(Inc, Cout_inc, A, 0, 1);
// Decrement
Ripple_adder R4(Dec, Cout_dec, A, (~(4'b1)), 1);

// Multiplexed Logic for Cout
assign Cout = (S == 4'b0000) ? Cout_add : (S == 4'b0001) ? Cout_diff : (S == 4'b0010) ? Cout_twos : (S == 4'b0011) ? Cout_inc : (S == 4'b0100) ? Cout_dec : 
(S == 4'b1001) ? A[3] : (S == 4'b1010) ? A[0] : (S == 4'b1011) ? A[0] : (S == 4'b1100) ? A[3] : (S == 4'b1101) ? A[0] : 1'b0; 

// Logical Unit
// Bitwise AND
assign Bit_and = A & B;
// Bitwise OR
assign Bit_or = A | B;
// Bitwise XOR
assign Bit_xor = A ^ B;
// 1's Complement
assign Ones = ~A;
// Shifter
// Logical Shift Left
assign Sh_left = A << 1;
// Logical Shift Right
assign Sh_right = A >> 1;
// Arithmetic Shift Right
assign Ar_right = A >>> 1;
// Rotate Left
assign Ro_left = {A[2:0], A[3]};
// Rotate Right
assign Ro_right = {A[0], A[3:1]};

always @ (*) begin
case(S)
4'b0000: y = Add;
4'b0001: y = Diff;
4'b0010: y = Twos;
4'b0011: y = Inc;
4'b0100: y = Dec; 
4'b0101: y = Bit_and;
4'b0110: y = Bit_or;
4'b0111: y = Bit_xor;
4'b1000: y = Ones;  
4'b1001: y = Sh_left;
4'b1010: y = Sh_right;
4'b1011: y = Ar_right;
4'b1100: y = Ro_left;
4'b1101: y = Ro_right; 
default: y = 4'b0000;
endcase
end
endmodule
