`include "A8Q1_state_defs.h"
`define  PROP_DELAY #2
module compute(PC,clk, current_state, command,funct,writeAddr, operand1, operand2, shift_amount,immediate_operand, instruction_invalid, result,address,memory_enable,memory_add);
	 
   input clk;
   input [2:0] current_state;
   input [5:0] command;
   input signed [7:0] operand1;
   input signed [7:0] operand2;
   input[4:0] writeAddr;
   input signed [15:0] immediate_operand;
   input [4:0] shift_amount;
   input [5:0] funct; 
	input [7:0] address;
   output [7:0] result;
   reg [7:0] result;
   output reg instruction_invalid;
	output reg [7:0] PC;
   output reg memory_enable;
   output reg [7:0]memory_add;
   initial begin 
      instruction_invalid =0;
      PC=12;
      memory_enable=0;
   end
   always @ (posedge clk) begin
      if (current_state == `EXECUTE) begin
        case (command)
   			0: begin 
   					case (funct)
                     42: begin
                        instruction_invalid <=`PROP_DELAY 0;
                        if (operand1<operand2) begin
                           result<=`PROP_DELAY 1;
                        end
                        else  begin
                           result<=`PROP_DELAY 0;
                        end
                        PC<=`PROP_DELAY PC+1;
                     end
                     33: begin
                        instruction_invalid <=`PROP_DELAY 0;
                        result<=`PROP_DELAY operand1+operand2;
                        PC<=`PROP_DELAY PC+1;
                     end
                     8: begin
                        instruction_invalid <=`PROP_DELAY 0;
                        PC<=`PROP_DELAY operand1;
                     end
                     default: begin
                        instruction_invalid<=`PROP_DELAY 1;
                        PC<=`PROP_DELAY PC+1;
                     end
                  endcase
                  memory_enable<=`PROP_DELAY 0;
   				end

				3: begin
               instruction_invalid <=`PROP_DELAY 0;
					result<=`PROP_DELAY PC+1;
               PC<=`PROP_DELAY address;
               memory_enable<=`PROP_DELAY 0;
				end
            9: begin
               instruction_invalid <=`PROP_DELAY 0;
					result<=`PROP_DELAY operand1+immediate_operand;
               PC<=`PROP_DELAY PC+1;
               memory_enable<=`PROP_DELAY 0;
				end
				4: begin 
                  instruction_invalid <=`PROP_DELAY 0;
                  memory_enable<=`PROP_DELAY 0;
   					if (operand1==operand2) begin
                     PC<=`PROP_DELAY PC+immediate_operand;
                  end
                  else begin
                     PC<=`PROP_DELAY PC+1;
                  end
   				end
            5: begin 
                  instruction_invalid<=`PROP_DELAY 0;
                  memory_enable<=`PROP_DELAY 0;
   					if (operand1==operand2) begin
                     PC<=`PROP_DELAY PC+1;
                  end
                  else begin
                     PC<=`PROP_DELAY PC+immediate_operand;
                  end
   				end
            35:begin
                  instruction_invalid <=`PROP_DELAY 0;
                  memory_enable<=`PROP_DELAY 1;
                  result<=`PROP_DELAY 2;
                  memory_add<=`PROP_DELAY operand1+immediate_operand;
                  PC<=`PROP_DELAY PC+1;
            end
   			default: begin 
   					instruction_invalid <=`PROP_DELAY 1;
                  PC<=`PROP_DELAY PC+1;
                  memory_enable<=`PROP_DELAY 0;
   				end

   			endcase
         
	 end 
	
   end

endmodule
