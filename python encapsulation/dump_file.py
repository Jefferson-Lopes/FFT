def dump_file(path, real, imag):
    #open the files
    file_wr = open(path, 'w')

    #write the waves
    for i in range(64):
        file_wr.write(str(real[i]) + '\n')
        file_wr.write(str(imag[i]) + '\n')

    file_wr.close()