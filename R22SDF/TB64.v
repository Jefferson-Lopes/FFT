//----------------------------------------------------------------------
//	TB: FftTop Testbench
//----------------------------------------------------------------------

`timescale	1ns/1ns

module TB64;

	reg 			clock;
	reg 	 		reset;
	reg 	 		di_en;	//enable input data
	reg  [15:0]	di_re;
	reg  [15:0]	di_im;
	reg  [15:0]	tx_re;	//real data from .txt file
	reg  [15:0]	tx_im;
	wire	 		do_en;
	wire [15:0]	do_re;
	wire [15:0]	do_im;
	
	integer  input_file;
	integer output_file;

	//----------------------------------------------------------------------
	//	Initial settings
	//----------------------------------------------------------------------
	always begin
		clock <= 0; #10;
		clock <= 1; #10;
	end

	initial begin
		reset <= 1; #100;
		reset <= 0;
	end

	initial begin
		di_en <= 0; #100;
		di_en <= 1;
	end
	
	
	//----------------------------------------------------------------------
	//	Read and Write
	//----------------------------------------------------------------------
	initial begin
		input_file  = $fopen( "input.txt", "r");
		output_file = $fopen("output.txt", "w");
		
		if (input_file && output_file) 
			$display("Files were opened successfully");
		else begin
			$display("Files were NOT opened successfully");
			#10; $stop;
		end
	end
	
	//Read
	always @ (negedge clock) begin
		if (di_en && !reset) begin
			$fscanf(input_file, "%d\n", tx_re);
			$fscanf(input_file, "%d\n", tx_im);
			
			if ($feof(input_file))
				di_en <= 1'b0;
			else begin
				di_re <= tx_re;
				di_im <= tx_im;
			end
		end
	end
	
	//write
	always @ (posedge clock) begin
		if (do_en) begin
			$fdisplay(output_file, "%b", do_re);
			$fdisplay(output_file, "%b", do_im);
		end
	end


	//----------------------------------------------------------------------
	//	Ending condition
	//----------------------------------------------------------------------
	always @ (negedge do_en) begin
		if (!reset) begin
			$fclose( input_file);
			$fclose(output_file);
			#10; $stop;
		end
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
