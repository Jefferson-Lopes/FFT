import numpy as np

## input data from input_clone ##
file1 = open('python encapsulation/input_clone.txt', 'r')
data_read = file1.read()
file1.close()
data_read = data_read.split("\n")
data_read.pop() #delete the last element: '\n'
data_real = np.array(data_read[0::2])
data_imag = np.array(data_read[1::2])

di_re = data_real.astype(int)
di_im = data_imag.astype(int)

TIME = np.arange(0, 8, .125)       #64 points

comp = di_re + di_im*1j

fft = np.fft.fft(comp)

file2 = open('python encapsulation/output_clone.txt', 'w')
for i in range(64):
    #real
    file2.write(str(int(fft[i].real)) + '\n')
    #imag
    file2.write(str(int(fft[i].imag)) + '\n')

file2.close()

print('File generated successfully!')
