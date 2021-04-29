import numpy as np
from math import pi
import matplotlib.pyplot as plt
from bin2decimal import bin2decimal
from reverse_bits import reverse_bits

#############################
## generate a signal input ##
#############################
FREQ1 = 2*pi*1
FREQ2 = 2*pi*0.25
AMP  = 512
TIME = np.arange(0, 8, .125)       #64 points
wave = AMP/2*np.cos(FREQ1 * TIME) + AMP/2*np.cos(FREQ2 * TIME)

di_re = wave.astype(int)
di_im = np.zeros(64).astype(int)


###########################
## dump into a text file ##
###########################
#open the files
file_wr = open('R22SDF/simulation/modelsim/input.txt', 'w')
#second file for keep track more easily
file_wr_clone = open('python encapsulation/input_clone.txt', 'w')

#write the waves
for i in range(64):
    #real
    file_wr.write(str(di_re[i]) + '\n')
    file_wr_clone.write(str(di_re[i]) + '\n')

    #imag
    file_wr.write(str(di_im[i]) + '\n')
    file_wr_clone.write(str(di_im[i]) + '\n')

#close both files
file_wr.close()
file_wr_clone.close()


###########################################
## process the data in verilog testbench ##
###########################################
#using make_output for testing
print('The input file was generated. ')
print('Please run the Verilog testbench then press enter.')
input('Press enter. . .')


#################################
## process the data with NumPy ##
#################################
comp = di_re + di_im*1j    #convert to complex array

fft_np = np.fft.fft(comp)


#####################
## load the result ##
#####################
#for testing
#file_rd = open('python encapsulation/output_clone.txt', 'r')
file_rd = open('R22SDF/simulation/modelsim/output.txt', 'r')
data_read = file_rd.read()
file_rd.close()
data_read = data_read.split('\n')
data_read.pop() #delete the last element: '\n'
data_real = np.array([bin2decimal(i) for i in data_read[0::2]])
data_imag = np.array([bin2decimal(i) for i in data_read[1::2]])


#######################
## reverse bit order ##
#######################
aux_real = np.zeros(len(data_real)).astype(int)
aux_imag = np.zeros(len(data_imag)).astype(int)
for i in range(64):
    index = reverse_bits(i, 6)
    aux_real[index] = data_real[i]
    aux_imag[index] = data_imag[i]

do_re = aux_real
do_im = aux_imag

fft_fpga = do_re + do_im*1j


###################################################
## plot the result and the same thing with NumPy ##
###################################################
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
