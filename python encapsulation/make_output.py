import numpy as np

## input data from input_clone ##
file1 = open('python encapsulation/input_clone.txt', 'r')
data_read = file1.read()
file1.close()
data_read = data_read.split("\n")
data_read = [i.split(",") for i in data_read]
data_real = np.array([row[0] for row in data_read])
data_imag = np.array([row[1] for row in data_read])

di_re = data_real[1:].astype(int)
di_im = data_imag[1:].astype(int)
TIME = np.arange(0, 8, .125)       #64 points

comp = di_re + di_im*1j

fft = np.fft.fft(comp)

file2 = open('python encapsulation/output_clone.txt', 'w')
file2.write('real,imag')
for i in range(64):
    text = '\n' + str(int(fft[i].real)) + ',' + str(int(fft[i].imag))
    file2.write(text)
file2.close()
