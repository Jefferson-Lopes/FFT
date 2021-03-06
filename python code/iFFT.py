def iFFT (xr, xi):
    N = len(xr)
    Xi = []
    Xr = []

    Xi, Xr = FFT(xi, xr)

    Yr = Xr//N
    Yi = Xi//N

    return Yr, Yi
