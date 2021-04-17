import numpy as np
import matplotlib.pyplot as plt

time = np.arange(0, 32, 0.5)
wave = 256*np.sin(time)   #max amplitude: 512 
wave = wave.astype(int)   #convert to int
wave = wave + 256         #add offset 

di_re = wave
di_im = np.zeros(64).astype(int)

plt.plot(time, di_re)
plt.plot(time, di_im)
plt.title('Sine wave')
plt.show()