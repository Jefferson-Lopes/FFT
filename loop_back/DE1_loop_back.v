//
// loop_back exemplo, modificado de adc.v
//
// modificado - 06/2021
//

//
// Forma de onda enviada pelo host pelo EP2 fica armazenada
// em um bloco de mem de 512 bytes.
// Essa forma de onda eh devolvida para o host pelo EP6
//
// O EP1 serve como canal auxiliar -- aqui usado como sinal de reset 
// que vem pelo pino FX2_PA0 (ver o firmware slave_fifo.c e os scripts fpga_*.py)
//

module DE1_loop_back(
	input FX2_CLK,
	inout [7:0] FX2_FD,
	input [2:0] FX2_flags, // FIFO 2,4 Empty e FIFO 6 Full
	output FX2_SLRD, FX2_SLWR,

	input FX2_PA_0,  // sinal de reset via EP1 (firmware)
	input FX2_PA_1,  // pode ser usado para sincronismo adicional
	output FX2_PA_2, // FIFO_DATAIN_OE
	output FX2_PA_3, // high
	output FX2_PA_4, // FIFO_addr[0]
	output FX2_PA_5, // FIFO_addr[1]
	output FX2_PA_6, // FIFO_PKTEND
	input FX2_PA_7   // FIFO8_full
	
	// fpga passive serial loader (saxo_loader)
	//output FX2_PD1, // CONF_DONE (fpga-2-usb)
	//input FX2_PD2, 	// nCONFIG (usb-2-fpga / reset)
	
	// board debug IO - placa angilberto -- comentar para DE1.
	//input  [1:0] KEY,
	//output [7:0] LED	
	
	// board debug IO -- placa SAXO
	//output LED	
);

//wire CONF_DONE = FX2_PD1;
//wire nCONFIG = FX2_PD2;

// sinal de reset enviado pelo firmware quando recebe um byte pelo EP1 (ver fx2 firmware e fpga_*.py)
wire reset = FX2_PA_0;//~reset;//~KEY[0];
//wire reset = 1'b0;

////////////////////////////////////////////////////////////////////////////////
// Rename "FX2" ports into "FIFO" ports, to give them more meaningful names
// FX2 USB signals are active low, take care of them now
// Note: You probably don't need to change anything in this section

// FX2 outputs
wire FIFO_CLK = FX2_CLK;

wire FIFO2_empty = ~FX2_flags[0];	wire FIFO2_data_available = ~FIFO2_empty;
wire FIFO4_empty = ~FX2_flags[1];	wire FIFO4_data_available = ~FIFO4_empty;
wire FIFO6_full = ~FX2_flags[2];	wire FIFO6_ready_to_accept_data = ~FIFO6_full;
wire FIFO8_full = ~FX2_PA_7;		wire FIFO8_ready_to_accept_data = ~FIFO8_full;
//assign FX2_PA_0 = 1'b1;
//assign FX2_PA_1 = 1'b1;
assign FX2_PA_3 = 1'b1;

// FX2 inputs
wire FIFO_RD, FIFO_WR, FIFO_PKTEND, FIFO_DATAIN_OE, FIFO_DATAOUT_OE;
assign FX2_SLRD = ~FIFO_RD;
assign FX2_SLWR = ~FIFO_WR;
assign FX2_PA_2 = ~FIFO_DATAIN_OE;
assign FX2_PA_6 = ~FIFO_PKTEND;

wire [1:0] FIFO_FIFOADR;
assign {FX2_PA_5, FX2_PA_4} = FIFO_FIFOADR;

// FX2 bidirectional data bus
wire [7:0] FIFO_DATAIN = FX2_FD;
wire [7:0] FIFO_DATAOUT;
assign FX2_FD = FIFO_DATAOUT_OE ? FIFO_DATAOUT : 8'hZZ;

////////////////////////////////////////////////////////////////////////////////
// So now everything is in positive logic
//	FIFO_RD, FIFO_WR, FIFO_DATAIN, FIFO_DATAOUT, FIFO_DATAIN_OE, FIFO_DATAOUT_OE, FIFO_PKTEND, FIFO_FIFOADR
//	FIFO2_empty, FIFO2_data_available
//	FIFO4_empty, FIFO4_data_available
//	FIFO6_full, FIFO6_ready_to_accept_data
//	FIFO8_full, FIFO8_ready_to_accept_data

////////////////////////////////////////////////////////////////////////////////
// Here we wait until we receive some data
	
reg [2:0] state = 3'b000;

always @(posedge FIFO_CLK)
if (reset) state <= 3'b000;
else
case(state)
	3'b000: if( FIFO2_data_available) state <= 3'b001; else state <= 3'b010; // wait for data packet in FIFO2
	3'b001: if(FIFO2_empty) state <= 3'b010; else state <= 3'b000;  // wait until end of data packet
	3'b010: if(FIFO6_ready_to_accept_data) state <= 3'b110; else state <= 3'b000; // turnaround cycle, switch to FIFO6
	3'b011: state <= 3'b100;  // write data (I high byte)
	3'b100: state <= 3'b101;  // write data (I low byte)
	3'b101: state <= 3'b110;  // write data (Q high byte)
	3'b110: state <= 3'b111;  // write data (Q low byte)	
	3'b111: state <= 3'b010;  // end packet
	default: state <= 3'b000;
