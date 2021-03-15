from FFT import FFT
from iFFT import iFFT
import numpy as np
from matplotlib import pyplot as plt

real = [0, 1, 2, 3]
comp = [3, 2, 1, 0]

rFFT = FFT(real, comp)

print
print(rFFT)