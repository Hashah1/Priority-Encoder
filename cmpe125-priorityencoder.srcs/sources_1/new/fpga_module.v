`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2018 07:24:07 PM
// Design Name: 
// Module Name: fpga_module
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


module fpga_module(
        input  wire [7:0] IN_SWITCHES,
        output wire [2:0] OUT_LED,
        output wire VALID_LED
    );

    casez1_module PE (
            .A              (IN_SWITCHES),
            .Y              (OUT_LED),
            .Valid          (VALID_LED)
        );
endmodule