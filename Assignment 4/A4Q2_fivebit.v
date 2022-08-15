`include "A4Q2_onebit.v"
module five_bit_adder (x, y, sum, carry_out,opcode,overflow);

   input [4:0] x;
   input [4:0] y;
   input carry_in;
   input opcode;
   output [4:0] sum;
   wire [4:0] sum;
   output wire overflow;
   output wire carry_out;

   wire [3:0] intermediate_carry;



   full_adder FA0 (x[0], y[0], opcode, sum[0], intermediate_carry[0],opcode);

   full_adder FA1 (x[1],y[1],intermediate_carry[0],sum[1],intermediate_carry[1],opcode);

   full_adder FA2 (x[2],y[2],intermediate_carry[1],sum[2],intermediate_carry[2],opcode);

   full_adder FA3 (x[3],y[3],intermediate_carry[2],sum[3],intermediate_carry[3],opcode);

   full_adder FA4 (x[4],y[4],intermediate_carry[3],sum[4],carry_out,opcode);
   
   assign overflow=intermediate_carry[3]^carry_out;

endmodule
