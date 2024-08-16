module fifo_tb; 
reg [7:0] data_in;
reg clk;
reg rst;
reg [3:0] read_address;
wire [7:0] data_out;

fifo uut(.data_in(data_in),.clk(clk),.rst(rst),.read_address(read_address),.data_out(data_out));

always #1 clk = ~clk ;

initial
	begin
	$dumpfile("fifo.vcd");
	$dumpvars(0,fifo_tb);
	$monitor($time,"  data_in=%d , rst=%b , read_address =%d, data_out = %d",data_in,rst,read_address,data_out);
	clk = 0;
	rst = 1;
	#5 rst = 0;
	data_in = $random; read_address = 4'd1;
	#5 data_in = $random; read_address = 4'd1;
	#5 data_in = $random; read_address = 4'd2;
	#5 data_in = $random; read_address = 4'd3;
	#5 data_in = $random; read_address = 4'd4;
	#5 data_in = $random; read_address = 4'd5;
	#5 data_in = $random; read_address = 4'd6;
	#5 data_in = $random; read_address = 4'd7;
	#5 data_in = $random; read_address = 4'd7;
	#5 data_in = $random; read_address = 4'd8;
	#5 data_in = $random; read_address = 4'd9;
	#5 data_in = $random; read_address = 4'd10;
	$finish;
	end
endmodule
