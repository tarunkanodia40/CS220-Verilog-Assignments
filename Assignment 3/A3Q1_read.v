module M( input clk, input[3:0] row, input input_valid , output[31:0] display , output out );
	reg[31:0] store [15:0]; 
	reg[3:0] row_open;
	reg[31:0] display ;
	reg out;
	reg uninitialised;
	
	
	parameter clk_period=10;
	
	

	initial begin
		store[0]=0;
		store[1]=1;
		store[2]=2;
		store[3]=3;
		store[4]=4;
		store[5]=5;
		store[6]=6;
		store[7]=7;
		store[8]=8;
		store[9]=9;
		store[10]=10;
		store[11]=11;
		store[12]=12;
		store[13]=13;
		store[14]=14;
		store[15]=15;
		uninitialised=1;
		
	end
	always @(posedge clk ) begin
		if (input_valid==1) begin
			out<= 0;
		 	if ( uninitialised ==1 ) begin
				 
				 display <=   store[row]; 
				 row_open <=  row;
				 uninitialised <=  0;
				 #clk_period
				 out<= 1;
			 end
			 else if ( row_open != row ) begin
				 
				 display <=   store[row];
				 row_open <=  row;
				 #clk_period
				 #clk_period	 
				 out<= 1;
			 end
			else begin
				out<= 1;
			end
		end		
	end
	


endmodule