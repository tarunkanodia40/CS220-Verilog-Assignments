`include "./A2Q1_decoder3to8.v"
`include "./A2Q1_encoder8to3.v"

module top;
	reg[2:0] in;
	wire[7:0] intermediate_out;
	wire[2:0] out;
	decoder_3_to_8 Dec(in,intermediate_out);
	encoder_8_to_3 Enc(intermediate_out,out);

	always @(*) begin 
		$display("Time : %d | Decoder input = %b | Encoder output = %b",$time,in,out);
	end

	initial begin 
		#30
		$finish;
	end

	initial begin 
		in = 3'd0;
		#1
		$display("\n");
		in = 3'd1;
		#1
		$display("\n");
		in = 3'd2;
		#1
		$display("\n");
		in = 3'd3;
		#1
		$display("\n");
		in = 3'd4;
		#1
		$display("\n");
		in = 3'd5;
		#1
		$display("\n");
		in = 3'd6;
		#1
		$display("\n");
		in = 3'd7;
		#1
		$display("\n");

	end



endmodule