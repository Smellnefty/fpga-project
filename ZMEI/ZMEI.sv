/*
* smellnefty
* 7.11.2020
* Ver. 0.3
* Speed change by button
*/
//-------------------------------------------—
module ZMEI (
//SYSTEM
input logic clk,
input logic reset,
input logic btn1,
input logic btn2,
//USER
output logic [3:0] led);
//-------------------------------------------—
typedef enum {RIGHT, LEFT} e_state;
e_state state;
//-------------------------------------------—
logic [31:0] counter;
logic [28:0] max_cnt = 50_000_000;
//-------------------------------------------—
always @(negedge btn2) begin
	case (max_cnt)
		25_000_000: max_cnt <= 100_000_000;
		50_000_000: max_cnt <= 25_000_000;
		100_000_000: max_cnt <= 50_000_000;
	endcase
end
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
			else if(counter == max_cnt) begin
				led[0] <= 1;
				led[1] <= 0;
				led[2] <= 1;
				led[3] <= 1;
				counter <= counter + 1;
			end
			else if(counter == 2 * max_cnt) begin
				led[0] <= 1;
				led[1] <= 1;
				led[2] <= 0;
				led[3] <= 1;
				counter <= counter + 1;
			end
			else if(counter == 3 * max_cnt) begin
				led[0] <= 1;
				led[1] <= 1;
				led[2] <= 1;
				led[3] <= 0;
				counter <= counter + 1;
			end
			else if(counter == 4 * max_cnt) begin
				counter <= 0;
			end
			else begin
				if(!btn1) begin
					led[0] <= 0;
					led[1] <= 0;
					led[2] <= 0;
					led[3] <= 0;
					counter <= 0;
					state <= LEFT;
				end
				else begin
					counter <= counter + 1;
				end
			end
		end
	else 
		if(state == LEFT) begin
			if(counter == 0) begin
				led[0] <= 1;
				led[1] <= 1;
				led[2] <= 1;
				led[3] <= 0;
				counter <= counter + 1;
			end
			else if(counter == max_cnt) begin
				led[0] <= 1;
				led[1] <= 1;
				led[2] <= 0;
				led[3] <= 1;
				counter <= counter + 1;
			end
			else if(counter == 2 * max_cnt) begin
				led[0] <= 1;
				led[1] <= 0;
				led[2] <= 1;
				led[3] <= 1;
				counter <= counter + 1;
			end
			else if(counter == 3 * max_cnt) begin
				led[0] <= 0;
				led[1] <= 1;
				led[2] <= 1;
				led[3] <= 1;
				counter <= counter + 1;
			end
			else if(counter == 4 * max_cnt) begin
				counter <= 0;
			end
			else begin
				if(!btn1) begin
					led[0] <= 0;
					led[1] <= 0;
					led[2] <= 0;
					led[3] <= 0;
					counter <= 0;
					state <= RIGHT;
				end
				else begin
					counter <= counter + 1;
				end
			end
		end
end
//-------------------------------------------—
endmodule
