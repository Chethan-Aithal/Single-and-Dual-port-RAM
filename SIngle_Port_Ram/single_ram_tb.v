`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2026 12:11:42
// Design Name: 
// Module Name: single_ram_tb
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


module single_ram_tb;
    reg [7:0] data;
    reg [5:0] addr;
    reg wr;
    reg clk;
    wire [7:0] q;
    single_port_ram #(
        .DATA_WIDTH(8),
        .ADDR_WIDTH(6)
    ) dut (
        .data(data),
        .addr(addr),
        .wr(wr),
        .clk(clk),
        .q(q)
    );
    always #5 clk = ~clk;
    initial
     begin
        clk = 0;
    end

    initial
     begin
// Write AA at address 5
wr=1;
addr=6'd5;
data=8'hAA;
#10;
 // Write 55 at address 10
addr=6'd10;
data=8'h55;
#10;

// Read from address 5
 wr=0;
addr=6'd5;
#10;
$display("Address = %0d, Data = %h", addr, q);
// Read from address 10
addr=6'd10;
#10;
$display("Address = %0d, Data = %h", addr, q);
#10;
$finish;

end
endmodule



