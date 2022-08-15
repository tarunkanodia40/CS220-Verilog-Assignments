module M(input clk, output out );
	reg out = 0;
	reg[31:0] counter=32'b1;
	always @(posedge clk) begin 
		counter <= counter + 32'b1;
		 if (counter == 25000 ) begin
		 	out <= ~out;
		 	counter <= 1;
		 end
	end
	

endmodule