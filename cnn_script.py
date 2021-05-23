INPUT_NAME = 'params.txt'

import numpy as np

input_file = open(INPUT_NAME, 'r')
output_file = open('input_cnn', 'w')
lines = input_file.readlines()

for line in lines:
    line = line.rstrip(line[-1])
    paras = line.split(' ')
    for para in paras:
        num =  float(para)
        binar = bin(np.float16(num).view('H'))[2:].zfill(16)
        output_file.write(binar + '\n')


input_file.close()
output_file.close()
