`include "A6Q1_processor.v"

module top;
	reg[33:0] instructions[8:0];
    reg[33:0] current;
	reg[4:0] read1_add;
    reg[4:0] read2_add;
    reg[4:0] write_add;
    reg signed [15:0]write;
    reg [2:0]code;
    wire [4:0]add1;
    wire [4:0]add2;
    wire signed [15:0]value1;
    wire signed [15:0]value2;
    wire done;
    reg [3:0]count;
	parameter clk_period=10;
	parameter number_of_cycles=9;
	parameter finish_time= number_of_cycles*clk_period;
	parameter switch_time = clk_period/2;
	parameter clk_skew = switch_time-2;
    processor unit(read1_add,read2_add,write_add,write,code,add1,add2,value1,value2,done);
	
    //The first 3 bits are for code, then 5 for read1_add, then 5 for read2_add then 5 for write_add finally 16 for write data
    initial begin
		instructions[0]=34'b000xxxxxxxxxx000010000000000010001;
		instructions[1]=34'b01100001xxxxx000101111111111110111;
		instructions[2]=34'b1000000100010000110000000001000001;
		instructions[3]=34'b0100001000011xxxxxxxxxxxxxxxxxxxxx;
		instructions[4]=34'b11100011xxxxx001010000000000000011;
		instructions[5]=34'b101000010001000100xxxxxxxxxxxxxxxx;
		instructions[6]=34'b11100100xxxxx001000000000000001001;
		instructions[7]=34'b110001010010000110xxxxxxxxxxxxxxxx;
		instructions[8]=34'b00100110xxxxxxxxxxxxxxxxxxxxxxxxxx;
		
		count=0;
		
	end
	
    always @(posedge done) begin
        //First we load the current instruction and parse it 
        current=instructions[count];
        code<=current[33:31];
        read1_add<=current[30:26];
        read2_add<=current[25:21];
        write_add<=current[20:16];
        write<=current[15:0];
        case (code)
            3'b000: $display("Time = %d |  Instruction = %b",$time,code);                               // Can be removed so as to not display anything.
            3'b001: $display("Time = %d |  Instruction = %b | Address read from = %d | Value read = %d ",$time,code,add1,value1);    
            3'b010: $display("Time = %d |  Instruction = %b | Address 1 = %d| Address 2 = %d | Value 1 = %d| Value 2 = %d ",$time,code,add1,add2,value1,value2);
            3'b011: $display("Time = %d |  Instruction = %b | Address read from=%d    Value read=%d ",$time,code,add1,value1);
            3'b100: $display("Time = %d |  Instruction = %b | Address 1 = %d | Address 2 = %d | Value 1 = %d| Value 2 = %d ",$time,code,add1,add2,value1,value2);
            3'b101: $display("Time = %d |  Instruction = %b | Address written to = %d | Value written = %d",$time,code,add1,value1);
            3'b110: $display("Time = %d |  Instruction = %b | Address written to = %d | Value written = %d",$time,code,add1,value1);
            3'b111: $display("Time = %d |  Instruction = %b | Address written to = %d | Value written = %d",$time,code,add1,value1);
        endcase
         count<=count+1; 
         if (count==9) begin         // For number of instructions.
             $finish;
         end       
    end
    

    
	
endmodule
