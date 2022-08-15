`include "A5Q2_one_bit_comparator.v"
module three_bit_comparator(input[2:0] a, input[2:0] b, output wire l, output wire e, output wire g);
	wire[1:0] l_prev,e_prev,g_prev;
	one_bit_comparator C3(a[2],b[2],1'b0,1'b1,1'b0,l_prev[1],e_prev[1],g_prev[1]);
	one_bit_comparator C2(a[1],b[1],l_prev[1],e_prev[1],g_prev[1],l_prev[0],e_prev[0],g_prev[0]);
	one_bit_comparator C1(a[0],b[0],l_prev[0],e_prev[0],g_prev[0],l,e,g);
endmodule
