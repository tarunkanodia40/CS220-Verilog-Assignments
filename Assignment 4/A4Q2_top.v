`include "A4Q2_new_coordinates.v"

//Assumed Directions: East=0, West=1, North=2, South=3
module top;
	reg clk;
	reg [1:0] dir;
    reg[1:0] step;
    wire[4:0] x;
    wire[4:0] y;
	parameter clk_period=10;
	parameter number_of_cycles=10;
	parameter finish_time= number_of_cycles*clk_period;
	parameter switch_time = clk_period/2;
	parameter clk_skew = switch_time-2;
    new_coordinates unit(dir,step,x,y,clk);
	initial begin
        #finish_time
        $finish;
    end

	always @(posedge clk) begin
		$display("Time = %d | Current Coordinates = (%d,%d) | Direction = %d , Steps = %d",$time,x,y,dir,step);
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
        dir=0;
        step=2;
        $display("\n");
        #clk_period
        dir=1;
        step=3;
        $display("\n");
        #clk_period
        dir=2;
        step=1;
        $display("\n");
        #clk_period
        dir=3;
        step=3;
        $display("\n");
        #clk_period
        dir=0;
        step=3;
        $display("\n");
        #clk_period
        dir=0;
        step=3;
        $display("\n");
        #clk_period
        dir=0;
        step=3;
        $display("\n");
        #clk_period
        dir=0;
        step=3;
        $display("\n");
        #clk_period
        dir=0;
        step=3;
        $display("\n");
        #clk_period
        dir=0;
        step=3;
        $display("\n");
    end
	
endmodule
