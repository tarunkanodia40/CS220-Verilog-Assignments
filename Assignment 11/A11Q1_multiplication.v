module M( input clk, input  [31:0]multiplicand, input signed [31:0]multiplier , input input_ready , output [64:0]product, output output_ready ,output [5:0]Additions,output [5:0]Subtractions);
	reg signed [64:0]product; 
	reg output_ready;
	reg signed [32:0]temp1 ;
    reg signed [63:0]temp2;
	reg [5:0]Additions;
    reg [5:0]Subtractions;
	
	
	parameter clk_period=10;
	
	

	initial begin
		product<=0;
        output_ready<=0;
        temp1<=0;
        temp2<=0;	
        Additions<=0;
        Subtractions<=0;	
	end
	always @(posedge clk ) begin
		if (input_ready==1) begin   // In case the multiplier is not 0 i will start the calculations from next cycle
			temp2<=#1 multiplicand;
            temp1[32:1]<=#1 multiplier;
            temp1[0]<=#1 0;
            product<=#2 0;
            Additions<=#2 0;
            Subtractions<=#2 0;
            if (multiplier==0 ) begin
                product<=#1 0;
            end
            else begin
                output_ready=#1 0;
            end            
		end		 
        else if (temp2==0 | temp2==-1) begin   // Checking for early termination
            output_ready<=#1 1;
        end
        else begin
            if (temp1[0]==0 & temp1[1]==1) begin
                Subtractions<=#2 Subtractions+1;
                product=#2 product-temp2;
                
            end
            else if (temp1[0]==1 & temp1[1]==0) begin
                Additions<=#2 Additions+1;
                product=#2 product+temp2;

            end
            temp1=#2  temp1>>>1;
            temp2=#2  temp2<<<1;
        end
	end
	


endmodule
