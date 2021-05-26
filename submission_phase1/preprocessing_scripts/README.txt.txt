How to run the scripts:

- Compress.py:
This file take a directory full of images and outputs all the output LRE compressed images in another folder.
How to run: 
python Compress.py [input directory] [output directory]

- cnn_script.py:
This file takes the CNN parameters and turn them to a binary file to be read by simulation.
The file that it uses must be named "params.txt" in same directory and outputs a file names "input_cnn" in same directory.
Use the params.txt file in cnn_params folder in submission.
How to run:
python cnn_script.py
