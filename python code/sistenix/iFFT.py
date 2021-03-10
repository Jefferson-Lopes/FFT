from FFT import FFT

def iFFT (xr, xi):
    n = len(xr)
    Xi = []
    Xr = []

    Xi, Xr = FFT(xi, xr)

    Yr = Xr//n
    Yi = Xi//n

    return Yr, Yi
