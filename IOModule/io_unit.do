vsim work.IO_Unit
# vsim work.IO_Unit 
# Start time: 00:30:18 on May 23,2021
# Loading work.IO_Unit
# Loading work.Decompressor
# Loading work.IO_Interface
# Loading work.IO_Controller
add wave -position insertpoint  \
sim:/IO_Unit/sectionSize \
sim:/IO_Unit/rowSize \
sim:/IO_Unit/decompressedData \
sim:/IO_Unit/inputSection \
sim:/IO_Unit/load \
sim:/IO_Unit/clk \
sim:/IO_Unit/compressedData \
sim:/IO_Unit/de_en \
sim:/IO_Unit/in_en
force -freeze sim:/IO_Unit/load 0 0
force -freeze sim:/IO_Unit/cnn_img 1 0
force -freeze sim:/IO_Unit/interrupt 1 0
force -freeze sim:/IO_Unit/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/IO_Unit/inputSection 0001 0
run
force -freeze sim:/IO_Unit/inputSection 0010 0
run
force -freeze sim:/IO_Unit/inputSection 0100 0
run
force -freeze sim:/IO_Unit/inputSection 0100 0
run
force -freeze sim:/IO_Unit/load 1 0
run
force -freeze sim:/IO_Unit/load 0 0
force -freeze sim:/IO_Unit/inputSection 1000 0
run
force -freeze sim:/IO_Unit/inputSection 1000 0
run
force -freeze sim:/IO_Unit/load 1 0
run
force -freeze sim:/IO_Unit/load 0 0
force -freeze sim:/IO_Unit/inputSection 0010 0
run
force -freeze sim:/IO_Unit/inputSection 0010 0
run
force -freeze sim:/IO_Unit/load 1 0
run
force -freeze sim:/IO_Unit/load 0 0
force -freeze sim:/IO_Unit/inputSection 0000 0
run
force -freeze sim:/IO_Unit/inputSection 1000 0
run
force -freeze sim:/IO_Unit/load 1 0
run
force -freeze sim:/IO_Unit/load 0 0
force -freeze sim:/IO_Unit/inputSection 0000 0
run
force -freeze sim:/IO_Unit/inputSection 0001 0
run
force -freeze sim:/IO_Unit/load 1 0
run


