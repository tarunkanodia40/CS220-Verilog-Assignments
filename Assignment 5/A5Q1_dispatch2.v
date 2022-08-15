module dispatch2 (output [3:0]out2, input [1:0]data);

    wire [3:0]out2 ;
    reg [3:0]dispatch_rom[3:0];
    initial begin
		dispatch_rom[0]=11;
		dispatch_rom[1]=12;
		dispatch_rom[2]=12;
		dispatch_rom[3]=12;
	end
    assign out2=dispatch_rom[data];
    
    
endmodule