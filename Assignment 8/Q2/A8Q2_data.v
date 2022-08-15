`include "A8Q2_state_defs.h"
module memory(  readAddr,  readValue);

   
   input [7:0] readAddr;
   
   output [7:0] readValue;
   	
   wire  signed  [7:0] readValue;
	
   reg signed [7:0] memoryfile [2:0];
	
   initial begin
      memoryfile[0] = -20; //A
      memoryfile[1] = 10; //B
      memoryfile[2] = 2; //C
   end
   assign readValue=memoryfile[readAddr];

endmodule
