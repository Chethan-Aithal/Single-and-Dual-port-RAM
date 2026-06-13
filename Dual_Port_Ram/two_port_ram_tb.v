`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2026 15:50:31
// Design Name: 
// Module Name: two_port_ram_tb
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


module two_port_ram_tb;
reg [7:0] data_a, data_b;
reg [5:0] addr_a, addr_b;
reg wr_a, wr_b;
reg clk;
wire [7:0] q_a, q_b;
dual_port_ram dut (
        .data_a(data_a),
        .data_b(data_b),
        .addr_a(addr_a),
        .addr_b(addr_b),
        .wr_a(wr_a),
        .wr_b(wr_b),
        .clk(clk),
        .q_a(q_a),
        .q_b(q_b)
    );
initial 
   begin
        clk = 0;
        forever #5 clk = ~clk;
    end
initial
 begin

        // Write 1  Port A
        wr_a   = 1;
        addr_a = 6'd5;
        data_a = 8'hAA;

        wr_b   = 0;
        #10;

        // Write 2  Port A
        addr_a = 6'd8;
        data_a = 8'hBB;
        #10;

        // Write 1  Port B
        wr_a   = 0;
        wr_b   = 1;
        addr_b = 6'd10;
        data_b = 8'h55;
        #10;

        // Write 2  Port B
        addr_b = 6'd15;
        data_b = 8'hCC;
        #10;

        // Read 1  Port A
        wr_b   = 0;
        addr_a = 6'd5;
        #10;

        // Read 2  Port A
        addr_a = 6'd8;
        #10;

        // Read 1  Port B
        addr_b = 6'd10;
        #10;

        // Read 2 Port B
        addr_b = 6'd15;
        #10;

$finish;
 end
endmodule



