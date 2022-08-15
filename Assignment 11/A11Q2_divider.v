module divider(clk,dividend,divisor,dividend_length,divisor_length,quotient,remainder,add,sub,done,new_input);
	input clk;
	input[31:0] dividend;
	input[31:0] divisor;
	input new_input;
	input[4:0] dividend_length;
	input[4:0] divisor_length;

	output reg[31:0] quotient;
	output reg signed[31:0] remainder;
	output reg done;
	output reg[5:0] add;
	output reg[5:0] sub;
	reg[31:0] div;
	reg[5:0] iteration;
	
	initial begin 
		done <=  1;
	end
	always @(posedge clk) begin
		if (dividend_length < divisor_length) begin   // The algo works only when dividend length greater than or equal to divisor length, hence
													// A special case is handled, by assigning 0 to number of additions and subtractions
			add <= 0;
			sub <= 0;
			iteration <= 0;
			quotient <= 0;
			remainder <= dividend;
			done <= 1;
		end
		else if (new_input == 1) begin
			add <=   0;
			sub <=   0;
			iteration <=   0;
			quotient<=  0;
			remainder <=  dividend;
			done <=  0;
		end
		else if (iteration == dividend_length - divisor_length + 2) begin
			if (remainder < 0) begin
				remainder <=   remainder + divisor;
				add <=   add+1;
				quotient <=   quotient^1;
			end
				iteration <= iteration + 1;
		end

		else if (iteration == dividend_length - divisor_length + 3) begin
			done <=  1;
			iteration <=  0;

		end

		else if (iteration == 0) begin
			div <=   divisor<<(dividend_length - divisor_length);
			iteration <=   iteration+1;
			done <=   0;
		end
		else begin 
			if (remainder <  0) begin
				remainder <=   remainder + div;
				add <=   add+1;
				quotient <=   quotient^1;
				#1;
			end
			else begin 
				remainder <=   remainder - div;
				sub <=   sub + 1;
			end
		iteration <=   iteration + 1;
		quotient <=   (quotient<<1)|1;
		div <=   (div >> 1);
		end

	end



endmodule
