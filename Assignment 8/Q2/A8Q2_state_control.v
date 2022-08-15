`include "A8Q2_state_defs.h"

`define PROP_DELAY #2
`define MAX_PC 11
module state_control(clk, command, done, current_state,instruction_invalid,PC);

   input clk;
   input [5:0] command;
   input [7:0] PC;
   input instruction_invalid;
   output done;
   reg done = 0;

   output [2:0] current_state;	
   reg [2:0] current_state;

	
   initial begin
      current_state = `NEW_INSTRUC;
   end
	
   always @ (posedge clk) begin
      if (current_state == `NEW_INSTRUC) begin
               current_state <= `PROP_DELAY `FIND_FIELD;
	            done <= `PROP_DELAY 0;
      end
      else if (current_state == `FIND_FIELD) begin
               current_state <= `PROP_DELAY `READ_SOURCE_REG;
      end
      else if (current_state == `READ_SOURCE_REG) begin
               current_state <= `PROP_DELAY `EXECUTE;
      end
      else if (current_state == `EXECUTE) begin
               current_state <= `PROP_DELAY `ACCESS_MEMORY;
      end
      else if (current_state==`ACCESS_MEMORY) begin
               current_state<=`PROP_DELAY `WRITE_TARGET_REG;
      end
      else if (current_state == `WRITE_TARGET_REG) begin
         if (PC < `MAX_PC) begin
            current_state <= `PROP_DELAY `NEW_INSTRUC;
            done <= `PROP_DELAY 1;
         end
         else begin 
            current_state <= `PROP_DELAY `OUTPUT_READY;
         end
      end
      else if (current_state == `OUTPUT_READY) begin
         done <= `PROP_DELAY 1;
      end
      
   end

endmodule
