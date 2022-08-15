`include "A5Q1_main.v"

module top;
	reg clk;
	reg [1:0]data;
    wire [3:0]current_state;
	parameter clk_period=10;
	parameter number_of_cycles=10;
	parameter finish_time= number_of_cycles*clk_period;
	parameter switch_time = clk_period/2;
	parameter clk_skew = switch_time-2;
    fsm unit(data,current_state,clk);
	initial begin
        #finish_time
        $finish;
    end

	always @(posedge clk  ) begin
		$display("Time = %d |  Current state=%d | Input=%b",$time,current_state,data);
	end	

    initial begin
		#switch_time
    	forever begin
    		clk=1;
    		#switch_time
    		clk=0;
    		#switch_time
    		clk=1;
    	end
    end

    initial begin
        #clk_skew
        data=1;
        #clk_period
        data=1;
        #clk_period
        data=3;
        #clk_period
        data=1;
        #clk_period
        data=1;
        #clk_period
        data=2;
        #clk_period
        data=1;
        #clk_period
        data=2;
        #clk_period
        data=1;
        #clk_period
        data=0;
    end
	
endmodule
