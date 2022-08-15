module encoder_8_to_3(input [7:0] a, output wire [2:0] b);
	assign b[0] = a[7] | a[5] | a[3] | a[1];
	assign b[1] = a[7] | a[6] | a[3] | a[2];
	assign b[2] = a[7] | a[6] | a[5] | a[4];

endmodule