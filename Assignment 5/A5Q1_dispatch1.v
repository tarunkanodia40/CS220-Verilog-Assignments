module dispatch1 (output wire [3:0]out1, input [1:0]data);

    //wire [3:0]out1 ;
    reg [3:0]dispatch_rom[3:0];
    initial begin
		dispatch_rom[0]=4;
		dispatch_rom[1]=5;
		dispatch_rom[2]=6;
		dispatch_rom[3]=6;
	end
    assign out1=dispatch_rom[data];
    
    
endmodule