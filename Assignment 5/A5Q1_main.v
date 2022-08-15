`include "A5Q1_state_register.v"
`include "A5Q1_microcode.v"
`include "A5Q1_dispatch1.v"
`include "A5Q1_dispatch2.v"
`include "A5Q1_multiplexor.v"

module fsm ( input [1:0]data, output [3:0]current_state, input clk );
   
      
    wire [3:0]current_state;
    wire [3:0]branch ;
    wire [3:0]next_state ;
    wire [3:0]increment ;
    wire [3:0] out1;
    wire [3:0] out2;

    
    state_register store (current_state,next_state,clk);
    microcode m (branch,current_state); 
    dispatch1 d1 (out1,data);
    dispatch2 d2 (out2,data);
    multiplexor M (next_state,branch,increment,out1,out2);
    assign increment=current_state+1;
endmodule
