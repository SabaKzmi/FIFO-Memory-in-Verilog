module FIFOram (dataOut, reset, write, read, dataIn, clk);
	input 	reset, write, read, clk;
	input 	[15:0] dataIn;
	output 	[15:0] dataOut;
	reg 	[15:0] dataOut;
	reg 	empty = 1;
	reg		full  = 0;
	reg 	[15:0]memory[0:7];
	// T0 -> 00   T1 -> 01  T2 -> 10
	reg [1:0] state, nextState;
	reg [2:0] wrIndx, rdIndx;
	
	always @(posedge clk) 
		state <= nextState;

	always @ (*)
	begin
		case (state)
			2'b00: begin
					if (reset == 1'b1) nextState = 2'b01;
					else if (write == 1'b0) 
						begin
							if (read == 1'b0) nextState = 2'b00;
							else if (empty == 1'b1) nextState = 2'b00;
							else 
								begin
									dataOut   = memory[rdIndx];
									rdIndx    = rdIndx + 1;
									nextState = 2'b11;
								end
							
						end
					else
						begin
							if (full == 1'b1) nextState = 2'b00;
							else
								begin
									memory[wrIndx] = dataIn;
									wrIndx         = wrIndx + 1;
									nextState = 2'b10;
								end
						end
				   end
			2'b01: begin
					empty  = 1'b1;
					full   = 1'b0;
					wrIndx = 1'b0;
					rdIndx = 1'b0;
					nextState = 2'b00;
				   end
			2'b10: begin
					empty = 1'b0;
					if (wrIndx == rdIndx)
						begin
							full = 1'b1;
							nextState = 2'b00;
						end
					else
						begin
							nextState = 2'b00;
						end
				   end
			2'b11: begin
					full = 1'b0;
					if (wrIndx == rdIndx)
						begin
							empty = 1'b1;
							nextState = 2'b00;
						end
					else
						begin
							nextState = 2'b00;
						end
				   end
			default: nextState = 2'b00;
		endcase
	end	
endmodule
