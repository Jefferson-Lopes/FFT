module FIFO_controller(
	input flaga,
	input flagd,   
   input clk,
	input sync,
	input [11:0] data_adc,
	
	output reg [15:0]fdata,  
   output [1:0]faddr,  
   output reg slrd,   
   output reg slwr,   
   output reg sloe,              
   output clk_out,
	output pkt_end,
	output reg done,
	output dbug_sig,
	
	inout reset
);

	reg current_stream_in_state;
	reg next_stream_in_state;
	reg [3:0]wait_s;
	reg [6:0]count;
	
	parameter stream_in_idle  = 1'b0;
	parameter stream_in_write = 1'b1;
	
	assign pkt_end = 1'b1;
	assign faddr = 2'b10;

	// -----debugging----- 
	//	reg done_d;
	//	reg flagd_d;
	//	reg slwr_n_d;
	//	
	//	assign done = done_d;
	//	assign dbug_sig = flagd_d | slwr_n_d;
	//
	//	always@(posedge clk, negedge reset_n) begin
	//		if(reset_n == 1'b0)begin
	//			flagd_d  <= 1'b0;
	//			slwr_n_d <= 1'b1;
	//		end else begin
	//			flagd_d  <= flagd_d;
	//			slwr_n_d <= slwr_n;
	//		end
	//	end	
	
	initial begin
		slrd = 1'b1;
		slwr = 1'b0;
		sloe = 1'b0;
	end
	
	always @ (posedge clk, posedge reset) begin
		if(reset == 1'b1)begin
			done <= 1'b0;
		end else if(wait_s == 4'd10) begin
			done <= 1'b1;
		end
	end	

	always @ (posedge clk, posedge reset) begin
		if(reset == 1'b1)begin
			wait_s <= 4'd0;
		end else if(wait_s < 4'd10) begin
			wait_s <= wait_s + 1'b1;
		end
	end	

	//write control signal generation
	always @ (*)begin
		if((current_stream_in_state == stream_in_write) & (flagd == 1'b1))
			slwr <= 1'b0;
		else
			slwr <= 1'b1;
	end

	//loopback mode state machine 
	always @ (posedge clk, posedge reset) begin
		if(reset == 1'b1) begin
			current_stream_in_state <= stream_in_idle;
		end else begin
			current_stream_in_state <= next_stream_in_state;
		end
	end

	//LoopBack mode state machine combo
	always @ (*) begin
		next_stream_in_state = current_stream_in_state;
		
		case(current_stream_in_state)
			stream_in_idle:begin
					if((flagd == 1'b1) & (sync == 1'b1)) begin
						next_stream_in_state = stream_in_write;
					end else begin
						next_stream_in_state = stream_in_idle;
					end
				end
			
			stream_in_write:begin
				if(flagd == 1'b0) begin
					next_stream_in_state = stream_in_idle;
				end else begin
					next_stream_in_state = stream_in_write;
				end
			end
			
			default: 
				next_stream_in_state = stream_in_idle;
		endcase
	end


	//data generator counter

	/* just to see how the data is sent
	always @ (posedge clk_out_0, negedge reset_n)begin
		if(reset_n == 1'b0)
			data_out2 <= 8'd0;//data_out1 <= 16'd0;
		else if(slwr_n == 1'b0)
			//data_out1 <= {4'd0, data_adc};
			count <= count+1;
			case (count)
				 8'b00000000: data_out2 <= 8'b01111111;
				 8'b00000001: data_out2 <= 8'b10000010;
	*/

endmodule
