
module adc (
	CLOCK,
	RESET,
	CH0,
	CH1,
	CH2,
	CH3,
	CH4,
	CH5,
	CH6,
	CH7,
	ADC_SCLK,
	ADC_CS_N,
	ADC_DOUT,
	ADC_DIN);	

	input		CLOCK;
	input		RESET;
	output	[11:0]	CH0;
	output	[11:0]	CH1;
	output	[11:0]	CH2;
	output	[11:0]	CH3;
	output	[11:0]	CH4;
	output	[11:0]	CH5;
	output	[11:0]	CH6;
	output	[11:0]	CH7;
	output		ADC_SCLK;
	output		ADC_CS_N;
	input		ADC_DOUT;
	output		ADC_DIN;
endmodule
