`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2018 07:03:28 PM
// Design Name: 
// Module Name: for1_module
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


module for1_module(A,Y, Valid);
  input [7:0] A;
  output reg [2:0] Y;
  output reg Valid;

  integer N;

  always @ (A)
  begin
    Valid = 0;
    Y = 3'bX;

    for (N = 0; N < 8; N = N + 1)
      if (A[N])
      begin
        Valid = 1;
        Y = N;
      end
  end
endmodule