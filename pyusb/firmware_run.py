import usb.core
import sys
import numpy as np
import matplotlib.pyplot as plt

#--------------------------------------------------------------------------



#--------------------------------------------------------------------------
if len(sys.argv) != 2:
    print('Usage: ' + sys.argv[0] + ' <firmware>')
    exit()

firmware_filename = sys.argv[1]

print(firmware_filename)

with open(firmware_filename, 'rb') as f:
    data = f.read()

dev = usb.core.find(idVendor=0x04b4, idProduct=0x8613)

# Mantem o uP do chip USB em reset
dev.ctrl_transfer(0x40, 0xA0, 0xE600, 0x0000, bytearray([0x01]), 1) # reset on

print("reset...")

# Carrega o firmware para a RAM do uP.
# Esse firmware deve carregar o arquivo .rbf na FPGA e
# tambem implementa o modo de operacao conhecido como Slave-FIFO,
# que e o o modo para comunicacao com o PC.

step = 0x1000
for addr in range(0x0, 0x4000, step):
    size = min(len(data), step)
    if size == 0:
        break
    assert dev.ctrl_transfer(0x40, 0xA0, addr, 0x0000, data[:size]) == size
    data = data[size:]

print("fw carregado...")

# Retira o uP do chip USB do estado de reset	
dev.ctrl_transfer(0x40, 0xA0, 0xE600, 0x0000, bytearray([0x00]), 1) # reset off

print("reset removido...")

dev.set_configuration()
dev.set_interface_altsetting(interface = 0, alternate_setting = 1)

############# experimental ################

