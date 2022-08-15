`define PROP_DELAY #2
module instruction_memory(clk, instruction, count_I, count_J, count_R,count_3,count_4,count_5,count_6);
	input clk;
	input[0:31] instruction;
	output reg[3:0] count_I;
	output reg[3:0] count_J;
	output reg[3:0] count_R;
	output reg[3:0] count_3;
	output reg[3:0] count_4;
	output reg[3:0] count_5;
	output reg[3:0] count_6;

	

	initial begin 
		count_I <= `PROP_DELAY 0;
		count_J <= `PROP_DELAY 0;
		count_R <= `PROP_DELAY 0;
		count_3 <= `PROP_DELAY 0;
		count_4 <= `PROP_DELAY 0;
		count_5 <= `PROP_DELAY 0;
		count_6 <= `PROP_DELAY 0;
	end

	always @(posedge clk) begin
		case (instruction[0:5])
			6'b000000: begin 
				count_R <= `PROP_DELAY count_R + 1;
				case (instruction[16:20])
					3: count_3 <= `PROP_DELAY count_3+1;
					4: count_4 <= `PROP_DELAY count_4+1;
					5: count_5 <= `PROP_DELAY count_5+1;
					6: count_6 <= `PROP_DELAY count_6+1;
				endcase
		
			end
			6'b000010: begin 
				count_J <= `PROP_DELAY count_J + 1;
		
			end
			6'b000011: begin 
				count_J <= `PROP_DELAY count_J + 1;
		
			end

			default: begin 
				count_I <= `PROP_DELAY count_I + 1;

				case (instruction[11:15])
					3: count_3 <= `PROP_DELAY count_3+1;
					4: count_4 <= `PROP_DELAY count_4+1;
					5: count_5 <= `PROP_DELAY count_5+1;
					6: count_6 <= `PROP_DELAY count_6+1;
				endcase
			end
		
		endcase
		

	end




endmodule