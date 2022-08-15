`include "A7Q1_memory.v"
`define PROP_DELAY #2


module top;

   reg clk;
   wire[3:0] count_I;
   wire[3:0] count_J;
   wire[3:0] count_R;
   wire[3:0] count_3;
   wire[3:0] count_4;
   wire[3:0] count_5;
   wire[3:0] count_6;
   reg[3:0] PC;
   reg[0:31] memory[0:7];

   instruction_memory M(clk,memory[PC],count_I, count_J, count_R,count_3,count_4,count_5,count_6);

   always @(posedge clk) begin
      PC <= `PROP_DELAY PC+1;
   end

   
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
      memory[0] <= `PROP_DELAY 32'h20043456; 
      memory[1] <= `PROP_DELAY 32'h2005ffff; 
      memory[2] <= `PROP_DELAY 32'h00a43020; 
      memory[3] <= `PROP_DELAY 32'h20030007; 
      memory[4] <= `PROP_DELAY 32'h00663004;
      memory[5] <= `PROP_DELAY 32'h00031842;
      memory[6] <= `PROP_DELAY 32'h8c859abc;
      memory[7] <= `PROP_DELAY 32'h08123456;

      PC <= `PROP_DELAY 0;
   end


   initial begin 
      #80
      $display("Number of I-format instructions:%d\nNumber of J-format instructions: %d\nNumber of R-format instructions: %d",count_I,count_J,count_R);
      $display("Number of instructions that write to $3: %d",count_3);
      $display("Number of instructions that write to $4: %d",count_4);
      $display("Number of instructions that write to $5: %d",count_5);
      $display("Number of instructions that write to $6: %d",count_6);
      $finish;
   end

   


endmodule
