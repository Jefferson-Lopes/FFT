from FFT import FFT
from iFFT import iFFT
import numpy as np
from matplotlib import pyplot as plt

n = 256
w = 2.0 * np.pi/n
samples = np.linspace(start = 0, stop = n-1, num = n)

signal_one = 40 * np.sin(8 * w * samples)
signal_two = 30 * np.sin(40 * w * samples)
signal = signal_one + signal_two

rFFT = FFT(signal, [0] * len(signal))

#convert to from tuple to list of list
rFFT = [list(x) for x in rFFT]
#convert real part into int
rFFT[0] = ([int(a) for a in rFFT[0]])
#convert to np.array
rFFT = np.array(rFFT[0]) + 1j*np.array(rFFT[1])

npFFT = np.fft.fft(signal)

plt.figure(1)
plt.title('Original signals')
plt.plot(samples, signal_one, color='#0A0A2A', linewidth=2, label='8Hz A=40')
plt.plot(samples, signal_two, color='#891717', linewidth=2, label='40Hz A=30')
plt.legend()

plt.figure(2)
plt.title('Result signal')
plt.plot(samples, signal, color='#0A0A2A', linewidth=2)

freq = np.fft.fftfreq(n)
mask = freq > 0

plt.figure(3)
plt.title('Recursive FFT result')
plt.plot(samples, np.abs(rFFT), color='#0A0A2A', linewidth=2, label='abs')
plt.plot()
plt.legend()

plt.figure(4)
plt.title('NumPy FFT result')
plt.plot(samples, np.abs(npFFT), color='#0A0A2A', linewidth=2, label='abs')
plt.plot()
plt.legend()

plt.show()
