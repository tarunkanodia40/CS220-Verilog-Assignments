module decoder_3_to_8(input[2:0] a,output wire[7:0] b);
	assign b[0] = ~a[2] & ~a[1] & ~a[0];
	assign b[1] = ~a[2] & ~a[1] & a[0];
	assign b[2] = ~a[2] & a[1] & ~a[0];
	assign b[3] = ~a[2] & a[1] & a[0];
	assign b[4] = a[2] & ~a[1] & ~a[0];
	assign b[5] = a[2] & ~a[1] & a[0];
	assign b[6] = a[2] & a[1] & ~a[0];
	assign b[7] = a[2] & a[1] & a[0];
	

endmodule