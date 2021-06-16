import numpy as np
from bin2decimal import bin2decimal
from reverse_bits import reverse_bits

def load_file(path, points=64):
    file_rd = open(path, 'r')
    data_read = file_rd.read()
    file_rd.close()
    data_read = data_read.split('\n')
    data_read.pop() #delete the last element: '\n'
    data_real = np.array([bin2decimal(i) for i in data_read[0::2]])
    data_imag = np.array([bin2decimal(i) for i in data_read[1::2]])

    ########################
    ## reverse bit order ##
    ######################
    do_re = do_im = []
    for i in range(int(points/64)):
        aux_real = aux_imag = np.zeros(64).astype(int)
        
        for j in range(64):
            index = reverse_bits(j, 6)
            aux_real[index] = data_real[j + i*64]
            aux_imag[index] = data_imag[j + i*64]

        do_re = np.append(do_re, aux_real)
        do_im = np.append(do_im, aux_imag)

    return do_re, do_im
