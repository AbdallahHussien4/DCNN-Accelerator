from cv2 import imread
from cv2 import IMREAD_GRAYSCALE
from os import listdir
from os.path import join, splitext
from sys import argv
from numpy import uint16
from numpy import zeros

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

# Read and padding the file
def read_file(file_path='00001.bmp'):
    img = imread(file_path, IMREAD_GRAYSCALE)
    # print(img[14,:])
    mat = uint16(zeros((32,32)))
    mat[2:30,2:30] =img
    # print(mat[16,:])
    return mat

# Normalize image to float 0->1
def normalize_image(img):
    return img / 255

# Convert image to binary
def ConvertToBinary(img):
    a = img
    b = [""]*32
    for i in range (32):
        for j in range(32):
            b[i] += fixed_length_binary_float(a[i][j])
    return b

def RLE_image(img,output_path,image_name):
    f = open(join(output_path, splitext(image_name)[0]), 'w')
    for i in range (32):
        encoding = ""
        current_element = '0'
        current_count = 0
        maxPattern = 0
        for bit in img[i]:
            if bit == current_element:
                current_count += 1
            else:
                encoding += str(bin(int(current_count))[2:].zfill(16))+' '
                current_count = 1
                current_element = bit
        encoding += str(bin(int(current_count))[2:].zfill(16))
        f.write(encoding+'\n')

input_path = argv[1]
output_path = argv[2]

for image_name in listdir(input_path):
    image_path = join(input_path, image_name)
    RLE_image(ConvertToBinary(normalize_image(read_file(image_path))),output_path,image_name)
