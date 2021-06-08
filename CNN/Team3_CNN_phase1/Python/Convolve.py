import cv2 as cv
import scipy.signal as sig
import skimage.io
import numpy as np
from skimage.measure import block_reduce
import os

imageArray = []
with open("Image.txt", 'r') as f:
    for line in f.readlines():
        imageArray.append(line.split(' '))

img = np.array(imageArray)
img = img.astype(float)

filterArray = []
with open("Filter.txt", 'r') as f:
    for line in f.readlines():
        filterArray.append(line.split(' '))

filter = np.asarray(filterArray, dtype=np.float16)

# CONVOLUTION
convolvedImgFirst = sig.convolve2d(img, filter, mode="same")
height, width = convolvedImgFirst.shape[:2]
convolvedImgFirst = convolvedImgFirst[2:int(height)-2,2:int(width)-2]
np.savetxt('FirstLayer.out', convolvedImgFirst, fmt='%1.3f')

# POOLING
pooledFirst = block_reduce(convolvedImgFirst, (2,2), np.mean)
np.savetxt('SecondLayer.out', pooledFirst, fmt='%1.3f')

# CONVOLUTION
convolvedImgSecond = sig.convolve2d(pooledFirst, filter, mode="same") * 6
height, width = convolvedImgSecond.shape[:2]
convolvedImgSecond = convolvedImgSecond[2:int(height)-2,2:int(width)-2]
np.savetxt('ThirdLayer.out', convolvedImgSecond, fmt='%1.3f')

# POOLING
pooledSecond = block_reduce(convolvedImgSecond, (2,2), np.mean)
np.savetxt('FourthLayer.out', pooledSecond, fmt='%1.3f')

# CONVOLUTION
convolvedImgThird = sig.convolve2d(pooledSecond, filter, mode="same") * 16
height, width = convolvedImgThird.shape[:2]
convolvedImgThird = convolvedImgThird[2:int(height)-2,2:int(width)-2]
np.savetxt('FifthLayer.out', convolvedImgThird, fmt='%1.3f')