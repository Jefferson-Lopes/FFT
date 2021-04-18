import numpy as np
import matplotlib.pyplot as plt

FREQ = 5
AMP  = 512
TIME = np.arange(0, 8, .125)       #64 points
wave = AMP/2*np.sin(FREQ * TIME)   #max amplitude: 512 
wave = wave.astype(int)            #convert to int
wave = wave + AMP/2                #add offset 

di_re = wave
di_im = np.zeros(64).astype(int)

plt.figure(1)
plt.title('Sine wave')
plt.plot(TIME, di_re, label='Real')
plt.plot(TIME, di_im, label='Imag')
plt.legend()
plt.show()