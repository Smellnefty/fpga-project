/*
* smellnefty
* 19.12.2020
* Ver. 0.1
* Code to test the program
*/
//-------------------------------------------�
`timescale 1ps/1ps
//-------------------------------------------�
module TEST();
logic clk = 0;
logic reset;
logic btn1;
logic btn2;
logic [3:0] led;
//-------------------------------------------�
QSTEST tqstest 
(
.clk(clk),
.reset(reset),
.btn1(btn1),
.btn2(btn2),
.led(led)
);
//-------------------------------------------�
always begin
#2 clk = !clk;
end
//------------------------------------------�
initial begin
btn2 = 1;
btn1 = 1;
reset = 1;
#10000;
btn2 = 0;
#10;
btn2 = 1;
#10000;
btn2 = 0;
#10;
btn2 = 1;
#10000;
btn1 = 0;
#10;
btn1 = 1;
#10000;
btn2 = 0;
#10;
btn2 = 1;
#10000;
btn2 = 0;
#10;
btn2 = 1;
#10000;
btn2 = 0;
#10;
btn2 = 1;
#10000;
btn1 = 0;
#10;
btn1 = 1;
#10000;
btn2 = 0;
#10;
btn2 = 1;
#10000;
end
//-------------------------------------------�
endmodule