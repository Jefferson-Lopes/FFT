import sys
import usb.core
import usb.util
import numpy as np
import matplotlib.pyplot as plt

# procurar o usb cypress fx2
dev = usb.core.find(idVendor=0x04b4, idProduct=0x8613)

# encontrado?
if dev is None:
    raise ValueError('Dispositivo não encontrado')

# ativar config default
dev.set_configuration()
dev.set_interface_altsetting(interface = 0, alternate_setting = 1)

out_data = chr(16) # freq do sinal

out_ep = 2 # EP2 (output endpoint 2, host-2-usb)
in_ep = 6 + 128 # EP6 (input endpoint 6, usb-2-host) o bit 7 tem que estar setado

dev.write(out_ep,out_data)
data_in = dev.read(in_ep,4096)

# os dados estão no formato real_hi, real_lo, imag_hi, imag_lo
# mas parece que o python inverteu a ordem do real com o imag...

data_real_hi = data_in[3:len(data_in):4] 
data_real_lo = data_in[4:len(data_in):4] 

data_imag_hi = data_in[1:len(data_in):4] 
data_imag_lo = data_in[2:len(data_in):4] 


data_real = np.random.randint(10, size=len(data_real_hi))
data_imag = np.random.randint(10, size=len(data_imag_hi))

# converte de bytes para int16

for i in range(len(data_real)-1):
	data_real[i] = int(data_real_hi[i])*1 + int(data_real_lo[i])*256

for i in range(len(data_imag)-1):
	data_imag[i] = int(data_imag_hi[i])*1 + int(data_imag_lo[i])*256

# remove o offset (centraliza em zero)

for i in range(len(data_real_hi)):
	if data_real[i] > 32768:
		data_real[i] = data_real[i] - 32768*2

for i in range(len(data_imag_hi)):
	if data_imag[i] > 32768:
		data_imag[i] = data_imag[i] - 32768*2

# gera arquivo texto (talvez para o octave)

f= open("adc.txt","w+")

for i in data_in:
	f.write("%d\r\n" % i)
	#print(i)
	
f.close()

plt.plot(data_real)
plt.plot(data_imag)

plt.show()

