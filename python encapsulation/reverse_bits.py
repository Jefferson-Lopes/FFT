#convert reverse index order to the natural way

def reverse_bits(n, no_of_bits):
    result = 0
    for _ in range(no_of_bits):
        result <<= 1
        result |= n & 1
        n >>= 1
    return result
