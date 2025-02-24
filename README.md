# FIFO Memory in Verilog
This Verilog project features a First-In-First-Out (FIFO) memory block with 8 memory locations, each 16 bits wide. The FIFO includes control inputs for Reset, Write, and Read, along with flag outputs for Empty and Full. 
Address management for read and write operations is handled by counters (rdIndex and wrIndex). The design uses behavioral modeling and is simulated in ModelSim.
## ASM Chart
State transitions and control logic for the FIFO design.
<p align="center">
  <img src="https://github.com/SabaKzmi/FIFO-Memory-in-Verilog/blob/17023b523a04c527403415c3b1a21fc816919a3f/pictures/ASM-chart.png" alt="ASM chart" width="500"/>
</p>

## How to Use
1. Prepare: Save the Verilog files.
2. Project Setup: Create a project in ModelSim and add the files.
3. Compile: Compile all files.
4. Simulate: Run the tbFIFOram.v test bench module to simulate the memory's functionality and observe the results.
## Results
Here are the results from the uploaded test bench.
<p align="center">
  <img src="https://github.com/SabaKzmi/FIFO-Memory-in-Verilog/blob/17023b523a04c527403415c3b1a21fc816919a3f/pictures/result.jpg" alt="res" />
</p>
<p align="center">
  <img src="https://github.com/SabaKzmi/FIFO-Memory-in-Verilog/blob/17023b523a04c527403415c3b1a21fc816919a3f/pictures/waveform.jpg" alt="waveform" />
</p>
