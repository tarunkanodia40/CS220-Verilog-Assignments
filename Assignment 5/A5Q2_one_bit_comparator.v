module one_bit_comparator(input a,input b,input prev_l,input prev_e,input prev_g,output wire l,output wire e,output wire g);
	assign l=prev_l | (prev_e&((~a)&b));
	assign e=prev_e & (~(a^b));
	assign g= prev_g | (prev_e & (a&(~b)));
endmodule
