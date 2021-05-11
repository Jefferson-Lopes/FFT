def bin2decimal(input_bin):
    result = 0
    if int(input_bin[0]):
        #negative
        for i in range(16):
            if not int(input_bin[i]):
               result += (32768/(2**i))
        result = -1*result -1
    else:
        #positive
        for i in range(15):
            result += int(input_bin[i+1]) * (16384/(2**i))            
    
    return int(result)
