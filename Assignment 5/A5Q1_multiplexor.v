module multiplexor (  output [3:0]out, input [3:0]branch ,input [3:0]increment, input [3:0]out1, input [3:0]out2);

    reg [3:0]next_state ;
    wire [3:0]out ;
    
    always @(branch or increment) begin
        case (branch)
            4'b0000: assign next_state=increment;
            4'b0001: assign next_state=out1;
            4'b0010: assign next_state=out2;
            4'b0011: assign next_state=7; 
            default: assign next_state=0; 
        endcase
    end
    assign out=next_state;  
    
    
    
endmodule