`include "A8Q2_state_defs.h"
`include "A8Q2_register_file.v"
`include "A8Q2_state_control.v"
`include "A8Q2_decoder.v"
`include "A8Q2_execute.v"
`include "A8Q2_data.v"
`define PROP_DELAY #2
`define MAX_PC 11
module processor(clk, instruction,PC,done,display_availiable,value);

   input clk;
   input [0:31] instruction;
   output wire [7:0] PC;

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
   output wire done;
   reg donef;
   wire [7:0]address ;
   wire signed [7:0] result;
   wire instruction_invalid;
   wire [2:0] current_state;
   wire memory_enable;
   wire [7:0]memory_add;
   wire  signed  [7:0] memory_read;
   
   
   
   
	
   decoder decode(clk, instruction,current_state,read1Addr, read2Addr, writeAddr, read1Valid, read2Valid, shift_amount, command,funct,immediate_operand,address);
   register_file RF(clk, current_state,instruction_invalid, read1Addr, read2Addr, writeAddr, regWriteValue, read1Valid, read2Valid, read1Value, read2Value,display_availiable,value,memory_enable,memory_read);
   compute EXECUTE(PC,clk, current_state, command,funct,writeAddr, read1Value, read2Value, shift_amount, immediate_operand, instruction_invalid,result,address,memory_enable,memory_add);
   state_control CONTROL(clk, command, done, current_state,instruction_invalid,PC);
   memory data(memory_add,memory_read);
   assign regWriteValue = result;

endmodule
