/*
* smellnefty
* 28.11.2020
* Ver. 1.0
* Snake game of FPGA diodes
*/
//-------------------------------------------—
`define MAX25 25_000_000
`define MAX50 50_000_000
`define MAX75 75_000_000
`define MAX100 100_000_000
`define MAX150 150_000_000
`define MAX200 200_000_000
`define MAX225 225_000_000
`define MAX300 300_000_000
//-------------------------------------------—
module ZMEI (
//SYSTEM
input logic clk,
input logic reset,
input logic btn1,
input logic btn2,
//USER
output logic [3:0] led
);
//-------------------------------------------—
typedef enum {RIGHT, LEFT, SPEED_CHANGE} e_state;
e_state state;
e_state prev_state;
//-------------------------------------------—
logic [31:0] counter = 0;
logic [31:0] max_cnt = `MAX50;
logic [31:0] max_cnt2 = `MAX100;
logic [31:0] max_cnt3 = `MAX150;
logic [31:0] max_cnt4 = `MAX200;
//------------------------------------------—
always @(posedge clk) begin
	if(!reset) begin
		led[0] <= 1;
		led[1] <= 1;
		led[2] <= 1;
		led[3] <= 1;
		counter <= 0;
		state <= RIGHT;
		prev_state <= state;
	end
	else if(state == SPEED_CHANGE) begin
		if(!btn2) begin
			state <= SPEED_CHANGE;
		end
		else begin
			led[0] <= 1;
			led[1] <= 1;
			led[2] <= 1;
			led[3] <= 1;
			counter <= 0;
//------------------------------------------—
			case (max_cnt)
//------------------------------------------—
					`MAX25: 
				begin
					max_cnt <= `MAX75;
					max_cnt2 <= `MAX150;
					max_cnt3 <= `MAX225;
					max_cnt4 <= `MAX300;
				end
//------------------------------------------—
					`MAX50: 
				begin
					max_cnt <= `MAX25;
					max_cnt2 <= `MAX50;
					max_cnt3 <= `MAX75;
					max_cnt4 <= `MAX100;
				end
//------------------------------------------—
					`MAX75: 
				begin
					max_cnt <= `MAX50;
					max_cnt2 <= `MAX100;
					max_cnt3 <= `MAX150;
					max_cnt4 <= `MAX200;
				end
//------------------------------------------—
			endcase
//------------------------------------------—
			state <= prev_state;
		end
	end
	else if(state == RIGHT) begin
		prev_state <= state;
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
		else if(counter == max_cnt2) begin
			led[0] <= 1;
			led[1] <= 1;
			led[2] <= 0;
			led[3] <= 1;
			counter <= counter + 1;
		end
		else if(counter == max_cnt3) begin
			led[0] <= 1;
			led[1] <= 1;
			led[2] <= 1;
			led[3] <= 0;
			counter <= counter + 1;
		end
		else if(counter == max_cnt4) begin
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
				else if(!btn2)	begin
					state <= SPEED_CHANGE;
				end
				else begin
					counter <= counter + 1;
				end
			end
	end
	else 
	if(state == LEFT) begin
		prev_state <= state;
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
		else if(counter == max_cnt2) begin
			led[0] <= 1;
			led[1] <= 0;
			led[2] <= 1;
			led[3] <= 1;
			counter <= counter + 1;
		end
		else if(counter == max_cnt3) begin
			led[0] <= 0;
			led[1] <= 1;
			led[2] <= 1;
			led[3] <= 1;
			counter <= counter + 1;
		end
		else if(counter == max_cnt4) begin
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
				else if(!btn2) begin
					state <= SPEED_CHANGE;
				end
				else begin
					counter <= counter + 1;
				end
			end
	end
end
//-------------------------------------------—
endmodule
