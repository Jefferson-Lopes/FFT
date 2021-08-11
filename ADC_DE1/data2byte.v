module slave_fifo(input
						output reg slwrReg, );
						

always@( negedge clk )
	begin
	
		if( !reset ) slwrReg <= 1'b1;
		else if ( fifoadrRegBuf2 == 2'b10 )
			begin
			
				if( fifoAdrRegBuf2 == 2'b10 && full == 1'b1 )
					slwrReg <= ~slwrReg;
			
			end
				else
					slwrReg <= 1'b1;
	
	end
		
always@(negedge clk)
	begin
		if(!reset) FDout <= 16'h0000;
			else
				begin
					if(fifoAdrReg == 2'b10 && full == 1'b1 && slwrReg == 1'b0)
						FDout <= indata;
				end
	end
		
		
		
endmodule						
						