module fifo(input [7:0] data_in,input clk,input rst,input [3:0] read_address,output reg [7:0] data_out);

integer write_address = 0;
reg [7:0] fifo [15:0] ;

always @(posedge clk, posedge rst)
begin
	case(!rst)
		1'b0 : begin                               //reset
			if(write_address < 16 && write_address >= 0)
				begin
				fifo[write_address] <= 8'b0;
				write_address++;
				end
			else
				write_address = 0;
			end
		1'b1 : begin                             // write
				if (write_address < 16 && write_address >= 0)
					begin
					fifo[write_address] <= data_in;
					@(data_in) write_address++;
					end
				else
				write_address = 0;
			end	
	endcase
	
end
	
always @(posedge clk)
begin								   //read
	if (read_address <=4'b1111 && read_address >=4'b0000)      
		@(read_address) data_out <= fifo[read_address];
	else
		$display("default read address to 0 ");
end

endmodule


