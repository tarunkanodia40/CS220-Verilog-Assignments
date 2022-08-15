`include "A1Q2_eight_bit_comparator.v"
// L=1 if A<B, E=1 if A=B, G=1 if A>B
module eight_bit_comparator_top;
	reg[7:0] A,B;
	wire l,e,g;
	eight_bit_comparator Compare(A,B,l,e,g);
	always @(*) begin 
		$display("time = %d | A=%d, B=%d| L=%d, E=%d, G=%d ",$time,A,B,l,e,g);
	end

	initial begin 
		A=10;B=20;
		#1
		$display("\n");
		A=10;B=10;
		#1
		$display("\n");
		A=1;B=0;
		#1
		$display("\n");
		A=7;B=5;
		#1
		$display("\n");
		A=8'b00111100;B=8'b00001110;
		#1
		$display("\n");
		A=243;B=123;
		#1
		$display("\n");
		A=45;B=45;
		#1
		$display("\n");
		A=0;B=0;
		#1
		$display("\n");
		A=1;B=1;
		#1
		$display("\n");
		A=3;B=1;
		#1
		$display("\n");
		$finish;
	end
endmodule