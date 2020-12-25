/*
* smellnefty
* 03.10.2020
* Ver. 0.1
* Learning SystemVerilog
*/
//-------------------------------------------—
module LED (
//SYSTEM
input logic clk,
//USER
output logic led0,
output logic led1
);
//-------------------------------------------—
logic [1:0] led;
logic [24:0] counter;
//-------------------------------------------—
always @(posedge clk) begin
	if(counter == 25_000_000) begin
		counter <= 0;
		led <= ~led;
	end
	else begin
		counter <= counter + 1;
	end
end
//-------------------------------------------—
assign led0 = led;
assign led1 = ~led;
//-------------------------------------------—
endmodule 