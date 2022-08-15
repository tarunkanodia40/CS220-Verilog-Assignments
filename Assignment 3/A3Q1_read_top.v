`include "./A3Q1_read.v"

module top;
	reg clk,clk2;
	reg[3:0] row;
	reg[2:0] count;
	reg input_valid;
	wire[31:0] out;
	wire ready;
	M memory(clk,row,input_valid,out,ready);
	
	parameter clk_period=10;
	parameter number_of_cycles=30;
	parameter finish_time= number_of_cycles*clk_period;
	parameter switch_time = clk_period/2;
	parameter clk_skew = 3;
	parameter cycle = 3*clk_period;
	initial begin
		count=3;
        #finish_time
        $finish;
    end

	always @(posedge ready) begin
		$display("Time = %d | Row number = %d | Row content = %d",$time,row,out);
	end

	// To set input_valid to correct value	

	always @(posedge clk2) begin
		
		if ( count == 3 ) begin
			input_valid<=1;
			count<=1;			
		end	else begin
			input_valid<=0;
			count<=count+1;
		end
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
		forever begin
			clk2=1;
			#switch_time
			clk2=0;
			#switch_time
			clk2=1;
		end
	end

	initial begin
		#clk_skew
		row=1;
		$display("\n");
		#cycle
		row=1;
		$display("\n");
		#cycle
		row =12;
		$display("\n");
		#cycle
		row =11;
		$display("\n");
		#cycle
		row=14;
		$display("\n");
		#cycle
		row =14;
		$display("\n");
		#cycle
		row =9;
		$display("\n");
		#cycle
		row = 10;
		$display("\n");
		#cycle
		row =11;
		$display("\n");
		#cycle
		row=12;
		$display("\n");
	end

endmodule

