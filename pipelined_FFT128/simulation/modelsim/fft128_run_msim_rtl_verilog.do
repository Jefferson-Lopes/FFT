transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128/WROM128.v}
vlog -sv -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128/rotator128_v.v}
vlog -sv -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128/ram2x128.v}
vlog -sv -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128/mpuc924_383.v}
vlog -sv -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128/mpuc707.v}
vlog -sv -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128/mpuc541.v}
vlog -sv -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128/mpuc1307.v}
vlog -sv -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128/fft8_3.v}
vlog -sv -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128/fft16.v}
vlog -sv -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128/fft128.v}
vlog -sv -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128/cnorm_2.v}
vlog -sv -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128/cnorm_1.v}
vlog -sv -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128/bufram128c_2.v}
vlog -sv -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128/bufram128c_1.v}
vlog -sv -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128/bufram128c.v}

vlog -sv -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128/FFT128_tb.v}
vlog -sv -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT128/Wave_ROM128.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  FFT128_tb

add wave *
view structure
view signals
run -all