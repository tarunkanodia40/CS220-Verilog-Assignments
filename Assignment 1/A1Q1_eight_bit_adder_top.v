`include "A1Q1_eight_bit_adder.v"
module eight_bit_adder_top;

   reg [7:0] A;
   reg [7:0] B;
   reg Cin;

   wire [7:0] Sum;
   wire Carry;

   eight_bit_adder ADDER (A, B, Cin, Sum, Carry);



   always @ (A or B or Cin or Sum or Carry) begin
   $display("time=%d | A = %d, B = %d, Cin = %d | Sum = %d Carry = %d",$time, A , B, Cin, Sum, Carry);
   end

   initial begin
      A = 100; B = 100; Cin = 1;
      #1
      $display("\n");
      A = 200; B = 200; Cin = 0;
      #1
      $display("\n");
      A = 20; B = 200; Cin = 0;
      #1
      $display("\n");
      A = 57; B = 117; Cin = 1;
      #1
      $display("\n");
      A = 72; B = 56; Cin = 0;
      #1
      $display("\n");
      A = 108; B = 119; Cin = 0;
      #1
      $display("\n");
      A = 110; B = 110; Cin = 1;
      #1
      $display("\n");
      A = 1; B = 1; Cin = 1;
      #1
      $display("\n");
      A = 222; B = 242; Cin = 1;
      #1
      $display("\n");
      A = 255; B = 1; Cin = 0;
      #1
      $finish;
      $display("\n");
      
     
   end
endmodule