`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2025 19:29:09
// Design Name: 
// Module Name: Ripple_adder
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


module Ripple_adder(output [3:0]S, output Cout, input [3:0]A,B, input Cin);
wire c1, c2, c3;
Full_adder FA0(S[0], c1, A[0], B[0], Cin);
Full_adder FA1(S[1], c2, A[1], B[1], c1);
Full_adder FA2(S[2], c3, A[2], B[2], c2);
Full_adder FA3(S[3], Cout, A[3], B[3], c3);
endmodule
