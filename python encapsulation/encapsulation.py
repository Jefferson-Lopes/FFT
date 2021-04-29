import numpy as np
import matplotlib.pyplot as plt
from math import pi
from waves import waves
from dump_file import dump_file
from load_file import load_file
from make_output import make_output
from bin2decimal import bin2decimal
from reverse_bits import reverse_bits

##############################
## generate a signal input ##
############################
TIME = np.arange(0, 8, .125)  #64 points
di_re = waves(freq=[1, 0.25], amp=512)
di_im = waves(freq=[1], amp=0)


############################
## dump into a text file ##
##########################
dump_path = 'R22SDF/simulation/modelsim/input.txt'
dump_file(dump_path, di_re, di_im)

clone_dump_path = 'python encapsulation/input_clone.txt'
dump_file(clone_dump_path, di_re, di_im)


############################################
## process the data in verilog testbench ##
##########################################

##for testing
# if make_output():
#     print('Problem to open the file')
# else:
#     print('File generated successfully!')

print('The input file was generated.')
print('Please run the Verilog testbench then press enter.')
input('Press enter. . .')


##################################
## process the data with NumPy ##
################################
comp = di_re + di_im*1j     #numpy complex array

fft_np = np.fft.fft(comp)   


######################
## load the result ##
####################
load_path = 'R22SDF/simulation/modelsim/output.txt'
do_re, do_im = load_file(load_path)
##for testing
# clone_load_path = 'python encapsulation/output_clone.txt'
# do_re, do_im = load_file(clone_load_file)

fft_fpga = do_re + do_im*1j  #numpy complex array


##############################################
## plot the result from NumPy and the FPGA ##
############################################
print('Plotting...')
plt.figure(1)
plt.title('Input wave')
plt.plot(TIME, di_re, label='Real')
plt.plot(TIME, di_im, label='Imag')
plt.legend()
plt.grid()
plt.savefig('python encapsulation/input.png', bbox_inches='tight')

plt.figure(2)
plt.title('NumPy FFT')
plt.plot(TIME, np.abs(fft_np), label='ABS')
# plt.plot(TIME, fft_np.real,   label='Real')
# plt.plot(TIME, fft_np.imag,   label='Imag')
plt.legend()
plt.grid()
plt.savefig('python encapsulation/fft_np.png', bbox_inches='tight')

plt.figure(3)
plt.title('FPGA FFT')
plt.plot(TIME, np.abs(fft_fpga), label='ABS')
# plt.plot(TIME, fft_fpga.real,   label='Real')
# plt.plot(TIME, fft_fpga.imag,   label='Imag')
plt.legend()
plt.grid()
plt.savefig('python encapsulation/fft_fpga.png', bbox_inches='tight')

plt.show()
