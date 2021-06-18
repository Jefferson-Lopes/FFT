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

rst_ep = 1 # EP1 (output endpoint 1, host-2usb) -- usado para config e reset da FPGA

# gera reset na FPGA
dev.write(rst_ep, chr(1)) # reset ON (opional)
dev.write(rst_ep, chr(0)) # reset OFF

out_ep = 2 # EP2 (output endpoint 2, host-2-usb)
in_ep = 6 + 128 # EP6 (input endpoint 6, usb-2-host) o bit 7 tem que estar setado

##############################################

write_samples = 128

fs = 128000

freq = 4000 #int(fs/write_samples)
ampl = 32767

theta = 0

buf_len = 512

t = np.arange(0, write_samples)* 1/fs;

x = ampl/2 * np.cos(2 * np.pi * freq * t + theta)+ampl/2
y = ampl/2 * np.sin(2 * np.pi * freq * t + theta)+ampl/2

#print(len(x))

#data_out = bytearray(buf_len)
data_out_xy = bytearray(buf_len)

for i in range(int(buf_len/4)):
	
#	temp = (4*i).to_bytes(2,byteorder="big")	
#	temp2 = (4*i+64).to_bytes(2,byteorder="big")

#	data_out[4*i] = temp[0]
#	data_out[4*i+1] = temp[1]
#	data_out[4*i+2] = temp2[0]
#	data_out[4*i+3] = temp2[1]
#
	temp3 = (int(x[i])).to_bytes(2,byteorder="big")	
	temp4 = (int(y[i])).to_bytes(2,byteorder="big")

	data_out_xy[4*i] = temp3[0]
	data_out_xy[4*i+1] = temp3[1]
	data_out_xy[4*i+2] = temp4[0]
	data_out_xy[4*i+3] = temp4[1]
		

#print(len(data_out))

##############################################

#dev.write(out_ep, data_out)
dev.write(out_ep, data_out_xy)

#plt.plot(x)
#plt.plot(y)

#plt.show()
