module state_register (output [3:0]state, input [3:0]new_state, input clk);

    reg [3:0]state ;
    wire [3:0]out;

    
    always @(posedge clk) begin
        state<=#2 new_state;
    end

    initial begin
        state=0;
    end
    assign out=state;
endmodule