endcase

assign FIFO_FIFOADR = {~((state == 3'b000) | (state == 3'b001)), 1'b0}; //{state[2], 1'b0};  // FIFO2 or FIFO6
assign FIFO_RD = (state==3'b001);

wire read_byte = (state==3'b001) & FIFO2_data_available;
wire write_I_high = (state == 3'b011) & FIFO6_ready_to_accept_data;
wire write_I_low = (state == 3'b100) & FIFO6_ready_to_accept_data;
wire write_Q_high = (state == 3'b101) & FIFO6_ready_to_accept_data;
wire write_Q_low = (state == 3'b110) & FIFO6_ready_to_accept_data;
wire write_byte = (write_I_high | write_I_low | write_Q_high | write_Q_low);	

// debug
reg [7:0] rst_counter;
always @(posedge reset) rst_counter <= rst_counter + 8'd1;

////////////////////////
// esse modulo (osc) serve para gerar um sinal sinoidal, mas nao estah sendo usado...
////////////////////////
/**/
wire [7:0] sine_w;
wire [7:0] cos_w;

//module sine_cos(clk, reset, en, sine, cos);
sine_cos osc(.clk(FIFO_CLK), .reset(1'b0), .en(write_byte), .sine(sine_w), .cos(cos_w));
/**/
////////////////////////

// now write the data back
//assign FIFO_DATAOUT = (write_I_high) ? IQ[31:24] : (write_I_low) ? IQ[23:16] : (write_Q_high) ? IQ[15:8] : IQ[7:0];
assign FIFO_DATAOUT = sig_out; // sinal que foi enviado pelo host e foi armazenado no buffer (dpram)
//assign FIFO_DATAOUT = (~rdaddress[0])?{7'b0,rdaddress[8]}:rdaddress[7:0]; // sinal equivalente a uma rampa -- bom para testar o setup
//assign FIFO_DATAOUT = uut_out; // sinal do host depois de processado por alguma funcao qualquer...
assign FIFO_WR = write_byte;
assign FIFO_PKTEND = 1'b0;
assign FIFO_DATAIN_OE = ~(state[2] | state[1]);
assign FIFO_DATAOUT_OE = write_byte; 

reg [7:0] data_register = 8'h00;

// debug
always @(posedge FIFO_CLK) 
//if (reset) data_register <= 8'd0;
//else 
	if (read_byte) data_register <= FIFO_DATAIN;

//////////////////
/* */
reg [8:0] wraddress = 0;
reg [8:0] rdaddress = 0;

always @(negedge read_byte) 
//if (reset) wraddress <= 9'd0;
//else 
	wraddress <= wraddress + 9'd1;

always @(negedge write_byte) 
//if (reset) rdaddress <= 9'd0;
//else 
	rdaddress <= rdaddress + 9'd1;

wire [7:0] test_data = (~wraddress[0])?{7'b0,wraddress[8]}:wraddress[7:0];

wire [7:0] sig_out;

// Pseudo-dual-port RAM
//   dpram #(.depth(10),.width(width),.size(1024))
//         fifo_ram (.wclk(wrclk),.wdata(data),.waddr(write_addr),.wen(write),
//		   .rclk(rdclk), .rdata(q),.raddr(read_addr) );
/**/   
dpram #(.depth(9),.width(8),.size(512))
	ram_signal(
		.wclk(FIFO_CLK), .wdata(FIFO_DATAIN), .waddr(wraddress), .wen(read_byte), 
		//.wclk(FIFO_CLK), .wdata(test_data), .waddr(wraddress), .wen(read_byte), 
		.rclk(FIFO_CLK), .rdata(sig_out), .raddr(rdaddress), .ren(write_byte)//.ren(1'b1)
	);
/* */

//assign LED[7:0] = {LED_7, reset, 1'b0, rst_counter[4:0]}; // debug - placa angilberto
//assign LED = LED_7; // debug -- placa SAXO 

wire [7:0] uut_out;

//uut myuut(.clk(FIFO_CLK), .en(rdaddress[0]), .in(sig_out), .out(uut_out));

reg LED_7;
wire slow_clock;

 Clock_divider #(16000000) slow_clock_div (
  .clock_in(FIFO_CLK), 
  .clock_out(slow_clock)
 );
 
 always @(posedge slow_clock) LED_7 <= ~LED_7;
 
 //assign uut_out = ((|sig_out[7:6]) & (~rdaddress[0]) & (~rdaddress[1]))?{2'b01,sig_out[5:0]}:sig_out;
 //assign uut_out = ((~rdaddress[0]) & (~rdaddress[1]))?8'd0:sig_out;
 assign uut_out = sig_out;
 
endmodule

//////////////////////////////////////////////////////////////////////////
/*
module uut(
	input clk,
	input en,
	input [7:0] in,
	output [7:0] out	
);

reg [7:0] out_r;

always @(posedge clk)
if (~en) 
	out_r <= (&in[7:4])?{4'b0001,in[3:0]}:in;
else out_r <= in;

assign out = out_r;

assign out = ((&in[7:4]) & (write_byte))?{4'b0001,in[3:0]}:in;


endmodule

*/

////////////////////////////////////////////////////////////////////////////

module dpram(wclk,wdata,waddr,wen,rclk,rdata,raddr,ren);
   parameter depth = 4;
   parameter width = 16;
   parameter size = 16;
   
   input wclk;
   input [width-1:0] wdata;
   input [depth-1:0] waddr;
   input 	     wen;
   input 	     ren;
	
   input rclk;
   output reg [width-1:0] rdata;
	//output [width-1:0] rdata;
   input [depth-1:0]  raddr;
   
   reg [width-1:0]    ram [0:size-1];
   
   always @(posedge wclk)
     if(wen)
       ram[waddr] <= #1 wdata;
/* */  
   always @(posedge rclk)
		if(ren)
     rdata <= #1 ram[raddr];
/* */
	//assign rdata = ram[raddr];
	
endmodule // dpram

////////////////////////////////////////////////////////////////////////////////////

module sine_cos(clk, reset, en, sine, cos);
   input clk, reset, en;
   output [7:0] sine,cos;
   
   reg [7:0] sine_r = 8'd0;
   reg [7:0] cos_r = 8'd120;
   
   assign      sine = sine_r + {cos_r[7], cos_r[7], cos_r[7], cos_r[7:3]};
   assign      cos  = cos_r - {sine[7], sine[7], sine[7], sine[7:3]};
   
   always@(posedge clk or posedge reset)
     begin
         if (reset) begin
             sine_r <= 0;
             cos_r <= 120;
         end else begin
             if (en) begin
                 sine_r <= sine;
                 cos_r <= cos;
             end
         end
     end
     
endmodule // sine_cos

/////////////////////////////////////////////////////////////////////////////////////////////
//
// https://www.edaboard.com/threads/how-to-create-a-sine-wave-with-verilog.39599/
//
//It's a second order difference equation acting as an oscillator with zero dampening.
//
//Code:
//
//sin(n) = sin(n-1) + a*cos(n-1)
//cos(n) = cos(n-1) - a*sin(n-1)
//
//In the present case, a is 1/8. It can be basically changed to higher magnitude resolution 
//and lower frequency (=higher phase resolution), but depending on truncation effects, it 
//possibly won't give an exactly periodic output for all a values. I fear, you get a decaying 
//oscillation for some a codings. A correction term (of course disturbing the ingenious simple 
//original design look) could help. Just try.
//
//As the design is effectively rotating a complex vector, it's also related to CORDIC.
//
//////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////

// fpga4student.com: FPGA projects, VHDL projects, Verilog projects
// Verilog project: Verilog code for clock divider on FPGA
// 
module Clock_divider  #(parameter DIVISOR = 28'd48000000)(clock_in,clock_out);

	input clock_in; // input clock on FPGA
	output reg clock_out; // output clock after dividing the input clock by divisor
	
	reg[27:0] counter=28'd0;

	always @(posedge clock_in)
	begin
		counter <= counter + 28'd1;
		if(counter>=(DIVISOR-1))
			counter <= 28'd0;
		clock_out <= (counter<DIVISOR/2)?1'b1:1'b0;
	end
	
endmodule

/////////////////////////////////////////////////////////////////////////////////////

// Slow clock enable for debouncing button 
module clock_enable(input clk,output slow_clk_en);

    reg [26:0]counter=0;
    always @(posedge clk)
    begin
       counter <= (counter>=249999)?27'd0:counter+27'd1;
    end
    assign slow_clk_en = (counter == 249999)?1'b1:1'b0;
	
endmodule

////////////////////////////////////////////////////////////////////////////////////

module debouncer(input clk, input pb_1, output pb_out);

	wire slow_clk_en;
	wire Q1,Q2,Q2_bar,Q0;
	
	clock_enable u1(clk,slow_clk_en);
	
	my_dff_en d0(clk,slow_clk_en,pb_1,Q0);
	my_dff_en d1(clk,slow_clk_en,Q0,Q1);
	my_dff_en d2(clk,slow_clk_en,Q1,Q2);
	
	assign Q2_bar = ~Q2;
	assign pb_out = Q1 & Q2_bar;
	
endmodule

///////////////////////////////////////////////////////////////////////////////////

// D-flip-flop with clock enable signal for debouncing module 
module my_dff_en(input clk, clock_enable,D, output reg Q=0);

    always @ (posedge clk) 
	begin
		if(clock_enable==1) 
           Q <= D;
    end
	
endmodule 

//////////////////////////////////////////////////////////////////////////////////


