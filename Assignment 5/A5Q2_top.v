`include "A5Q2_minimum.v"

module top;

	reg[2:0] a,b,c,d;
	output wire[1:0] idx;
	minimum_index M(a,b,c,d,idx);

	always @(*) begin 

		$display("Inputs: %d %d %d %d | Minimum index: ",a,b,c,d,idx);
	
	end

	initial begin        
		a=7;b=3;c=2;d=1;  
		#1
		$display("\n");
		a=4;b=1;c=0;d=3;  
		#1
		$display("\n");
		a=3'b101;b=3'b011;c=7;d=3'b001; 		
		#1
		$display("\n");
		a=0; b=0;c=0;d=0;		
		#1
		$display("\n");
		a=6; b=7;c=5;d=7;   
		#1
		$display("\n");
		a=4; b=2;c=3;d=5; 
		#1
		$display("\n");
		a=3; b=2;c=4;d=6; 
		#1
		$display("\n");
		a=7; b=6;c=3;d=5; 		
		#1
		$display("\n");
		a=5; b=1;c=7;d=4;		
		#1
		$display("\n");
		a=2; b=3;c=6;d=1;		
		#1
		$display("\n");
		$finish;
	end

endmodule