`include "A4Q1_eight_bit_adder_subtractor.v"
module eight_bit_adder_top;

   reg signed [7:0] A;
   reg signed [7:0] B;
   reg opcode;

   wire overflow;
   wire signed [7:0] Sum;
   wire Carry;

   eight_bit_adder_subtractor ADDER (A, B, opcode, Sum, Carry, overflow);



   always @ (A or B or Sum or Carry or overflow) begin
   $display("time=%d | A = %d B = %d opcode = %d | Sum/Difference = %d Carry = %d Overflow = %d",$time, A , B, opcode, Sum, Carry,overflow);
   end

   initial begin
      A = 8'b100; B = 8'b100; opcode = 0;
      #1
      $display("\n");
      A = 6; B = 7; opcode = 1;
      #1
      $display("\n");
      A = 124; B = 10; opcode = 1;
      #1
      $display("\n");
      A = 124; B = 120; opcode = 1;
      #1
      $display("\n");
      A = 72; B = 56; opcode = 0;
      #1
      $display("\n");
      A = 108; B = 119; opcode = 0;
      #1
      $display("\n");
      A = 110; B = 110; opcode = 1;
      #1
      $display("\n");
      A = 1; B = 1; opcode = 1;
      #1
      $display("\n");
      A = 128; B = 127; opcode = 1;
      #1
      $display("\n");
      A = 12; B = 1; opcode = 0;
      #1
      $finish;
     
   end
endmodule