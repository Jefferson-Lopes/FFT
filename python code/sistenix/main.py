from typing_extensions import TypeAlias
from FFT import FFT
from iFFT import iFFT
import numpy as np
from matplotlib import pyplot as plt

n = 255
w = 2.0 * np.pi/n
samples = np.linspace(start = 0, stop = n, num = n)

signal_one = 40 * np.sin(8 * w * samples)
signal_two = 30 * np.sin(40 * w * samples)
signal = signal_one + signal_two

rFFT = FFT(signal, [0] * len(signal))

npFFT = np.fft.fft(signal)

plt.figure(1)
plt.title('Original signals')
plt.plot(samples, signal_one, color='#0A0A2A', linewidth=2, label='8Hz A=40')
plt.plot(samples, signal_two, color='#891717', linewidth=2, label='40Hz A=30')
plt.legend()

plt.figure(2)
plt.title('Result signal')
plt.plot(samples, signal, color='#0A0A2A', linewidth=2)

real_rFFT = rFFT[0]
real_npFFT = npFFT.real
freq = np.fft.fftfreq(n)
mask = freq > 0

print(real_rFFT)
np.delete

'''plt.figure(3)
plt.title('Recursive FFT result')
plt.plot(, real_rFFT, color='#0A0A2A', linewidth=2, label='real')
plt.plot()
plt.legend()'''

plt.figure(4)
plt.title('NumPy FFT result')
plt.plot(freq, np.abs(real_npFFT), color='#0A0A2A', linewidth=2, label='real')
plt.plot()
plt.legend()

plt.show()
