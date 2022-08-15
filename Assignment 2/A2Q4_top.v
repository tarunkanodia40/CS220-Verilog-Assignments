`include "./A2Q4_rotate.v"

module top;
	reg clk;
	wire[3:0] out;
	M rotate(clk,out);
	always @(out) begin
		$display("Time : %d | Output : %b\n",$time,out);	
	end
	parameter clk_period=10;
	parameter number_of_cycles=310000;
	parameter finish_time= number_of_cycles*clk_period;
	parameter switch_time = clk_period/2;
	initial begin
        #finish_time
        $finish;
    end

    initial begin 
        #clk_period
    	forever begin
    		clk=1; 
    		#switch_time
    		clk=0;
    		#switch_time
    		clk=1;
    	end
    end


endmodule