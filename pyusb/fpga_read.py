import sys
import usb.core
import usb.util
import numpy as np
import matplotlib.pyplot as plt
 
# procurar o usb cypress fx2
dev = usb.core.find(idVendor=0x04b4, idProduct=0x8613)

# encontrado?
if dev is None:
    raise ValueError('Dispositivo nao encontrado')

# ativar config default
dev.set_configuration()
dev.set_interface_altsetting(interface = 0, alternate_setting = 1)
#dev.set_interface_altsetting(interface = 0, alternate_setting = 0)

rst_ep = 1 # EP1 (output endpoint 1, host-2usb) -- usado para reset da FPGA
cfg_ep = 4 # EP4 (output endpoint 4, host-2usb) -- usado para config da FPGA

# gera reset na FPGA (opional)

#dev.write(rst_ep, bytearray([0x00, 0x01, 0x00])) # reset OFF, ON, OFF


#dev.write(cfg_ep, chr(0)) # porque ?

out_ep = 2 # EP2 (output endpoint 2, host-2-usb)
in_ep = 6 + 128# EP6 (input endpoint 6, usb-2-host) o bit 7 tem que estar setado

read_samples = 512

#data_in = dev.read(in_ep,2048) # clear buffer

data_in = dev.read(in_ep, read_samples)

for i in range(int(len(data_in)/2)):
	print(hex(data_in[2*i]), hex(data_in[2*i+1]))
	

data_read = np.zeros((int(read_samples/2),), dtype=int)


data_real = np.zeros((int(read_samples/4),), dtype=int)
data_imag = np.zeros((int(read_samples/4),), dtype=int)

for i in range(int(read_samples/4)): #range(int(read_samples/4))
	data_real[i] = int(data_in[4*i])*256+int(data_in[4*i+1])*1
	data_imag[i] = int(data_in[4*i+2])*256+int(data_in[4*i+3])*1
	#print(i)

# remove o offset (centraliza em zero)

offset = 16384*1

#for i in range(len(data_real)):
#	if data_real[i] > offset:
#		data_real[i] = data_real[i] - offset*2

#data_real = data_real - offset

#for i in range(len(data_imag)):
#	if data_imag[i] > offset:
#		data_imag[i] = data_imag[i] - offset*2

#data_imag = data_imag - offset

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

