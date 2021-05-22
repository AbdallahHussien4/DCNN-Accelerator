import cv2 as cv
import scipy.signal as sig
import skimage.io
import numpy as np
from skimage.measure import block_reduce

img = skimage.io.imread("test1.jpg", as_gray=True)

filter = np.asarray([[0.5,0.5,0.5,0.5,0.5],
                     [0.5,0.5,0.5,0.5,0.5],
                     [0.5,0.5,0.5,0.5,0.5],
                     [0.5,0.5,0.5,0.5,0.5],
                     [0.5,0.5,0.5,0.5,0.5]
                    ], dtype=np.float16)

convolvedImg = sig.convolve2d(img, filter, mode="same")

height, width = convolvedImg.shape[:2]

convolvedImg = convolvedImg[2:int(height)-2,2:int(width)-2]

print(convolvedImg.shape)

np.savetxt('conv.out', convolvedImg, delimiter=',')

pooled = block_reduce(convolvedImg, (2,2), np.mean)

print(pooled.shape)

np.savetxt('pool.out', pooled, delimiter=',')