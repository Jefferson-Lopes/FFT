//----------------------------------------------------------------------
//	TB: FftTop Testbench
//----------------------------------------------------------------------

`timescale	1ns/1ns

module TB64;

	reg 			clock;
	reg 	 		reset;
	reg 	 		di_en;
	reg  [15:0]	di_re;
	reg  [15:0]	di_im;
	wire	 		do_en;
	wire [15:0]	do_re;
	wire [15:0]	do_im;
	
	reg  [15:0]	omem[0:127];


	//----------------------------------------------------------------------
	//	Clock and Reset
	//----------------------------------------------------------------------
	always begin
		clock = 0; #10;
		clock = 1; #10;
	end

	initial begin
		reset = 0; #20;
		reset = 1; #100;
		reset = 0;
	end

	
	//----------------------------------------------------------------------
	//	Functional Blocks
	//----------------------------------------------------------------------

	//	Data enable
	initial begin
		di_en = 0; #170;
		di_en = 1;
	end
	
	// Input data
	initial begin
		di_re <= 16'hF;
		di_im <= 16'h0;
	end
	
	//	Output Data Capture
	initial begin : OCAP
		integer 	n;
		forever begin
			n = 0;
			while (do_en !== 1) 
				@(negedge clock);
			while ((do_en == 1) && (n < 64)) begin
				omem[2*n  ] = do_re;
				omem[2*n+1] = do_im;
				n = n + 1;
				@(negedge clock);
			end
		end
	end


	//----------------------------------------------------------------------
	//	Ending condition
	//----------------------------------------------------------------------
	initial begin 
		#3000;
		$stop;
	end

	
	//----------------------------------------------------------------------
	//	Tasks
	//----------------------------------------------------------------------
	task SaveOutputData;
		input[80*8:1]	filename;
		integer 		fp, n, m;
	begin
		fp = $fopen(filename);
		m = 0;
		for (n = 0; n < 64; n = n + 1) begin
			m[5] = n[0];
			m[4] = n[1];
			m[3] = n[2];
			m[2] = n[3];
			m[1] = n[4];
			m[0] = n[5];
			$fdisplay(fp, "%h  %h  // %d", omem[2*m], omem[2*m+1], n[5:0]);
		end
		$fclose(fp);
	end
	endtask
	
	
	//----------------------------------------------------------------------
	//	Data Logger
	//----------------------------------------------------------------------
	initial begin : DATALOGGER
		wait (do_en == 1);
		repeat(64) @(posedge clock);
		SaveOutputData("output1.txt");
		@(negedge clock);
	end


	//----------------------------------------------------------------------
	//	Module Instances
	//----------------------------------------------------------------------
	FFT64 FFT (
		.clock	(clock),	//	in
		.reset	(reset),	//	in
		.di_en	(di_en),	//	in
		.di_re	(di_re),	//	in
		.di_im	(di_im),	//	in
		.do_en	(do_en),	//	out
		.do_re	(do_re),	//	out
		.do_im	(do_im)	//	out
	);

endmodule
