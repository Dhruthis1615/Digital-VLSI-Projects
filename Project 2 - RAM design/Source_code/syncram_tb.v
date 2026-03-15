`timescale 1ns/1ps

module sync_ram_tb;

    reg clk;
    reg rst;
    reg we;
    reg [3:0] addr;
    reg [7:0] data_in;
    wire [7:0] data_out;

    // Instantiate RAM
    sync_ram uut (
        .clk(clk),
        .rst(rst),
        .we(we),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        we = 0;
        addr = 0;
        data_in = 0;

        // Apply Reset
        #10 rst = 0;

        // WRITE OPERATION
        #10 we = 1; addr = 4'b0001; data_in = 8'hAA;
        #10 addr = 4'b0010; data_in = 8'h55;

        // STOP WRITE
        #10 we = 0;

        // READ OPERATION
        #10 addr = 4'b0001;
        #10 addr = 4'b0010;

        #20 $finish;
    end

endmodule
