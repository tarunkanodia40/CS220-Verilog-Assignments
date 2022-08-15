`define PROP_DELAY #2
`define OUTPUT_REG 5
`include "A8Q1_processor.v"
module top;

   reg clk;
   reg[0:31] instruction_memory [0:13];
   reg[0:31] instruction;
   wire [15:0] read1Value;
   wire [15:0] read2Value;
   wire [15:0] regWriteValue;
   wire done;
   wire display_availiable;
   wire signed [15:0] value;
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
      instruction_memory[0] =32'h24020000;
      instruction_memory[1] =32'h24030000;
      instruction_memory[2] =32'h0061202a;
      instruction_memory[3] =32'h10800008;
      instruction_memory[4] =32'h2405000a;
      instruction_memory[5] =32'h10650006;
      instruction_memory[6] =32'h8c660000;
      instruction_memory[7] =32'h00461021;
      instruction_memory[8] =32'h24630001;
      instruction_memory[9] =32'h0061202a;
      instruction_memory[10] =32'h1480fffb;
      instruction_memory[11] =32'h03e00008;
      instruction_memory[12] =32'h8c01000a;
      instruction_memory[13] =32'h0c000000;
   end

   initial begin
      instruction <= `PROP_DELAY instruction_memory[12];
       
   end

   always @ (posedge done) begin

      instruction <= `PROP_DELAY instruction_memory[PC];

      if(display_availiable == 1) begin 
         $display("Content at $%d : %d",`OUTPUT_REG,value);
         $finish;
      end

   end
   
endmodule
