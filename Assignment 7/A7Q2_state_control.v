`include "A7Q2_state_defs.h"

`define PROP_DELAY #2
`define MAX_PC 7
module state_control(clk, command, done, current_state,instruction_invalid,PC);

   input clk;
   input [5:0] command;
   input [3:0] PC;
   input instruction_invalid;
   output done;
   reg done = 0;

   output [2:0] current_state;	
   reg [2:0] current_state;

	
   initial begin
      current_state = `STATE_INPUT;
   end
	
   always @ (posedge clk) begin
      if (current_state == `STATE_INPUT) begin
               current_state <= `PROP_DELAY `STATE_DECODE;
	            done <= `PROP_DELAY 0;
      end
      else if (current_state == `STATE_DECODE) begin
               current_state <= `PROP_DELAY `STATE_RF;
      end
      else if (current_state == `STATE_RF) begin
               current_state <= `PROP_DELAY `STATE_EXECUTE;
      end
      else if (current_state == `STATE_EXECUTE) begin
               current_state <= `PROP_DELAY `STATE_RW;
      end
      else if (current_state == `STATE_RW) begin
         if (PC < `MAX_PC) begin
            current_state <= `PROP_DELAY `STATE_INPUT;
            done <= `PROP_DELAY 1;
         end
         else begin 
            current_state <= `PROP_DELAY `STATE_DISPLAY;
         end
      end
      else if (current_state == `STATE_DISPLAY) begin
         done <= `PROP_DELAY 1;
      end
      
   end

endmodule
