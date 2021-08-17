module FIFO_controller(
	input flagd_n,  // EP6 FULL FLAG 
   input clk,
	input sync_n,
	input [7:0] data_in,
	
	output reg [7:0]data_out,  
   output reg [1:0]faddr = 2'b10,  // fx2 address
   output reg slrd_n = 1'b0,       // \
   output reg slwr_n = 1'b1,       //  --> all low at start
   output reg sloe_n = 1'b1,       // /
	output reg pkt_end = 1'b1,
	
	inout reg reset = 1'b0     // not used yet
);

	reg current_stream_in_state;
	reg next_stream_in_state;
	
	parameter stream_in_idle  = 1'b0;
	parameter stream_in_write = 1'b1;
	
	
	// just tied together right now
	//	assign data_out = data_in;	


	//write control signal generation
	always @ (*)begin
		if((current_stream_in_state == stream_in_write) & (flagd_n == 1'b1))
			slwr_n <= 1'b0;
		else
			slwr_n <= 1'b1;
	end

	//reset state machine
	always @ (posedge clk, posedge reset) begin
		if(reset == 1'b1) 
			current_stream_in_state <= stream_in_idle;
		else 
			current_stream_in_state <= next_stream_in_state;
	end

	//stream in state machine
	always @ (*) begin
		next_stream_in_state = current_stream_in_state;
		
		case(current_stream_in_state)
			stream_in_idle:begin
					if((flagd_n == 1'b1) & (sync_n == 1'b1))
						next_stream_in_state = stream_in_write;
					else 
						next_stream_in_state = stream_in_idle;
				end
			
			stream_in_write:begin
				if(flagd_n == 1'b1)
					next_stream_in_state = stream_in_idle;
				else 
					next_stream_in_state = stream_in_write;
			end
			
			default: 
				next_stream_in_state = stream_in_idle;
		endcase
	end


	//data generator counter	

	// just to see how the data is sent
	// increments data_out bit by bit until it
	// overflows, i.e. from 8'd0 to 8'd255
	always @ (posedge clk, posedge reset)begin
		if(reset == 1'b1)
			data_out <= 8'b0;
		else if(slwr_n == 1'b0)
			data_out <= data_out + 8'b1;
	end
	
endmodule
