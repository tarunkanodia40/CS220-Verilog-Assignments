`include "A8Q1_state_defs.h"
`define PROP_DELAY #2

module decoder(clk, instruction,current_state,read1Addr, read2Addr, writeAddr, read1Valid, read2Valid, shift_amount, command,funct,immediate_operand,address);
   input clk;
   input[0:31] instruction;
   input[2:0] current_state;

   output reg [4:0] read1Addr;
   output reg [4:0] read2Addr;
   output reg [4:0] writeAddr;
   output reg [5:0] funct;
   output reg read1Valid;
   output reg read2Valid;
   output reg signed [15:0] immediate_operand;
   output reg [4:0] shift_amount;
   output reg [5:0] command;
	output reg [7:0]address ;

   always @(posedge clk) begin 
   		if (current_state==`FIND_FIELD) begin
   			case (instruction[0:5])
   				0: begin 
   					command <= `PROP_DELAY 0;
   					read1Valid <= `PROP_DELAY 1;
   					read2Valid <= `PROP_DELAY 1;
   					read1Addr <= `PROP_DELAY instruction[6:10];
   					read2Addr <= `PROP_DELAY instruction[11:15];
   					writeAddr <= `PROP_DELAY instruction[16:20];
   					shift_amount <= `PROP_DELAY instruction[21:25];
   					funct <= `PROP_DELAY instruction[26:31];
   				end

				3: begin
					command<=`PROP_DELAY 3;
					read2Valid <= `PROP_DELAY 0;
					read1Valid <= `PROP_DELAY 0;
					address<=`PROP_DELAY instruction[24:31];
					writeAddr<=31;
				end
				4,5: begin 
   					command <= `PROP_DELAY instruction[0:5];
   					read2Valid <= `PROP_DELAY 1;
					read1Valid <= `PROP_DELAY 1;
   					read1Addr <= `PROP_DELAY instruction[6:10];
   					read2Addr <= `PROP_DELAY instruction[11:15];
   					immediate_operand <= `PROP_DELAY instruction[16:31];
   				end
   				default: begin 
   					command <= `PROP_DELAY instruction[0:5];
   					read2Valid <= `PROP_DELAY 0;
					read1Valid <= `PROP_DELAY 1;
   					read1Addr <= `PROP_DELAY instruction[6:10];
   					writeAddr <= `PROP_DELAY instruction[11:15];
   					immediate_operand <= `PROP_DELAY instruction[16:31];
   				end

   			endcase
   		end

   end


endmodule