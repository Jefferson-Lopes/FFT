import math
import numpy as np

def butterfly (Xer, Xei, Xor, Xoi, N):
    wr = []
    wi = []
    G_one = []
    G_two = []
    Yr = []
    Yi = []

    for k in range(N//2):
        wr[k] = math.cos(-2 * math.pi * k/N)
        wi[k] = math.sin(-2 * math.pi * k/N)

    for k in range(N//2):
        G_one[k] = wr[k] * Xor[k] - wi[k] * Xoi[k]
        G_two[k] = wr[k] * Xoi[k] - wi[k] * Xor[k]

    for k in range(N//2):
        Yr[k] = Xer[k] + G_one[k]
        Yr[k + N/2] = Xer[k] - G_one[k]
        Yi[k] = Xei[k] + G_two[k]
        Yi[k + N/2] = Xei[k] - G_two[k]

    return Yr, Yi
