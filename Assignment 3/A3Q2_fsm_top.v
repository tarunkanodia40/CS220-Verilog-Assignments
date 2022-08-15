`include "A3Q2_fsm.v"
module top;
	reg ip;
	wire out;
	reg clk;
	fsm finite(clk,ip,out);
	always @(posedge clk) begin
		$display("Time : %d | Input : %b | Alternating So far : %b ",$time,ip,out);
	end

	parameter clk_period=10;

	initial begin 
		#100
		$finish;
	end
	initial begin 
		forever begin 
			clk=0;
			#5
			clk=1;
			#5
			clk=0;
		end
	end
	initial begin 
		#3
		ip=0;
		$display("\n");
		#clk_period
		ip=1;
		$display("\n");
		#clk_period
		ip=0;
		$display("\n");
		#clk_period
		ip=1;
		$display("\n");
		#clk_period
		ip=0;
		$display("\n");
		#clk_period
		ip=0;
		$display("\n");
		#clk_period
		ip=1;
		$display("\n");
		#clk_period
		ip=1;
		$display("\n");
		#clk_period
		ip=1;
		$display("\n");
		#clk_period
		ip=1;
		$display("\n");

	end

endmodule