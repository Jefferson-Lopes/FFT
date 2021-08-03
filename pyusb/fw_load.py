#!/usr/bin/python3

import usb.core
import sys
import numpy as np
import matplotlib.pyplot as plt

#--------------------------------------------------------------------------



#--------------------------------------------------------------------------
#firmware_filename = "slave_fifo.ihx"

if len(sys.argv) != 2:
    print('Usage: ' + sys.argv[0] + ' <firmware.ihx | firmware.hex>')
    exit()

firmware_filename = sys.argv[1]

print(firmware_filename)

#with open(firmware_filename, 'rb') as f:
#    data = f.read()

dev = usb.core.find(idVendor=0x04b4, idProduct=0x8613)

## Mantem o uP do chip USB em reset
#dev.ctrl_transfer(0x40, 0xA0, 0xE600, 0x0000, bytearray([0x01]), 1) # reset on

#print("reset...")

## Carrega o firmware para a RAM do uP.
## Esse firmware deve carregar o arquivo .rbf na FPGA e
## tambem implementa o modo de operacao conhecido como Slave-FIFO,
## que e o o modo para comunicacao com o PC.

#step = 0x1000
#for addr in range(0x0, 0x4000, step):
#    size = min(len(data), step)
#    if size == 0:
#        break
#    assert dev.ctrl_transfer(0x40, 0xA0, addr, 0x0000, data[:size]) == size
#    data = data[size:]

#print("fw carregado...")

## Retira o uP do chip USB do estado de reset	
#dev.ctrl_transfer(0x40, 0xA0, 0xE600, 0x0000, bytearray([0x00]), 1) # reset off

#print("reset removido...")

#dev.set_configuration()
#dev.set_interface_altsetting(interface = 0, alternate_setting = 1)

############# experimental ################

def device2name(device):
    return 'DEVICE ID %04x:%04x on Bus %03d Adresse %03d' % (device.idVendor, device.idProduct, device.bus, device.address)


def writeEzusbVendor_RwInternal(device, addr, data):
    EZUSB_RW_INTERNAL     = 0xA0    #  hardware implements this one
    #EZUSB_RW_MEMORY       = 0xA3
    #EZUSB_RW_EEPROM       = 0xA2
    #EZUSB_GET_EEPROM_SIZE = 0xA5

    assert device.ctrl_transfer(usb.util.CTRL_TYPE_VENDOR | usb.util.CTRL_OUT | usb.util.CTRL_RECIPIENT_DEVICE, EZUSB_RW_INTERNAL, addr, 0, data, timeout = 1000) == len(data)
    
	
def loadHexFirmware(device, filename):

    # MAXSIZE_DEFAULT = 0x1b40
    # CPU program code can go up to 0x1b00. Memory above can access via xdata
    # If we allow usage of Buf 2-7 for (x)code - we can load up to 0x1e40
    MAXSIZE = 0x1e40

    cpucs_addr = 0xE600 
    stopCPU  = bytes([0x01])
    startCPU = bytes([0x00])

    print('Load firmware %s for %s' % (filename, device2name(device)))
    with open(filename, 'r') as file:
        # bmRequestType, bmRequest, wValue and wIndex
        
        print('')
        print('....Stop CPU')
		
		# Mantem o uP do chip USB em reset
		
        writeEzusbVendor_RwInternal(device, cpucs_addr, stopCPU)

        print('....Loading firmware')
		
		# Carrega o firmware (.ihx ou .hex) para a RAM do uP.
		# Esse firmware implementa o modo de operacao conhecido como Slave-FIFO,
		# que eh o modo para comunicacao com o PC.
		
        for line in file:
            assert line[0] == ':'

            bytecount = int( line[1:3], 16 )
            address   = int( line[3:7], 16 )
            rec_type  = int( line[7:9], 16 )
            # bighex = 0 if bytecount == 0 else int( line[9:-3], 16 )
            check     = int( line[-3:], 16 )
            data = bytearray([ int( line[i:i+2], 16 ) for i in range(9, len(line)-4, 2) ])

            cks = ~(bytecount+(address>>8)+address+rec_type+sum(data))+1
            if(cks & 0xff != check):
                raise ValueError("Checksum wrong")

            if rec_type == 0x01:
                break
            if bytecount == 0x00:
                continue

            assert address + bytecount <= MAXSIZE            
            writeEzusbVendor_RwInternal(device, address, data)

            #print(data, address)
		
		# Retira o uP do chip USB do estado de reset (executa o firmware)
        print('....Start CPU')
        writeEzusbVendor_RwInternal(device, cpucs_addr, startCPU)

loadHexFirmware(dev, firmware_filename)