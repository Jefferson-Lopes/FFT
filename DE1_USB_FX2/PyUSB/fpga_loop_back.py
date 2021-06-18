import sys
import usb.core
import usb.util
import numpy as np
import matplotlib.pyplot as plt
from scipy import signal
 
# procurar o usb cypress fx2
dev = usb.core.find(idVendor=0x04b4, idProduct=0x8613)

# encontrado?
if dev is None:
    raise ValueError('Dispositivo nao encontrado')

# ativar config default
dev.set_configuration()
dev.set_interface_altsetting(interface = 0, alternate_setting = 1)

rst_ep = 1 # EP1 (output endpoint 1, host-2usb) -- usado para config e reset da FPGA

# gera reset na FPGA
dev.write(rst_ep, chr(1)) # reset ON (opional)
dev.write(rst_ep, chr(0)) # reset OFF

out_ep = 2 # EP2 (output endpoint 2, host-2-usb)
in_ep = 6 + 128 # EP6 (input endpoint 6, usb-2-host) o bit 7 tem que estar setado

##############################################

write_samples = 1024

fs = 128000

freq = 2000 #int(fs/write_samples)
ampl = 32767

theta = 0
thetax = 0
thetay = 1*np.pi/2

buf_len = 512

t = np.arange(0, write_samples)* 1/fs;
tp = np.linspace(0, write_samples, fs)

# sin_cos
x = 1*ampl/2 * np.cos(2 * np.pi * freq * (t + theta))+ampl/2
y = 1*ampl/2 * np.sin(2 * np.pi * freq * (t + theta))+ampl/2

# rampa
x = 1*ampl/2 * signal.sawtooth(2 * np.pi * freq * (tp + thetax))+ampl/2
y = 1*ampl/2 * signal.sawtooth(2 * np.pi * freq * (tp + thetay))+ampl/2

#plt.plot(x)
#plt.plot(y)

data_out_xy = bytearray(buf_len)

for i in range(int(buf_len/4)):
	
	tempx = (int(x[i])).to_bytes(2,byteorder="big")	
	tempy = (int(y[i])).to_bytes(2,byteorder="big")

	data_out_xy[4*i] = tempx[0]
	data_out_xy[4*i+1] = tempx[1]
	data_out_xy[4*i+2] = tempy[0]
	data_out_xy[4*i+3] = tempy[1]
		

#print(len(data_out_xy))

##############################################

dev.write(out_ep, data_out_xy)

#plt.plot(x)
#plt.plot(y)

#plt.show()

##############################################

data_in = dev.read(in_ep,2048) # clear buffer

read_samples = 1024

data_in = dev.read(in_ep,read_samples)

#print(data_in)

data_read = np.zeros((int(read_samples/2),), dtype=int)

data_real = np.zeros((int(read_samples/4),), dtype=int)
data_imag = np.zeros((int(read_samples/4),), dtype=int)

for i in range(int(read_samples/4)):
	data_real[i] = int(data_in[4*i])*256+int(data_in[4*i+1])*1
	data_imag[i] = int(data_in[4*i+2])*256+int(data_in[4*i+3])*1
	#print(i)

# remove o offset (centraliza em zero)

offset = 16384*1*2

#for i in range(len(data_real)):
#	if data_real[i] > offset:
#		data_real[i] = data_real[i] - offset*2

data_real = data_real - offset

#for i in range(len(data_imag)):
#	if data_imag[i] > offset:
#		data_imag[i] = data_imag[i] - offset*2

data_imag = data_imag - offset

# gera arquivo texto (talvez para o octave)

#f= open("adc.txt","w+")

#for i in data_in:
#	f.write("%d\r\n" % i)
#	#print(i)
	
#f.close()

plt.plot(data_real)
plt.plot(data_imag)
#plt.plot(data_read)
#plt.plot(data_in)

plt.show()

