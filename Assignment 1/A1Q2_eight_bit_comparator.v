`include "A1Q2_one_bit_comparator.v"
module eight_bit_comparator(input[7:0] a, input[7:0] b, output wire l, output wire e, output wire g);
	wire[6:0] l_prev,e_prev,g_prev;
	one_bit_comparator C0(a[7],b[7],1'b0,1'b1,1'b0,l_prev[6],e_prev[6],g_prev[6]);
	one_bit_comparator C1(a[6],b[6],l_prev[6],e_prev[6],g_prev[6],l_prev[5],e_prev[5],g_prev[5]);
	one_bit_comparator C2(a[5],b[5],l_prev[5],e_prev[5],g_prev[5],l_prev[4],e_prev[4],g_prev[4]);
	one_bit_comparator C3(a[4],b[4],l_prev[4],e_prev[4],g_prev[4],l_prev[3],e_prev[3],g_prev[3]);
	one_bit_comparator C4(a[3],b[3],l_prev[3],e_prev[3],g_prev[3],l_prev[2],e_prev[2],g_prev[2]);
	one_bit_comparator C5(a[2],b[2],l_prev[2],e_prev[2],g_prev[2],l_prev[1],e_prev[1],g_prev[1]);
	one_bit_comparator C6(a[1],b[1],l_prev[1],e_prev[1],g_prev[1],l_prev[0],e_prev[0],g_prev[0]);
	one_bit_comparator C7(a[0],b[0],l_prev[0],e_prev[0],g_prev[0],l,e,g);
endmodule
