module tbFIFOram;
    reg reset, write, read, clk;
    reg [15:0] dataIn;
    wire [15:0] dataOut;

    FIFOram uut (dataOut, reset, write, read, dataIn, clk);

    //clk
    initial 
	begin
        clk = 0; 
    end
	always #5 clk = ~clk;
	
    initial 
	begin
        $monitor("reset=%b, write=%b, read=%b, dataIn=%h, dataOut=%h",
                 reset, write, read, dataIn, dataOut);

        reset = 1; write = 0; read = 0; dataIn = 16'h0000; #20;
        reset = 0;

        #10 write = 1; dataIn = 16'hAAAA; #10 write = 0;
        #10 write = 1; dataIn = 16'hBBBB; #10 write = 0;
        #10 write = 1; dataIn = 16'hCCCC; #10 write = 0;

        #10 read = 1; #10 read = 0;
        #10 read = 1; #10 read = 0;
        #10 read = 1; #10 read = 0;

        #10 $stop;
    end
endmodule
