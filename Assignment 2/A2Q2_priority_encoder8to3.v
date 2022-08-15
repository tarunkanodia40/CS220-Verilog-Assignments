module priority_encoder_8_to_3(input[7:0] in, output[2:0] out);
	reg[2:0] out;
	always @(*) begin 
	if (in[0] == 1'b1) begin
		out[2] = 1'b0;
		out[1] = 1'b0;
		out[0] = 1'b0;
	end
	else if (in[1] == 1'b1) begin
		out[2] = 1'b0;
		out[1] = 1'b0;
		out[0] = 1'b1;
	end
	else if (in[2] == 1'b1) begin
		out[2] = 1'b0;
		out[1] = 1'b1;
		out[0] = 1'b0;
	end
	else if (in[3] == 1'b1) begin
		out[2] = 1'b0;
		out[1] = 1'b1;
		out[0] = 1'b1;
	end
	else if (in[4] == 1'b1) begin
		out[2] = 1'b1;
		out[1] = 1'b0;
		out[0] = 1'b0;
	end
	else if (in[5] == 1'b1) begin
		out[2] = 1'b1;
		out[1] = 1'b0;
		out[0] = 1'b1;
	end
	else if (in[6] == 1'b1) begin
		out[2] = 1'b1;
		out[1] = 1'b1;
		out[0] = 1'b0;
	end
	else if (in[7] == 1'b1) begin
		out[2] = 1'b1;
		out[1] = 1'b1;
		out[0] = 1'b1;
	end
	
	end

endmodule