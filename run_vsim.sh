#!/bin/bash

vsim_exec=$1

#OBS: you need to add vsim to your PATH

#change to the executable file directory
cd R22SDF/simulation/modelsim

if [ $# -eq 0 ]; then #if there are no parameters
    #command summary: run the simulation and then quit
	#-c: run vsim without GUI
	#-nostdout: reduce the output
	#-do: run the following instruction direct into vsim
	#"do .do ; quit -f": run the .do file and then force quit
	vsim -c -nostdout -do "do FFT_run_msim_rtl_verilog.do ; quit -f"
else
	vsim -c -nostdout -do "do ${vsim_exec} ; quit -f"
fi
