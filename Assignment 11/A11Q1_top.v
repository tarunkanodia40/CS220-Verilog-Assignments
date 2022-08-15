`include "A11Q1_multiplication.v"
`define PROP_DELAY #2
module  top;

	reg clk;
	reg signed [31:0] multiplicand;
	reg signed [31:0] multiplier;
	wire signed [64:0] product;
	reg [3:0]counter;
	wire output_ready;
   wire [5:0]Additions ;
   wire [5:0]Subtractions ;
	reg input_ready;
	

	reg[31:0] input_multiplicand[0:9];
	reg[31:0] input_multiplier[0:9];
	M Multiplier(clk,multiplicand,multiplier,input_ready,product,output_ready,Additions,Subtractions);
	always @(negedge clk) begin
		if (output_ready == 1) begin
			if ($time != 5 & $time != 15) begin
				$display("Time = %d,Multiplicand = %d, Multiplier = %d, Product = %d, Additions = %d, Subtractions = %d",$time,multiplicand,multiplier,product,Additions,Subtractions);
			end
			input_ready <=  1;
			multiplicand <=  input_multiplicand[counter];
			multiplier <=  input_multiplier[counter];
			counter <=  counter+1;
			if (counter == 10) begin
				$finish;
			end
		end
		else begin 
			input_ready <=  0;
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
   	input_multiplicand[0] <=  50;
   	input_multiplicand[1] <=  25;
   	input_multiplicand[2] <=  25;
   	input_multiplicand[3] <=  75;
   	input_multiplicand[4] <=  25;
   	input_multiplicand[5] <=  20;
   	input_multiplicand[6] <=  25;
   	input_multiplicand[7] <=  23;
   	input_multiplicand[8] <=  245;
   	input_multiplicand[9] <=  25;

   	input_multiplier[0] <=  -2;
   	input_multiplier[1] <=  -1;
   	input_multiplier[2] <=  -3;
   	input_multiplier[3] <=  4;
   	input_multiplier[4] <=  5;
   	input_multiplier[5] <=  6;
   	input_multiplier[6] <=  7;
   	input_multiplier[7] <=  8;
   	input_multiplier[8] <=  9;
   	input_multiplier[9] <=  0;

   	counter <=  0;

   end



endmodule