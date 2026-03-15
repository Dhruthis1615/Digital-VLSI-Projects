module tb_p();
reg clk,reset;
wire[15:0]result1;
wire[15:0]result4;
wire[15:0]result5;
pipeline_processor uut(clk, reset,result1,result4, result5);
integer i;
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
reset=1;
#10
reset=0;
for(i=0;i<16;i=i+1)
uut.instr_mem[i]=16'b0;
uut.reg_file[2]=10;
uut.reg_file[3]=50;
uut.instr_mem[0]=16'b010_001_000_0000101;
uut.data_mem[5]=16'd50;
uut.instr_mem[1]=16'b000_100_010_0110000;
uut.instr_mem[2]=16'b001_101_010_0110000;
#200;
$finish;
end
endmodule
