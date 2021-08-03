import numpy as np
import matplotlib.pyplot as plt
	
fs = 1000
freq = 10
ampl = 32767
N = 512
theta = 0

offset = 16384

t = np.arange(0, N)* 1/fs;

x = ampl/2 * np.cos(2 * np.pi * freq * t + theta)+ampl/2
y = ampl/2 * np.sin(2 * np.pi * freq * t + theta)+ampl/2

x16 = np.int16(x) - offset
y16 = np.int16(y) - offset


plt.plot(t, x16)
plt.plot(t, y16)


plt.grid(True, which='both')

#plt.axhline(y=0, color='k')

plt.show()

#plt.show()
