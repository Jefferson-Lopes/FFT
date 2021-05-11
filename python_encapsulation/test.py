############################################
## Script used for testing only one wave ##
##########################################

import numpy as np
import matplotlib.pyplot as plt
from waves import waves
from encapsulation import encapsulation


##############################
## generate a signal input ##
############################
TIME = np.arange(0, 8, .125)  #const
# noise = np.random.normal(0, 25, np.zeros(64).shape).astype(int)

di_re = waves(freq=[0.25], amp=512)
di_im = waves(freq=[1], amp=0)


############################################
## process the data with encapsulation() ##
##########################################
fft_np, fft_fpga = encapsulation(di_re, di_im)


##############################################
## plot the result from NumPy and the FPGA ##
############################################
plt.figure(1)
plt.title('Input wave')
plt.plot(TIME, di_re, label='Real')
plt.plot(TIME, di_im, label='Imag')
plt.legend()
plt.grid()
plt.savefig('resources/input.png', bbox_inches='tight')

plt.figure(2)
plt.title('NumPy FFT')
plt.plot(TIME, np.abs(fft_np), label='ABS')
plt.legend()
plt.grid()
plt.savefig('resources/fft_np.png', bbox_inches='tight')

plt.figure(3)
plt.title('FPGA FFT')
plt.plot(TIME, np.abs(fft_fpga), label='ABS')
plt.legend()
plt.grid()
plt.savefig('resources/fft_fpga.png', bbox_inches='tight')

plt.show()