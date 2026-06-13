`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2026 12:05:54
// Design Name: 
// Module Name: single_port_ram
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

module single_port_ram #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 6
)(
    input  [DATA_WIDTH-1:0] data,
    input  [ADDR_WIDTH-1:0] addr,
    input  wr,
    input  clk,
    output [DATA_WIDTH-1:0] q
);
reg [DATA_WIDTH-1:0] mem [(2**ADDR_WIDTH)-1:0];
reg [ADDR_WIDTH-1:0] addr_reg;

always @(posedge clk)
begin
// Write 
if(wr)
mem[addr] <= data;
// Read 
else
addr_reg <= addr;
end
assign q = mem[addr_reg];
endmodule

