#######################
## only for testing ##
#####################

import numpy as np

def make_output():
    ## input data from input_clone ##
    file1 = open('python encapsulation/input_clone.txt', 'r')

    if not file1:
        return 1

    data_read = file1.read()
    file1.close()
    data_read = data_read.split("\n")
    data_read.pop() #delete the last element: '\n'
    data_real = np.array(data_read[0::2])
    data_imag = np.array(data_read[1::2])

    di_re = data_real.astype(int)
    di_im = data_imag.astype(int)

    comp = di_re + di_im*1j

    fft = np.fft.fft(comp)

    file2 = open('python encapsulation/output_clone.txt', 'w')

    if not file2:
        return 2

    for i in range(64):
        file2.write(str(int(fft[i].real)) + '\n')
        file2.write(str(int(fft[i].imag)) + '\n')

    file2.close()

    return False
