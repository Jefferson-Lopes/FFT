import math

def computeMatrix (xr, xi):
    n = len(xr)
    Fr = []
    Fi = []

    for k in range(n):
        for j in range(n):
            Fr[k, j] = math.cos(-2 * math.pi * k*j/n)
            Fi[k, j] = math.sin(-2 * math.pi * k*j/n)

    Yr = [0] * n
    Yi = [0] * n

    for k in range(n):
        for j in range(n):
            Yr[k] = Yr[k] + (Fr[k, j] * xr[j]) - (Fi[k, j] * xi[j])
            Yi[k] = Yi[k] + (Fr[k, j] * xi[j]) - (Fi[k, j] * xr[j])

    return Yr, Yi
