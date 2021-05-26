INPUT_NAME = 'params.txt'

def my_zfill(bin_str: str, size: int):
    bin_str = bin_str.replace('0b', '')
    bin_str = bin_str.replace('b', '')

    if len(bin_str) == size:
        return bin_str
    
    if len(bin_str) > size:
        return bin_str[len(bin_str) - size:]

    return ('0' * (size - len(bin_str))) + bin_str

def fixed_length_binary_float(num: float):
    int_part = int(num)
    float_part = num - int_part
    float_part_int = int(float_part * 10000)
    int_part_bin = my_zfill(bin(int_part)[2:], 5)
    float_part_bin = my_zfill(bin(float_part_int)[2:], 11)
    return int_part_bin + float_part_bin

input_file = open(INPUT_NAME, 'r')
output_file = open('input_cnn', 'w')
lines = input_file.readlines()

for line in lines:
    line = line.rstrip(line[-1])
    paras = line.split(' ')
    for para in paras:
        if para:
            num =  float(para)
            binar = fixed_length_binary_float(num)
            output_file.write(binar + '\n')


input_file.close()
output_file.close()

