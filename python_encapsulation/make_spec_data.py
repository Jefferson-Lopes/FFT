#######################
## only for testing ##
#####################

import numpy as np
from waves import waves

def spec_data():
    data = list()
    for i in range(64):
        real = waves(freq=[1*((i**2)/1000)], amp=30)
        imag = waves(freq=[1*((i**2)/5000)], amp=15)
        comp = real + imag*1j

        fft_np = np.fft.fft(comp)  

        data.append(fft_np)

    data = np.array(data)

    return data
