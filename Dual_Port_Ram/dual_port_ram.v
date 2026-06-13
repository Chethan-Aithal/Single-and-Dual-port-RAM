`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2026 15:39:16
// Design Name: 
// Module Name: dual_port_ram
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


module dual_port_ram
#(parameter DATA_width=8,
parameter ADDR_width=6,
parameter MEM_width=64
)
(
input [DATA_width-1:0]data_a,data_b,
input [ADDR_width-1:0]addr_a,addr_b,
input wr_a,wr_b,
input clk,
output reg [DATA_width-1:0]q_a,q_b
);
reg[DATA_width-1:0]mem[MEM_width-1:0];
always@(posedge clk)
begin
if(wr_a)
mem[addr_a]<=data_a;
else
q_a<=mem[addr_a];
end

always@(posedge clk)
begin
if(wr_b)
mem[addr_b]<=data_b;
else
q_b<=mem[addr_b];
end

endmodule
