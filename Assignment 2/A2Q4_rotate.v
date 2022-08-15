module M(input clk,output[3:0] out);
	reg[3:0] out=4'b1000;
	reg[63:0] counter=64'b1;
	always @(posedge clk) begin 
		counter <= counter + 64'b1;
		if(counter == 25000) begin 
		 	out[1] <= out[0];
		 	out[2] <= out[1];
		 	out[3] <= out[2];
		 	out[0] <= out[3];
		 	counter <= 1;
		end
	end
	

endmodule