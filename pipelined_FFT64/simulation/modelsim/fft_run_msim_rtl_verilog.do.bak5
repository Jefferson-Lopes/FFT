transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64/USFFT64_2B_tb.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64/USFFT64_2B.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64/WROM64.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64/rotator64_v.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64/ram2x64c_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64/fft8.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64/cnorm.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64/bufram64c1.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64/mpu707.v}

vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64/USFFT64_2B_tb.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64 {C:/Users/Jeff/Documents/GitHub/FFT/pipelined_FFT64/sin_tst_rom.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  USFFT64_2B_tb

add wave *
view structure
view signals
run -all
