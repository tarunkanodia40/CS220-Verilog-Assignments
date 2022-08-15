`include "./A2Q2_priority_encoder8to3.v"
module top;
	reg[7:0] in;
	wire[2:0] out;

	priority_encoder_8_to_3 ENC(in,out);

	always @(*) begin 
		$display("Time : %d | Encoder input : %b | Encoder Output : %b",$time,in,out);
	end

	initial begin 
		in = 8'd1;
		#1
		$display("\n");
		in = 8'd5;
		#1
		$display("\n");
		in = 8'd10;
		#1
		$display("\n");
		in = 8'd12;
		#1
		$display("\n");
		in = 8'd20;
		#1
		$display("\n");
		in = 8'd88;
		#1
		$display("\n");
		in = 8'd128;
		#1
		$display("\n");
		in = 8'd144;
		#1
		$display("\n");
		in = 8'd145;
		#1
		$display("\n");
		in = 8'd200;
		#1
		$finish;
	end


endmodule