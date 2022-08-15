module microcode (output [3:0]microinstruction, input [3:0]state);

    wire [3:0]microinstruction ;
    reg [3:0]microcode_rom[15:0];
    initial begin
		microcode_rom[0]=0;
		microcode_rom[1]=0;
		microcode_rom[2]=0;
		microcode_rom[3]=1;
		microcode_rom[4]=3;
		microcode_rom[5]=3;
		microcode_rom[6]=0;
		microcode_rom[7]=0;
		microcode_rom[8]=0;
		microcode_rom[9]=0;
		microcode_rom[10]=2;
		microcode_rom[11]=4;
		microcode_rom[12]=4;
		
		
	end
    
    assign microinstruction=microcode_rom[state];
    
    
endmodule