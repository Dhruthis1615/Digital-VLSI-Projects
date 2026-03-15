`timescale 1ns/1ps
module sync_ram (
    input clk,
    input rst, // Active high reset
    input we, // Write Enable
    input [3:0] addr, // 16 locations
    input [7:0] data_in, // 8-bit data input
    output reg [7:0] data_out // 8-bit data output
);

    // 16x8 Memory
    reg [7:0] memory [15:0];

    integer i;

    // Reset + Read/Write operation
    always @(posedge clk) begin
        if (rst) begin
            // Clear memory during reset
            for (i = 0; i < 16; i = i + 1)
                memory[i] <= 8'h00;

            data_out <= 8'h00;
        end
        else begin
            if (we) begin
                memory[addr] <= data_in; // WRITE
            end
            else begin
                data_out <= memory[addr]; // READ
            end
        end
    end

endmodule


