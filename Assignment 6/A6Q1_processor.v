module processor ( input [4:0]read1_add , input [4:0]read2_add , input [4:0]write_add , input signed [15:0]write , input [2:0]code , output reg [4:0]add1 ,output reg [4:0]add2 , output reg signed [15:0]value1 , output reg signed [15:0]value2 ,output done );
   reg signed [15:0]register_file [31:0]; 
   reg clk;
   reg done;
   reg signed [15:0]temp1 ;
   reg signed [15:0]temp2 ;
   parameter clk_period=10;
   parameter number_of_cycles=9;
   parameter finish_time= number_of_cycles*clk_period;
   parameter switch_time = clk_period/2;
   parameter clk_skew = switch_time-2;
   parameter latency1 = 2*clk_period;
   parameter latency2 = 16*clk_period;
   initial begin
        done<=1;
        #switch_time
        forever begin
            clk=1;
            #switch_time
            clk=0;
            #switch_time
            clk=1;
        end
    end
    // Here it is assumed that read and write operations takes place simultaneously when write data is provided.  
    always @(posedge clk) begin
        if (done==1) begin
                done<=0;
                case (code)
                        3'b000: begin
                                register_file[write_add]<=#2write;
                                #latency1
                                done<=#2 1;
                                end
                        3'b001: begin
                                value1<=#2 register_file[read1_add];
                                add1<=#2 read1_add;
                                #latency1
                                done<=#2 1;                    
                                end            
                        3'b010: begin
                    
                                value1<=#2 register_file[read1_add];
                                add1<=#2 read1_add;
                                value2<=#2 register_file[read2_add];
                                add2<=#2 read2_add;
                                #latency1
                                done<=#2 1;
                                end
                        3'b011: begin
                                value1<=#2 register_file[read1_add];
                                add1<=#2 read1_add;
                                // #latency1
                                register_file[write_add]<=#2 write;
                                #latency1
                                done<=#2 1;
                                end
                        3'b100: begin
                                value1<=#2 register_file[read1_add];
                                add1<=#2 read1_add;
                                value2<=#2 register_file[read2_add];
                                add2<=#2 read2_add;
                                // #latency1
                                register_file[write_add]<=#2 write;
                                #latency1
                                done<=#2 1;
                                end
                        3'b101:begin
                                temp1<=#2 register_file[read1_add];
                                temp2<=#2 register_file[read2_add];                   
                                #latency1
                                #latency2
                                register_file[write_add]<=#2temp1+temp2;
                                #latency1
                                value1<= #2 register_file[write_add];
                                
                                add1<= #2 write_add;
                     
                                done<=#2 1;
                                end
                        3'b110:begin
                                temp1<= #2 register_file[read1_add];
                                temp2<= #2 register_file[read2_add];
                                #latency1
                                #latency2
                                register_file[write_add]<= #2 temp1 - temp2;
                                #latency1
                                value1<= #2 register_file[write_add];
                                
                                add1<= #2 write_add;
                                done<=#2 1;
                                end
                    
                        3'b111: begin
                                temp1<= #2 register_file[read1_add]; 
                                #latency1
                                #latency2
                                register_file[write_add]<= #2 temp1 << write;
                                #latency1
                                value1<= #2 register_file[write_add];
                                add1<= #2 write_add;
                                done<=#2 1;
                                end
                        default: done<=#2 1;
                endcase     
        end
        
                
    end

endmodule