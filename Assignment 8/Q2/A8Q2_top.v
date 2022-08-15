`define PROP_DELAY #2
`define OUTPUT_REG 4
`include "A8Q2_processor.v"
module top;

   reg clk;
   reg[0:31] instruction_memory [0:10];
   reg[0:31] instruction;
   wire [15:0] read1Value;
   wire [15:0] read2Value;
   wire [15:0] regWriteValue;
   wire done;
   wire display_availiable;
   wire signed[15:0] value;
   wire [7:0]PC;
   

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
      instruction_memory[0] =32'h8c010000;
      instruction_memory[1] =32'h8c020001;
      instruction_memory[2] =32'h8c030002;
      instruction_memory[3] =32'h24040000;
      instruction_memory[4] =32'h24250000;
      instruction_memory[5] =32'h00a2302a;
      instruction_memory[6] =32'h10c00005;
      instruction_memory[7] =32'h00852021;
      instruction_memory[8] =32'h00a32821;
      instruction_memory[9] =32'h00a2302a;
      instruction_memory[10] =32'h14c0fffd;
   end

   initial begin
      instruction <= `PROP_DELAY instruction_memory[0];
       
   end

   always @ (posedge done) begin

      instruction <= `PROP_DELAY instruction_memory[PC];

      if(display_availiable == 1) begin 
         $display("Content at $%d : %d",`OUTPUT_REG,value);
         $finish;
      end

   end
   
endmodule
