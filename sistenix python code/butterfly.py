import math

def butterfly (Xer, Xei, Xor, Xoi, n):
    wr = [0] * (n//2)
    wi = [0] * (n//2)
    G_one = [0] * (n//2)
    G_two = [0] * (n//2)
    Yr = [0] * n
    Yi = [0] * n

    for k in range(n//2):
        wr[k] = math.cos(-2 * math.pi * k/n)
        wi[k] = math.sin(-2 * math.pi * k/n)

    for k in range(n//2):
        G_one[k] = wr[k] * Xor[k] - wi[k] * Xoi[k]
        G_two[k] = wr[k] * Xoi[k] + wi[k] * Xor[k]

    for k in range(n//2):
        Yr[k] = Xer[k] + G_one[k]
        Yr[k + n//2] = Xer[k] - G_one[k]
        Yi[k] = Xei[k] + G_two[k]
        Yi[k + n//2] = Xei[k] - G_two[k]

    return Yr, Yi
