`include "A4Q2_fivebit.v"
module new_coordinates ( input[1:0] dir ,input[1:0] step ,output[4:0] x,output[4:0] y ,input clk);

   
   reg signed[4:0] x;
   reg signed[4:0] y;
   reg signed[4:0] add_to;
   wire signed[4:0] result;
   reg signed[4:0] temp;
   reg opcode;
   wire carry_out;
   wire overflow;
   five_bit_adder A (add_to, {3'b000,step}, result, carry_out,opcode,overflow);

    initial begin
        x<=0;
        y<=0;
    end
    always @(posedge clk) begin
        opcode=dir[0];
        if (~dir[1]) begin
            assign add_to=x;
        end 
        else begin
            assign add_to=y;
        end
        #1
        temp=result;
        if(temp[4]) begin
            temp=0;
        end
        if(overflow) begin
            temp=15;
        end
        #1
        if (~dir[1]) begin
            x <= #1 temp;
        end 
        else begin
            y <= #1 temp;
        end         
    end
    
endmodule