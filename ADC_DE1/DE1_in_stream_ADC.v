module DE1_in_stream_ADC(
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
	dbug_sig,
//	data_adc,
	CLOCK_50, 
	SW, 
	DATA_OUT, 
	ADC_SCLK, 
	ADC_CONVST, 
	ADC_SDO, 
	ADC_SDI
);

output [15:0]fdata;
//input [11:0] data_adc;
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

reg slrd_d_n;

reg [7:0] fifo_data_in;
reg [7:0] fifo_data_out;
reg [16:0] data_out2;
//reg [7:0] data_out2;

reg slrd_n;
reg slwr_n;
reg sloe_n;


wire reset_n;
wire reset = 1'b0; //1'b0;

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

reg [6:0]count;

assign reset_n = ~reset;

assign clk_out_0 = clk;
assign slwr = slwr_n;
assign slrd = slrd_n;
assign sloe = sloe_n;
assign pkt_end = 1'b1;
//assign fdata[7:0] = data_out2[7:0];
assign fdata[15:0] = data_out2[15:0];
assign faddr = 2'b10;
assign done = done_d;

initial
	begin
	
		slrd_n = 1'b0; //1'b0
		slwr_n = 1'b1; //1'b1
		sloe_n = 1'b1; //1'b1
	
	end



//////////////////////////////////////////////////////////////////////
//	ADC

input CLOCK_50;
reg [0:0] KEY;
input [2:0] SW;
output wire [11:0] DATA_OUT;
input ADC_SDO;
output ADC_SCLK, ADC_CONVST, ADC_SDI;
wire [11:0]values[7:0];

assign DATA_OUT[11:0] = values[0][11:0];

initial
	begin
		KEY = 1'b1;
	end
//assign LED = values [SW] [11:2];


ADC_IP_adc_mega_0 ADC ( //ALTCLOCK_50, SW, DATA_OUT, ADC_SCLK, ADC_CONVST, ADC_SDO, ADC_SDIERADO PARA O NOME DO SUBMODULO DO IP
	.CLOCK (CLOCK_50),
	.RESET (!KEY[0]),
	.ADC_SCLK (ADC_SCLK),
	.ADC_CS_N (ADC_CONVST),
	.ADC_DOUT (ADC_SDO),
	.ADC_DIN (ADC_SDI),
	.CH0 (values[0]),
	.CH1 (values[1]),
	.CH2 (values[2]),
	.CH3 (values[3]),
	.CH4 (values[4]),
	.CH5 (values[5]),
	.CH6 (values[6]),
	.CH7 (values[7])
); 
/////////////////////////////////////////////////////////////////////


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
		data_out2 <= 16'd0;//data_out1 <= 16'd0;
	else if(slwr_n == 1'b0 && ADC_CONVST)
		data_out2 <= {DATA_OUT[11:0],4'd0};
end	

/*always@(posedge clk_out_0, negedge reset_n)begin
	if(reset_n == 1'b0)
		data_out2 <= 8'd0;
	else if(slwr_n == 1'b0)
		data_out2 <= data_out2 + 8'd1;
end*/






endmodule
