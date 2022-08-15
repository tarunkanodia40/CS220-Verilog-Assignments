`include "A7Q2_state_defs.h"
`include "A7Q2_register_file.v"
`include "A7Q2_state_control.v"
`include "A7Q2_decoder.v"
`include "A7Q2_execute.v"
module processor(clk, instruction,PC,done,display_availiable,value);

   input clk;
   input [0:31] instruction;
   input [3:0] PC;

   output done;
   output wire display_availiable;
   output wire[15:0] value;
   wire[5:0] command;
   wire signed [7:0] read1Value;
   wire signed [7:0] read2Value;
   wire signed [7:0] regWriteValue;
   wire [4:0] read1Addr;
   wire [4:0] read2Addr;
   wire [4:0] writeAddr;
   wire read1Valid;
   wire read2Valid;
   wire[4:0] shift_amount;
   wire [5:0] funct;
   wire signed [15:0]  immediate_operand;

   wire done;

   wire signed [7:0] result;
   wire instruction_invalid;
   wire [2:0] current_state;


   
	
   decoder decode(clk, instruction,current_state,read1Addr, read2Addr, writeAddr, read1Valid, read2Valid, shift_amount, command,funct,immediate_operand);
   register_file RF(clk, current_state,instruction_invalid, read1Addr, read2Addr, writeAddr, regWriteValue, read1Valid, read2Valid, read1Value, read2Value,display_availiable,value);
   compute EXECUTE(clk, current_state, command,funct,writeAddr, read1Value, read2Value, shift_amount, immediate_operand, instruction_invalid,result);
   state_control CONTROL(clk, command, done, current_state,instruction_invalid,PC);

   assign regWriteValue = result;

endmodule
