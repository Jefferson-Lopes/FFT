####################################################
## this function handles all the data processing ## 
## and communication with the Verilog module    ##
#################################################

import subprocess
import numpy as np
from dump_file import dump_file
from load_file import load_file
from make_output import make_output
from bin2decimal import bin2decimal
from reverse_bits import reverse_bits

def encapsulation(di_re, di_im):
    ############################
    ## dump into a text file ##
    ##########################
    dump_path = 'R22SDF/simulation/modelsim/input.txt'
    dump_file(dump_path, di_re, di_im)

    clone_dump_path = 'resources/input_clone.txt'
    dump_file(clone_dump_path, di_re, di_im)


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
    comp = di_re + di_im*1j     #numpy complex array

    fft_np = np.fft.fft(comp)   


    ######################
    ## load the result ##
    ####################
    load_path = 'R22SDF/simulation/modelsim/output.txt'
    do_re, do_im = load_file(load_path)
    ##for testing
    # clone_load_path = 'resources/output_clone.txt'
    # do_re, do_im = load_file(clone_load_file)

    fft_fpga = do_re + do_im*1j  #numpy complex array

    return fft_np, fft_fpga
