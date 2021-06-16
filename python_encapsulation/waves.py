import numpy as np

def waves(freq, amp):  
    TIME = np.arange(0, 8, .125)  #64 points
    wave = 0
    for n in freq:
        wave += amp/2 * np.sin(2*np.pi*n*TIME)

    return wave.astype(int)