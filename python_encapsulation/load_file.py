import numpy as np
from bin2decimal import bin2decimal
from reverse_bits import reverse_bits

def load_file(path):
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
    aux_real = np.zeros(len(data_real)).astype(int)
    aux_imag = np.zeros(len(data_imag)).astype(int)
    for i in range(64):
        index = reverse_bits(i, 6)
        aux_real[index] = data_real[i]
        aux_imag[index] = data_imag[i]

    do_re = aux_real
    do_im = aux_imag

    return do_re, do_im