from cv2 import imread
from cv2 import IMREAD_GRAYSCALE
from bitstring import BitArray
from os import listdir
from os.path import join, splitext
from sys import argv
from numpy import float32
from numpy import uint16
from numpy import append
from numpy import zeros

# Read and padding the file
def read_file(file_path='00001.bmp'):
    img = imread(file_path, IMREAD_GRAYSCALE)
    # print(img[14,:])
    mat = uint16(zeros((32,32)))
    mat[2:30,2:30] =img
    # print(mat[16,:])
    return mat

# Convert image to binary
def ConvertToBinary(img):
    a = img
    b = [""]*32
    for i in range (32):
        for j in range(32):
            b[i] +=str(bin(int(a[i][j]))[2:].zfill(16))

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
    RLE_image(ConvertToBinary(read_file(image_path)),output_path,image_name)
    mervat <3
