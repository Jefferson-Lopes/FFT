from cmath import pi
from FFT import FFT
from iFFT import iFFT
import numpy as np
from matplotlib import pyplot as plt

freq_one = 8
freq_two = 40
w = 2.0 * np.pi/255
samples = np.linspace(start = 0, stop = 255, num = 255)

signal_one = 40 * np.sin(freq_one * w * samples)
signal_two = 30 * np.sin(freq_two * w * samples)
signal = signal_one + signal_two

result = FFT(signal, [0] * len(signal))

print('signal_one')
print(signal_one)
print('signal_two')
print(signal_two)
print('signal')
print(signal)

plt.figure(1)
plt.title('Original signals')
plt.plot(samples, signal_one, color='#0A0A2A', linewidth=2, label='4Hz A=4')
plt.plot(samples, signal_two, color='#891717', linewidth=2, label='20Hz A=3')
plt.legend()

plt.figure(2)
plt.title('Result signal')
plt.plot(samples, signal, color='#0A0A2A', linewidth=2)

plt.figure(3)
plt.title('FFT result')
plt.plot(samples, result[0], color='#0A0A2A', linewidth=2, label='real')
plt.plot(samples, result[1], color='#891717', linewidth=2, label='imaginary')
plt.legend()

plt.show()
