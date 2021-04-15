from FFT import FFT
import numpy as np

P = [5, 3, 2, 1]  #initial polynomial

result1 = FFT(P)

result2 = np.fft.fft(P)

print('\nInitial polynomial: ')
print(P)

print('\nrecursive FFT results: ')
print(result1)

print('\nnumpy results: ')
print(result2)
