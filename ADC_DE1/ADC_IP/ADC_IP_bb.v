
module ADC_IP (
	CLOCK,
	ADC_SCLK,
	ADC_CS_N,
	ADC_DOUT,
	ADC_DIN,
	CH0,
	CH1,
	CH2,
	CH3,
	CH4,
	CH5,
	CH6,
	CH7,
	RESET);	

	input		CLOCK;
	output		ADC_SCLK;
	output		ADC_CS_N;
	input		ADC_DOUT;
	output		ADC_DIN;
	output	[11:0]	CH0;
	output	[11:0]	CH1;
	output	[11:0]	CH2;
	output	[11:0]	CH3;
	output	[11:0]	CH4;
	output	[11:0]	CH5;
	output	[11:0]	CH6;
	output	[11:0]	CH7;
	input		RESET;
endmodule
