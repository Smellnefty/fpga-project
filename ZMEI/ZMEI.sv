/*
* smellnefty
* 10.10.2020
* Ver. 0.1
* Diodes move to the right
*/
//-------------------------------------------—
module ZMEI (
//SYSTEM
input logic clk,
input logic reset,
//USER
output logic [3:0] led);
//-------------------------------------------—
typedef enum {RIGHT} e_state;
e_state state;
//-------------------------------------------—
logic [31:0] counter;
//-------------------------------------------—
always @(posedge clk) begin
	if(!reset) begin
		led[0] <= 1;
		led[1] <= 1;
		led[2] <= 1;
		led[3] <= 1;
		counter <= 0;
		state <= RIGHT;
	end
	else
		if(state == RIGHT) begin
			if(counter == 0) begin
				led[0] <= 0;
				led[1] <= 1;
				led[2] <= 1;
				led[3] <= 1;
				counter <= counter + 1;
			end
			else if(counter == 50_000_000) begin
				led[0] <= 1;
				led[1] <= 0;
				led[2] <= 1;
				led[3] <= 1;
				counter <= counter + 1;
			end
			else if(counter == 100_000_000) begin
				led[0] <= 1;
				led[1] <= 1;
				led[2] <= 0;
				led[3] <= 1;
				counter <= counter + 1;
			end
			else if(counter == 150_000_000) begin
				led[0] <= 1;
				led[1] <= 1;
				led[2] <= 1;
				led[3] <= 0;
				counter <= counter + 1;
			end
			else if(counter == 200_000_000) begin
				counter <= 0;
			end
			else begin
				counter <= counter + 1;
			end
		end
end
//-------------------------------------------—
endmodule
