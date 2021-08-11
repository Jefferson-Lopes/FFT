module fx2lp_slaveFIFO2b_streamIN_fpga_top(
//	reset_n,
	fdata,  
        faddr,  
        slrd,   
        slwr,   
        sloe,              
        flagd,  
        flaga,  
        clk,    
        clk_out,
	pkt_end,
	done,
	sync,
	dbug_sig
);

//input reset_n;
inout [15:0]fdata;
input flaga;
input flagd;
input clk;

output clk_out; 
output [1:0]faddr;
output sloe;
output slwr;
output slrd;
output pkt_end;
output done;
input sync;

output dbug_sig;

reg slrd_n;
reg slwr_n;
reg sloe_n;
reg slrd_d_n;

reg [7:0] fifo_data_in;
reg [7:0] fifo_data_out;
reg [16:0] data_out1;
//reg [7:0] data_out2;

wire reset_n;

parameter stream_in_idle   = 1'b0;
parameter stream_in_write  = 1'b1;

reg current_stream_in_state;
reg next_stream_in_state;

reg done_d;
reg [3:0]wait_s;

wire clk_out_0;
wire clk_out_90;
wire clk_out_180;
wire clk_out_270;


ODDR2 oddr2_inst
	(
	 .D0(1'b1),
	 .D1(1'b0),
	 .CE(1'b1),
	 .C0(clk_out_180),  
	 .C1(!clk_out_180), 
	 .R (1'b0),
	 .S (1'b0),
	 .Q (clk_out)
	);
	
		
clk_wiz_v3_6 clk_inst  	                                   // PLL
	(
	 .CLK_IN1  (clk),
	 .CLK_OUT1 (clk_out_0),		
	 .CLK_OUT2 (clk_out_90),
	 .CLK_OUT3 (clk_out_180),
	 .CLK_OUT4 (clk_out_270),
	 .RESET    (1'b0),
	 .LOCKED   (/*reset_n*/lock)
		);

assign reset_n = sync & lock;		

//assign clk_out_0 = clk;
assign slwr = slwr_n;
assign slrd = slrd_n;
assign sloe = sloe_n;
assign pkt_end = 1'b1;
//assign fdata[7:0] = data_out2[7:0];
assign fdata[15:0] = data_out1[15:0];
assign faddr = 2'b10;
assign done = done_d;


always@(posedge clk_out_0, negedge reset_n) begin
	if(reset_n == 1'b0)begin
		done_d <= 1'b0;
 	end else if(wait_s == 4'd10) begin
		done_d <= 1'b1;

	end
end	

always@(posedge clk_out_0, negedge reset_n) begin
	if(reset_n == 1'b0)begin
		wait_s <= 4'd0;
 	end else if(wait_s < 4'd10) begin
		wait_s <= wait_s + 1'b1;

	end
end	



//write control signal generation
always@(*)begin
	if((current_stream_in_state == stream_in_write) & (flagd == 1'b1))
		slwr_n <= 1'b0;
	else
		slwr_n <= 1'b1;
end

//dbugging 
reg flagd_d;
reg slwr_n_d;

always@(posedge clk_out_0, negedge reset_n) begin
	if(reset_n == 1'b0)begin
		flagd_d  <= 1'b0;
		slwr_n_d <= 1'b1;
 	end else begin
		flagd_d  <= flagd_d;
		slwr_n_d <= slwr_n;
	end
end	

assign dbug_sig = flagd_d | slwr_n_d;

//loopback mode state machine 
always@(posedge clk_out_0, negedge reset_n) begin
	if(reset_n == 1'b0)
      		current_stream_in_state <= stream_in_idle;
        else
                current_stream_in_state <= next_stream_in_state;
end

//LoopBack mode state machine combo
always@(*) begin
	next_stream_in_state = current_stream_in_state;
	case(current_stream_in_state)
		stream_in_idle:begin
			if((flagd == 1'b1) & (sync == 1'b1))
				next_stream_in_state = stream_in_write;
			else
				next_stream_in_state = stream_in_idle;
		end
		stream_in_write:begin
			if(flagd == 1'b0)
				next_stream_in_state = stream_in_idle;
			else
				next_stream_in_state = stream_in_write;
		end
		default: 
			next_stream_in_state = stream_in_idle;
	endcase
end


//data generator counter

always@(posedge clk_out_0, negedge reset_n)begin
	if(reset_n == 1'b0)
		data_out1 <= 16'd0;
	else if(slwr_n == 1'b0)
		data_out1 <= data_out1 + 16'd1;
end		

/*always@(posedge clk_out_0, negedge reset_n)begin
	if(reset_n == 1'b0)
		data_out2 <= 8'd0;
	else if(slwr_n == 1'b0)
		data_out2 <= data_out2 + 8'd2;
end*/


endmodule
