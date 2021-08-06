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
	dbug_sig,
	data_adc
);

//input reset_n;
output [15:0]fdata;
input [11:0] data_adc;
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

reg slrd_n = 1'b0; //1'b0
reg slwr_n = 1'b1; //1'b1
reg sloe_n = 1'b1; //1'b1 (considerar adicionar um 
								 //bloco initial para as inicializaçoes)
reg slrd_d_n;


reg [7:0] fifo_data_in;
reg [7:0] fifo_data_out;
reg [16:0] data_out1;
reg [7:0] data_out2;

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

reg [7:0]count;


/*ODDR2 oddr2_inst
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
	 .LOCKED   (//reset_n//lock)
		);
*/


assign reset_n = ~reset;

assign clk_out_0 = clk;
assign slwr = slwr_n;
assign slrd = slrd_n;
assign sloe = sloe_n;
assign pkt_end = 1'b1;
assign fdata[7:0] = data_out2[7:0];
//assign fdata[15:0] = data_out1[15:0];
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
		data_out2 <= 8'd0;//data_out1 <= 16'd0;
	else if(slwr_n == 1'b0)
		//data_out1 <= {4'd0, data_adc};
		count <= count+1;
	   case (count)
			 8'b00000000: data_out2 <= 8'b01111111;
			 8'b00000001: data_out2 <= 8'b10000010;
			 8'b00000010: data_out2 <= 8'b10000101;
			 8'b00000011: data_out2 <= 8'b10001000;
			 8'b00000100: data_out2 <= 8'b10001011;
			 8'b00000101: data_out2 <= 8'b10001111;
			 8'b00000110: data_out2 <= 8'b10010010;
			 8'b00000111: data_out2 <= 8'b10010101;
			 8'b00001000: data_out2 <= 8'b10011000;
			 8'b00001001: data_out2 <= 8'b10011011;
			 8'b00001010: data_out2 <= 8'b10011110;
			 8'b00001011: data_out2 <= 8'b10100001;
			 8'b00001100: data_out2 <= 8'b10100100;
			 8'b00001101: data_out2 <= 8'b10100111;
			 8'b00001110: data_out2 <= 8'b10101010;
			 8'b00001111: data_out2 <= 8'b10101101;
			 8'b00010000: data_out2 <= 8'b10110000;
			 8'b00010001: data_out2 <= 8'b10110011;
			 8'b00010010: data_out2 <= 8'b10110101;
			 8'b00010011: data_out2 <= 8'b10111000;
			 8'b00010100: data_out2 <= 8'b10111011;
			 8'b00010101: data_out2 <= 8'b10111110;
			 8'b00010110: data_out2 <= 8'b11000001;
			 8'b00010111: data_out2 <= 8'b11000011;
			 8'b00011000: data_out2 <= 8'b11000110;
			 8'b00011001: data_out2 <= 8'b11001000;
			 8'b00011010: data_out2 <= 8'b11001011;
			 8'b00011011: data_out2 <= 8'b11001101;
			 8'b00011100: data_out2 <= 8'b11010000;
			 8'b00011101: data_out2 <= 8'b11010010;
			 8'b00011110: data_out2 <= 8'b11010101;
			 8'b00011111: data_out2 <= 8'b11010111;
			 8'b00100000: data_out2 <= 8'b11011001;
			 8'b00100001: data_out2 <= 8'b11011011;
			 8'b00100010: data_out2 <= 8'b11011101;
			 8'b00100011: data_out2 <= 8'b11011111;
			 8'b00100100: data_out2 <= 8'b11100001;
			 8'b00100101: data_out2 <= 8'b11100011;
			 8'b00100110: data_out2 <= 8'b11100101;
			 8'b00100111: data_out2 <= 8'b11100111;
			 8'b00101000: data_out2 <= 8'b11101001;
			 8'b00101001: data_out2 <= 8'b11101011;
			 8'b00101010: data_out2 <= 8'b11101100;
			 8'b00101011: data_out2 <= 8'b11101110;
			 8'b00101100: data_out2 <= 8'b11101111;
			 8'b00101101: data_out2 <= 8'b11110001;
			 8'b00101110: data_out2 <= 8'b11110010;
			 8'b00101111: data_out2 <= 8'b11110011;
			 8'b00110000: data_out2 <= 8'b11110101;
			 8'b00110001: data_out2 <= 8'b11110110;
			 8'b00110010: data_out2 <= 8'b11110111;
			 8'b00110011: data_out2 <= 8'b11111000;
			 8'b00110100: data_out2 <= 8'b11111001;
			 8'b00110101: data_out2 <= 8'b11111010;
			 8'b00110110: data_out2 <= 8'b11111010;
			 8'b00110111: data_out2 <= 8'b11111011;
			 8'b00111000: data_out2 <= 8'b11111100;
			 8'b00111001: data_out2 <= 8'b11111100;
			 8'b00111010: data_out2 <= 8'b11111101;
			 8'b00111011: data_out2 <= 8'b11111101;
			 8'b00111100: data_out2 <= 8'b11111101;
			 8'b00111101: data_out2 <= 8'b11111110;
			 8'b00111110: data_out2 <= 8'b11111110;
			 8'b00111111: data_out2 <= 8'b11111110;
			 8'b01000000: data_out2 <= 8'b11111110;
			 8'b01000001: data_out2 <= 8'b11111110;
			 8'b01000010: data_out2 <= 8'b11111110;
			 8'b01000011: data_out2 <= 8'b11111110;
			 8'b01000100: data_out2 <= 8'b11111101;
			 8'b01000101: data_out2 <= 8'b11111101;
			 8'b01000110: data_out2 <= 8'b11111100;
			 8'b01000111: data_out2 <= 8'b11111100;
			 8'b01001000: data_out2 <= 8'b11111011;
			 8'b01001001: data_out2 <= 8'b11111011;
			 8'b01001010: data_out2 <= 8'b11111010;
			 8'b01001011: data_out2 <= 8'b11111001;
			 8'b01001100: data_out2 <= 8'b11111000;
			 8'b01001101: data_out2 <= 8'b11110111;
			 8'b01001110: data_out2 <= 8'b11110110;
			 8'b01001111: data_out2 <= 8'b11110101;
			 8'b01010000: data_out2 <= 8'b11110100;
			 8'b01010001: data_out2 <= 8'b11110011;
			 8'b01010010: data_out2 <= 8'b11110001;
			 8'b01010011: data_out2 <= 8'b11110000;
			 8'b01010100: data_out2 <= 8'b11101111;
			 8'b01010101: data_out2 <= 8'b11101101;
			 8'b01010110: data_out2 <= 8'b11101011;
			 8'b01010111: data_out2 <= 8'b11101010;
			 8'b01011000: data_out2 <= 8'b11101000;
			 8'b01011001: data_out2 <= 8'b11100110;
			 8'b01011010: data_out2 <= 8'b11100100;
			 8'b01011011: data_out2 <= 8'b11100010;
			 8'b01011100: data_out2 <= 8'b11100000;
			 8'b01011101: data_out2 <= 8'b11011110;
			 8'b01011110: data_out2 <= 8'b11011100;
			 8'b01011111: data_out2 <= 8'b11011010;
			 8'b01100000: data_out2 <= 8'b11011000;
			 8'b01100001: data_out2 <= 8'b11010110;
			 8'b01100010: data_out2 <= 8'b11010011;
			 8'b01100011: data_out2 <= 8'b11010001;
			 8'b01100100: data_out2 <= 8'b11001111;
			 8'b01100101: data_out2 <= 8'b11001100;
			 8'b01100110: data_out2 <= 8'b11001010;
			 8'b01100111: data_out2 <= 8'b11000111;
			 8'b01101000: data_out2 <= 8'b11000100;
			 8'b01101001: data_out2 <= 8'b11000010;
			 8'b01101010: data_out2 <= 8'b10111111;
			 8'b01101011: data_out2 <= 8'b10111100;
			 8'b01101100: data_out2 <= 8'b10111010;
			 8'b01101101: data_out2 <= 8'b10110111;
			 8'b01101110: data_out2 <= 8'b10110100;
			 8'b01101111: data_out2 <= 8'b10110001;
			 8'b01110000: data_out2 <= 8'b10101110;
			 8'b01110001: data_out2 <= 8'b10101011;
			 8'b01110010: data_out2 <= 8'b10101000;
			 8'b01110011: data_out2 <= 8'b10100110;
			 8'b01110100: data_out2 <= 8'b10100011;
			 8'b01110101: data_out2 <= 8'b10011111;
			 8'b01110110: data_out2 <= 8'b10011100;
			 8'b01110111: data_out2 <= 8'b10011001;
			 8'b01111000: data_out2 <= 8'b10010110;
			 8'b01111001: data_out2 <= 8'b10010011;
			 8'b01111010: data_out2 <= 8'b10010000;
			 8'b01111011: data_out2 <= 8'b10001101;
			 8'b01111100: data_out2 <= 8'b10001010;
			 8'b01111101: data_out2 <= 8'b10000111;
			 8'b01111110: data_out2 <= 8'b10000100;
			 8'b01111111: data_out2 <= 8'b10000001;
			 8'b10000000: data_out2 <= 8'b01111101;
			 8'b10000001: data_out2 <= 8'b01111010;
			 8'b10000010: data_out2 <= 8'b01110111;
			 8'b10000011: data_out2 <= 8'b01110100;
			 8'b10000100: data_out2 <= 8'b01110001;
			 8'b10000101: data_out2 <= 8'b01101110;
			 8'b10000110: data_out2 <= 8'b01101011;
			 8'b10000111: data_out2 <= 8'b01101000;
			 8'b10001000: data_out2 <= 8'b01100101;
			 8'b10001001: data_out2 <= 8'b01100010;
			 8'b10001010: data_out2 <= 8'b01011111;
			 8'b10001011: data_out2 <= 8'b01011011;
			 8'b10001100: data_out2 <= 8'b01011000;
			 8'b10001101: data_out2 <= 8'b01010110;
			 8'b10001110: data_out2 <= 8'b01010011;
			 8'b10001111: data_out2 <= 8'b01010000;
			 8'b10010000: data_out2 <= 8'b01001101;
			 8'b10010001: data_out2 <= 8'b01001010;
			 8'b10010010: data_out2 <= 8'b01000111;
			 8'b10010011: data_out2 <= 8'b01000100;
			 8'b10010100: data_out2 <= 8'b01000010;
			 8'b10010101: data_out2 <= 8'b00111111;
			 8'b10010110: data_out2 <= 8'b00111100;
			 8'b10010111: data_out2 <= 8'b00111010;
			 8'b10011000: data_out2 <= 8'b00110111;
			 8'b10011001: data_out2 <= 8'b00110100;
			 8'b10011010: data_out2 <= 8'b00110010;
			 8'b10011011: data_out2 <= 8'b00101111;
			 8'b10011100: data_out2 <= 8'b00101101;
			 8'b10011101: data_out2 <= 8'b00101011;
			 8'b10011110: data_out2 <= 8'b00101000;
			 8'b10011111: data_out2 <= 8'b00100110;
			 8'b10100000: data_out2 <= 8'b00100100;
			 8'b10100001: data_out2 <= 8'b00100010;
			 8'b10100010: data_out2 <= 8'b00100000;
			 8'b10100011: data_out2 <= 8'b00011110;
			 8'b10100100: data_out2 <= 8'b00011100;
			 8'b10100101: data_out2 <= 8'b00011010;
			 8'b10100110: data_out2 <= 8'b00011000;
			 8'b10100111: data_out2 <= 8'b00010110;
			 8'b10101000: data_out2 <= 8'b00010100;
			 8'b10101001: data_out2 <= 8'b00010011;
			 8'b10101010: data_out2 <= 8'b00010001;
			 8'b10101011: data_out2 <= 8'b00001111;
			 8'b10101100: data_out2 <= 8'b00001110;
			 8'b10101101: data_out2 <= 8'b00001101;
			 8'b10101110: data_out2 <= 8'b00001011;
			 8'b10101111: data_out2 <= 8'b00001010;
			 8'b10110000: data_out2 <= 8'b00001001;
			 8'b10110001: data_out2 <= 8'b00001000;
			 8'b10110010: data_out2 <= 8'b00000111;
			 8'b10110011: data_out2 <= 8'b00000110;
			 8'b10110100: data_out2 <= 8'b00000101;
			 8'b10110101: data_out2 <= 8'b00000100;
			 8'b10110110: data_out2 <= 8'b00000011;
			 8'b10110111: data_out2 <= 8'b00000011;
			 8'b10111000: data_out2 <= 8'b00000010;
			 8'b10111001: data_out2 <= 8'b00000010;
			 8'b10111010: data_out2 <= 8'b00000001;
			 8'b10111011: data_out2 <= 8'b00000001;
			 8'b10111100: data_out2 <= 8'b00000000;
			 8'b10111101: data_out2 <= 8'b00000000;
			 8'b10111110: data_out2 <= 8'b00000000;
			 8'b10111111: data_out2 <= 8'b00000000;
			 8'b11000000: data_out2 <= 8'b00000000;
			 8'b11000001: data_out2 <= 8'b00000000;
			 8'b11000010: data_out2 <= 8'b00000000;
			 8'b11000011: data_out2 <= 8'b00000001;
			 8'b11000100: data_out2 <= 8'b00000001;
			 8'b11000101: data_out2 <= 8'b00000001;
			 8'b11000110: data_out2 <= 8'b00000010;
			 8'b11000111: data_out2 <= 8'b00000010;
			 8'b11001000: data_out2 <= 8'b00000011;
			 8'b11001001: data_out2 <= 8'b00000100;
			 8'b11001010: data_out2 <= 8'b00000100;
			 8'b11001011: data_out2 <= 8'b00000101;
			 8'b11001100: data_out2 <= 8'b00000110;
			 8'b11001101: data_out2 <= 8'b00000111;
			 8'b11001110: data_out2 <= 8'b00001000;
			 8'b11001111: data_out2 <= 8'b00001001;
			 8'b11010000: data_out2 <= 8'b00001011;
			 8'b11010001: data_out2 <= 8'b00001100;
			 8'b11010010: data_out2 <= 8'b00001101;
			 8'b11010011: data_out2 <= 8'b00001111;
			 8'b11010100: data_out2 <= 8'b00010000;
			 8'b11010101: data_out2 <= 8'b00010010;
			 8'b11010110: data_out2 <= 8'b00010011;
			 8'b11010111: data_out2 <= 8'b00010101;
			 8'b11011000: data_out2 <= 8'b00010111;
			 8'b11011001: data_out2 <= 8'b00011001;
			 8'b11011010: data_out2 <= 8'b00011011;
			 8'b11011011: data_out2 <= 8'b00011101;
			 8'b11011100: data_out2 <= 8'b00011111;
			 8'b11011101: data_out2 <= 8'b00100001;
			 8'b11011110: data_out2 <= 8'b00100011;
			 8'b11011111: data_out2 <= 8'b00100101;
			 8'b11100000: data_out2 <= 8'b00100111;
			 8'b11100001: data_out2 <= 8'b00101001;
			 8'b11100010: data_out2 <= 8'b00101100;
			 8'b11100011: data_out2 <= 8'b00101110;
			 8'b11100100: data_out2 <= 8'b00110001;
			 8'b11100101: data_out2 <= 8'b00110011;
			 8'b11100110: data_out2 <= 8'b00110110;
			 8'b11100111: data_out2 <= 8'b00111000;
			 8'b11101000: data_out2 <= 8'b00111011;
			 8'b11101001: data_out2 <= 8'b00111101;
			 8'b11101010: data_out2 <= 8'b01000000;
			 8'b11101011: data_out2 <= 8'b01000011;
			 8'b11101100: data_out2 <= 8'b01000110;
			 8'b11101101: data_out2 <= 8'b01001001;
			 8'b11101110: data_out2 <= 8'b01001011;
			 8'b11101111: data_out2 <= 8'b01001110;
			 8'b11110000: data_out2 <= 8'b01010001;
			 8'b11110001: data_out2 <= 8'b01010100;
			 8'b11110010: data_out2 <= 8'b01010111;
			 8'b11110011: data_out2 <= 8'b01011010;
			 8'b11110100: data_out2 <= 8'b01011101;
			 8'b11110101: data_out2 <= 8'b01100000;
			 8'b11110110: data_out2 <= 8'b01100011;
			 8'b11110111: data_out2 <= 8'b01100110;
			 8'b11111000: data_out2 <= 8'b01101001;
			 8'b11111001: data_out2 <= 8'b01101100;
			 8'b11111010: data_out2 <= 8'b01101111;
			 8'b11111011: data_out2 <= 8'b01110011;
			 8'b11111100: data_out2 <= 8'b01110110;
			 8'b11111101: data_out2 <= 8'b01111001;
			 8'b11111110: data_out2 <= 8'b01111100;
			default: data_out2 <= data_out2;
	  endcase
end	

/*always@(posedge clk_out_0, negedge reset_n)begin
	if(reset_n == 1'b0)
		data_out2 <= 8'd0;
	else if(slwr_n == 1'b0)
		data_out2 <= data_out2 + 8'd1;
end*/






endmodule
