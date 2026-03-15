module filter(
input clk,
input reset,
input signed [15:0] x_in,
output reg signed [31:0] y_out
);
parameter signed h0=16'd1;
parameter signed h1=16'd2;
parameter signed h2=16'd3;
parameter signed h3=16'd4;
reg signed[15:0]x1, x2, x3;
always @ (posedge clk or posedge reset)begin
if (reset) begin
x1<= 0;
x2 <= 0;
x3<= 0;
y_out<= 0;
end
else begin
x3<= x2;
x2<= x1;
x1<= x_in;
y_out<= (h0*x_in)+(h1*x1)+(h2*x2)+(h3*x3);
end
end
endmodule
