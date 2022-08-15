// {a,b}---> State
// 00 --> Start
// 01 --> Zero state
// 10 --> One state
// 11 --> Reject state

module fsm(input clk,input ip,output wire out);
	reg a=0,b=0;
	always @(posedge clk) begin
		a <= (ip | b);
		b <= (a | (~ip));
	end
	assign out=((~b)&(~ip)) | ((~a) & ip);

endmodule