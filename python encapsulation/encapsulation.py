import numpy as np
import matplotlib.pyplot as plt



## generate a signal input ##
FREQ = 5
AMP  = 512
TIME = np.arange(0, 8, .125)       #64 points
wave = AMP/2*np.sin(FREQ * TIME)   #max amplitude: 512 
wave = wave + AMP/2                #add offset 
wave = wave.astype(int)            #convert to int

di_re = wave
di_im = np.zeros(64).astype(int)



## dump into a text file ##
#open the files
file_wr = open('R22SDF/simulation/modelsim/input.txt', 'w')
#second file for keep track more easily
file_wr_clone = open('python encapsulation/input_clone.txt', 'w')

#write the column labels
file_wr.write('real,imag')
file_wr_clone.write('real,imag')

#write the waves
for i in range(64):
    text = '\n' + str(di_re[i]) + ',' + str(di_im[i])
    file_wr.write(text)
    file_wr_clone.write(text)

#close both files
file_wr.close()
file_wr_clone.close()



## process the data in verilog testbench ##
#using make_output for testing



## load the result ##
#for testing
file_rd = open('python encapsulation/output_clone.txt', 'r')
#file_rd = open('R22SDF/simulation/modelsim/output.txt', 'r')
data_read = file_rd.read()
file_rd.close()
data_read = data_read.split("\n")
data_read = [i.split(",") for i in data_read]
data_real = np.array([row[0] for row in data_read])
data_imag = np.array([row[1] for row in data_read])

do_re = data_real[1:].astype(int)
do_im = data_imag[1:].astype(int)


## plot the result and the same thing with NumPy ##