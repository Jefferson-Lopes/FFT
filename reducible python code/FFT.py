from cmath import exp, pi

def FFT (P):
    n = len(P)

    if n == 1:
        return P

    w = exp((2*pi*1j) / n)

    Pe = P[0::2]
    Po = P[1::2]

    Ye = FFT(Pe)
    Yo = FFT(Po)

    Y = [0] * n

    for i in range(n//2):
        Y[i] = Ye[i] + (w**i)*Yo[i]
        Y[i + n//2] = Ye[i] - (w**i)*Yo[i]

    return Y
