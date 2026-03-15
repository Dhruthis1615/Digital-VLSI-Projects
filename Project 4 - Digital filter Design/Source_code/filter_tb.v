module filter_tb;
reg clk;
reg reset;
reg signed [15:0] x_in;
wire signed [31:0] y_out;
filter uut(
.clk(clk),
.reset(reset),
.x_in(x_in),
.y_out(y_out)
);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin 
reset =1;
#10;
reset=0;
x_in = 10; #10;
x_in = 20; #10;
x_in = 30; #10;
x_in = 40; #10;
x_in = 50; #10;
#50;
$finish;
end
endmodule
