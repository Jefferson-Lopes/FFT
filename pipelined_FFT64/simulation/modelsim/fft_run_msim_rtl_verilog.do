transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Desktop/fft {C:/Users/Jeff/Desktop/fft/USFFT64_2B_tb.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Desktop/fft {C:/Users/Jeff/Desktop/fft/USFFT64_2B.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Desktop/fft {C:/Users/Jeff/Desktop/fft/WROM64.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Desktop/fft {C:/Users/Jeff/Desktop/fft/rotator64_v.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Desktop/fft {C:/Users/Jeff/Desktop/fft/ram2x64c_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Desktop/fft {C:/Users/Jeff/Desktop/fft/fft8.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Desktop/fft {C:/Users/Jeff/Desktop/fft/cnorm.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Desktop/fft {C:/Users/Jeff/Desktop/fft/bufram64c1.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Desktop/fft {C:/Users/Jeff/Desktop/fft/mpu707.v}

vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Desktop/fft {C:/Users/Jeff/Desktop/fft/USFFT64_2B_tb.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jeff/Desktop/fft {C:/Users/Jeff/Desktop/fft/sin_tst_rom.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  USFFT64_2B_tb

add wave *
view structure
view signals
run -all
