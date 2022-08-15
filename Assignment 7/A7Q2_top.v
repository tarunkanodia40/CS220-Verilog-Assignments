`define PROP_DELAY #2
`define OUTPUT_REG 5
`include "A7Q2_processor.v"
module top;

   reg clk;
   reg[0:31] instruction_memory [0:7];
   reg[0:31] instruction;
   wire [15:0] read1Value;
   wire [15:0] read2Value;
   wire [15:0] regWriteValue;
   wire done;
   wire display_availiable;
   wire[15:0] value;

   reg [3:0] PC;

   processor PROCESSOR (clk, instruction,PC,done,display_availiable,value);

   initial begin
      forever begin
         clk = 0;
         #5
         clk = 1;
         #5
         clk = 0;
      end
   end
   
   initial begin 
      instruction_memory[0] =32'h2401002d;
      instruction_memory[1] =32'h2402ffec;
      instruction_memory[2] =32'h2403ffc4;
      instruction_memory[3] =32'h2404001e;
      instruction_memory[4] =32'h00222821;
      instruction_memory[5] =32'h00643021;
      instruction_memory[6] =32'h00a62823;
   end

   initial begin
      instruction <= `PROP_DELAY instruction_memory[0];
      PC <= `PROP_DELAY 1;  
   end

   always @ (posedge done) begin

      instruction <= `PROP_DELAY instruction_memory[PC];
      PC <= `PROP_DELAY PC + 1;

      if(display_availiable == 1) begin 
         $display("Content at $%d : %d",`OUTPUT_REG,value);
         $finish;
      end

   end
   
endmodule
