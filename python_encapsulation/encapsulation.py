####################################################
## this function handles all the data processing ## 
## and communication with the Verilog module    ##
#################################################

from os import path
import subprocess
import numpy as np
from dump_file import dump_file
from load_file import load_file
from make_output import make_output
from bin2decimal import bin2decimal
from reverse_bits import reverse_bits
from waves import waves

def encapsulation(blocks=64):
    POINTS = blocks * 64
    STARTFREQ = np.random.randint(3, 15)
    ENDFREQ = np.random.randint(3, 15)

    freqs = np.linspace(start=STARTFREQ, stop=ENDFREQ, num=blocks, endpoint=False)

    di_re = waves(freq=[freqs[0]], amp=512)
    di_im = waves(freq=[0],        amp=0)

    for i in range(blocks - 1):
        di_re = np.append(di_re, waves(freq=[freqs[i + 1]], amp=512))
        di_im = np.append(di_im, waves(freq=[0],        amp=0))

    ############################
    ## dump into a text file ##
    ##########################
    dump_path = 'R22SDF/simulation/modelsim/input.txt'
    dump_file(dump_path, di_re, di_im, POINTS)

    clone_dump_path = 'resources/input_clone.txt'
    dump_file(clone_dump_path, di_re, di_im, POINTS)


    ############################################
    ## process the data in verilog testbench ##
    ##########################################

    ##for testing
    # if make_output():
    #     print('Problem to open the file')
    # else:
    #     print('File generated successfully!')

    print('Running the verilog simulation. . .')

    subprocess.call(['sh', './run_vsim.sh']) #run the simulation


    ##################################
    ## process the data with NumPy ##
    ################################
    comp = di_re[0:64] + di_im[0:64]*1j     #numpy complex array
    spec_np = [np.fft.fft(comp)]
    for i in range(blocks - 1):
        comp = di_re[(i+1)*64 : ((i+2)*64)] + di_im[(i+1)*64 : ((i+2)*64)]*1j 
        spec_np = np.append(spec_np, [np.fft.fft(comp)], axis=0)  


    ######################
    ## load the result ##
    ####################
    load_path = 'R22SDF/simulation/modelsim/output.txt'
    do_re, do_im = load_file(path=load_path, points=POINTS)
    # #for testing
    # clone_load_path = 'resources/output_clone.txt'
    # do_re, do_im = load_file(clone_load_path)


    ###########################
    ## formating the result ##
    #########################
    spec_fpga = [do_re[0:64] + do_im[0:64]*1j]
    for i in range(blocks - 1):
        hold = do_re[(i+1)*64 : ((i+2)*64)] + do_im[(i+1)*64 : ((i+2)*64)]*1j 
        spec_fpga = np.append(spec_fpga, [hold], axis=0)  

    return spec_np, spec_fpga
