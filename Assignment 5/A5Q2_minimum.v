`include "A5Q2_three_bit_comparator.v"
module minimum_index(input[2:0] a,input[2:0] b,input[2:0] c,input[2:0] d,output wire[1:0] idx);
	wire[5:0] l,g,e;

	three_bit_comparator C1(a,b,l[0],e[0],g[0]);
	three_bit_comparator C2(a,c,l[1],e[1],g[1]);
	three_bit_comparator C3(a,d,l[2],e[2],g[2]);
	three_bit_comparator C4(b,c,l[3],e[3],g[3]);
	three_bit_comparator C5(b,d,l[4],e[4],g[4]);
	three_bit_comparator C6(c,d,l[5],e[5],g[5]);

	assign idx[1] = ((g[1]) & (g[3]) & (l[5]|e[5])) | (g[2] & g[4] & g[5]);  // c minimum or d minimum
	assign idx[0] = ((g[0]) & (l[4]|e[4]) & (l[3]|e[3])) | ((g[2]) & (g[4]) & (g[5]));  // b minimum or d minimum





endmodule