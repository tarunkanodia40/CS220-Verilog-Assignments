module one_bit_adder_subtractor(a, b, cin, opcode, sum, carry);

   input a;
   input b;
   input cin;
   input opcode;

   output sum;
   wire sum;
   output carry;
   wire carry;

   assign sum = a^(b^opcode)^cin;
   assign carry= ((a&(b^opcode)) | ((b^opcode)&cin) | (a&cin));

endmodule
