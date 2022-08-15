`include "A7Q2_state_defs.h"
`define  PROP_DELAY #2
module compute(clk, current_state, command,funct,writeAddr, operand1, operand2, shift_amount,immediate_operand, instruction_invalid, result);
	 
   input clk;
   input [2:0] current_state;
   input [5:0] command;
   input signed [7:0] operand1;
   input signed [7:0] operand2;
   input[4:0] writeAddr;
   input signed [15:0] immediate_operand;
   input [4:0] shift_amount;
   input [5:0] funct; 
	
   output [7:0] result;
   reg [7:0] result;
   output reg instruction_invalid;
	
   initial begin 
      instruction_invalid =0;
   end
   always @ (posedge clk) begin
      if (current_state == `STATE_EXECUTE) begin
        if (writeAddr ==0) begin
         instruction_invalid <= `PROP_DELAY 1;
        end
        if (command == 6'b000000) begin
            if (funct== 6'b100001) begin
      	    result <= `PROP_DELAY  operand1 + operand2;
            end
            else if(funct == 6'b100011) begin 
               result <= `PROP_DELAY  operand1 - operand2;
            end
            instruction_invalid <= `PROP_DELAY  0;
         end
         else if(command==6'b001001) begin 
            result <= `PROP_DELAY  operand1 + immediate_operand[7:0];
            instruction_invalid <= `PROP_DELAY  0;
         end
         else begin 
            instruction_invalid <=  `PROP_DELAY 1;
         end
	 end 
	
   end

endmodule
