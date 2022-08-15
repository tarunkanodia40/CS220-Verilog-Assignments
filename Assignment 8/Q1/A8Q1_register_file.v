`include "A8Q1_state_defs.h"
`define OUTPUT_REG 2

module register_file(clk, current_state, instruction_invalid, read1Addr, read2Addr, writeAddr, writeValue, read1Valid, read2Valid, read1Value, read2Value,display_availiable,value,memory_enable,memory_read);

   input clk;
   input [2:0] current_state;
   input [4:0] read1Addr;
   input [4:0] read2Addr;
   input [4:0] writeAddr;
   input [7:0] writeValue;
   input read1Valid;
   input instruction_invalid;
   input read2Valid;
	input [7:0]memory_read;
   input memory_enable;

   output reg display_availiable;
   output reg[15:0] value;
   output [7:0] read1Value;
   output [7:0] read2Value;
	
   reg [7:0] read1Value;
   reg [7:0] read2Value;
	
   reg signed [7:0] regfile [0:31];
	
   initial begin
      regfile[0] = 0;
      regfile[1] = 0;
      regfile[2] = 0;
      regfile[3] = 0;
      regfile[4] = 0;
      regfile[5] = 0;
      regfile[6] = 0;
      regfile[7] = 0;
      regfile[8] = 0;
      regfile[9] = 0;
      regfile[10] = 0;
      regfile[11] = 0;
      regfile[12] = 0;
      regfile[13] = 0;
      regfile[14] = 0;
      regfile[15] = 0;
      regfile[16] = 0;
      regfile[17] = 0;
      regfile[18] = 0;
      regfile[19] = 0;
      regfile[20] = 0;
      regfile[21] = 0;
      regfile[22] = 0;
      regfile[23] = 0;
      regfile[24] = 0;
      regfile[25] = 0;
      regfile[26] = 0;
      regfile[27] = 0;
      regfile[28] = 0;
      regfile[29] = 0;
      regfile[30] = 0;
      regfile[31] = 0;
   end
	
   always @ (posedge clk) begin
      if (current_state == `READ_SOURCE_REG) begin
         if (read2Valid == 1) begin
      	    read1Value <= regfile[read1Addr];
             read2Value <= regfile[read2Addr];
         end
      	else if (read1Valid == 1) begin
      	  read1Value <= regfile[read1Addr];
      	end
	   end
      else if (current_state == `WRITE_TARGET_REG && instruction_invalid == 0) begin
         
         if (memory_enable==0) begin
            regfile[writeAddr] <= writeValue;
         end
         else begin
            regfile[writeAddr] <= memory_read;
         end
      end

      else if (current_state == `OUTPUT_READY) begin 
         value <= regfile[`OUTPUT_REG];
         display_availiable <= 1;
      end
      
   end

endmodule
