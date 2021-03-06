import math
import numpy as np

def computeMatrix (xr, xi):
    N = len(xr)
    Fr = []
    Fi = []

    for k in range(N):
        for j in range(N):
            Fr[k, j] = math.cos(-2 * math.pi * k*j/N)
            Fi[k, j] = math.sin(-2 * math.pi * k*j/N)

    Yr = np.zeros(N)
    Yi = np.zeros(N)

    for k in range(N):
        for j in range(N):
            Yr[k] = Yr[k] + (Fr[k, j] * xr[j]) - (Fi[k, j] * xi[j])
            Yi[k] = Yi[k] + (Fr[k, j] * xi[j]) - (Fi[k, j] * xr[j])

    return Yr, Yi
