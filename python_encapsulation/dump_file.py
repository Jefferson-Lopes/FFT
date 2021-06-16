def dump_file(path, real, imag, points):
    #open the files
    file_wr = open(path, 'w')

    #write the waves
    for i in range(points):
        file_wr.write(str(real[i]) + '\n')
        file_wr.write(str(imag[i]) + '\n')

    file_wr.close()