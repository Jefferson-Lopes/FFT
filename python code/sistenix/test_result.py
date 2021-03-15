from FFT import FFT
from iFFT import iFFT
import numpy as np
from matplotlib import pyplot as plt

signal = np.array([0+3j, 1+2j, 2+1j, 3+0j])

rFFT = FFT(signal.real, signal.imag)

#convert to from tuple to list of list
rFFT = [list(x) for x in rFFT]
#convert real part into int
rFFT[0] = ([int(a) for a in rFFT[0]])
#convert to np.array
rFFT = np.array(rFFT[0]) + 1j*np.array(rFFT[1])


npFFT = np.fft.fft(signal)

print(rFFT)
print('\n\n')
print(npFFT)
