`include "A11Q2_divider.v"
`define PROP_DELAY #2
module  top;

	reg clk;
	reg[31:0] dividend;
	reg[31:0] divisor;
	reg[4:0] dividend_length;
	reg[4:0] divisor_length;
	wire[31:0] quotient;
	wire[31:0] remainder;
	reg new_input;
	wire done;
	wire[5:0] add;
	wire[5:0] sub;

	reg[31:0] input_dividend[0:9];
	reg[31:0] input_divisor[0:9];
	reg[4:0] input_dividend_length[0:9];
	reg[4:0] input_divisor_length[0:9];
	reg[10:0] counter;
	divider D(clk,dividend,divisor,dividend_length,divisor_length,quotient,remainder,add,sub,done,new_input);
	always @(negedge clk) begin
		if (done == 1) begin
			if ($time != 5) begin
				$display("Time = %d,Dividend = %d, Divisor = %d, Quotient = %d,Remainder = %d, Additions = %d, Subtractions = %d",$time,dividend,divisor,quotient,remainder,add,sub);
			end
			new_input =  1;
			dividend <=  input_dividend[counter];
			divisor <=  input_divisor[counter];
			dividend_length <=  input_dividend_length[counter];
			divisor_length <=  input_divisor_length[counter];
			counter <=  counter+1;
			if (counter == 10) begin
				$finish;
			end
		end
		else begin 
			new_input <=  0;
		end 	
	end

	initial begin
      forever begin
         clk = 1;
         #5
         clk = 0;
         #5
         clk = 1;
      end
   end

   initial begin 
   	input_dividend[0] <=  15;
   	input_dividend[1] <=  32;
   	input_dividend[2] <=  58;
   	input_dividend[3] <=  1024;
   	input_dividend[4] <=  1350;
   	input_dividend[5] <=  2574;
   	input_dividend[6] <=  1154;
   	input_dividend[7] <=  10256;
   	input_dividend[8] <=  4887;
   	input_dividend[9] <=  10;

   	input_dividend_length[0] <=  4;
   	input_dividend_length[1] <=  6;
   	input_dividend_length[2] <=  6;
   	input_dividend_length[3] <=  11;
   	input_dividend_length[4] <=  11;
   	input_dividend_length[5] <=  12;
   	input_dividend_length[6] <=  11;
   	input_dividend_length[7] <=  14;
   	input_dividend_length[8] <=  13;
   	input_dividend_length[9] <=  44;


   	input_divisor[0] <=  1;
   	input_divisor[1] <=  32;
   	input_divisor[2] <=  45;
   	input_divisor[3] <=  25;
   	input_divisor[4] <=  13;
   	input_divisor[5] <=  2;
   	input_divisor[6] <=  39;
   	input_divisor[7] <=  102;
   	input_divisor[8] <=  48;
   	input_divisor[9] <=  94;

   	input_divisor_length[0] <=  1;
   	input_divisor_length[1] <=  6;
   	input_divisor_length[2] <=  6;
   	input_divisor_length[3] <=  5;
   	input_divisor_length[4] <=  4;
   	input_divisor_length[5] <=  2;
   	input_divisor_length[6] <=  6;
   	input_divisor_length[7] <=  7;
   	input_divisor_length[8] <=  6;
   	input_divisor_length[9] <=  7;

   	counter <=  0;

   end



endmodule