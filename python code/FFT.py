def FFT (xr, xi):
    N = len(xr)
    xe_r = []
    xo_r = []
    xe_i = []
    xo_i = []
    Xer = []
    Xei = []
    Xor = []
    Xoi = []
    Yr = []
    Yi = []

    if (N % 2) == 0:
        for k in range(N//2):
            xe_r[k] = xr[2*k]
            xo_r[k] = xr[2*k + 1]

            xe_i[k] = xi[2*k]
            xo_i[k] = xi[2*k + 1]
        
        Xer, Xei = FFT(xe_r, xe_i)
        Xor, Xoi = FFT(xo_r, xo_i)
        Yr, Yi = butterfly(Xer, Xei, Xor, Xoi, N)
    else:
        Yr, Yi = computeMatrix(xr, xi)

    return Yr, Yi
