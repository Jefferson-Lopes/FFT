#opening, closing, reading and writing data in a text file

#writing
file1 = open('python encapsulation/file_example.txt', 'w')
for i in range(64):
    file1.write('FFFF,FFFF\n')
file1.close()

#reading
file2 = open('python encapsulation/file_example.txt', 'r')

data_read = file2.read()

file2.close()

data_read = data_read.split("\n")

data_read = [i.split(",") for i in data_read]

print(data_read)
