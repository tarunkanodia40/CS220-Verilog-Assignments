`include "A8Q1_state_defs.h"
module memory(  readAddr,  readValue);

   
   input [7:0] readAddr;
   
   output [7:0] readValue;
   	
   wire  signed  [7:0] readValue;
	
   reg signed [7:0] memoryfile [10:0];
	
   initial begin
      memoryfile[0] = 0; // Array elements from 0 to 9
      memoryfile[1] = 1;
      memoryfile[2] = 2;
      memoryfile[3] = 3;
      memoryfile[4] = -128;
      memoryfile[5] = 50;
      memoryfile[6] = 6;
      memoryfile[7] = 7;
      memoryfile[8] = 8;
      memoryfile[9] = -9;
      memoryfile[10] = 8; // Value of n
   end

   assign readValue=memoryfile[readAddr];

endmodule
