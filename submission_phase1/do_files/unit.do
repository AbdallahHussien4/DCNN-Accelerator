vsim work.IO_Unit
# vsim work.IO_Unit 
# Start time: 13:27:24 on May 26,2021
# Loading work.IO_Unit
# Loading work.Decompressor
# Loading work.IO_Interface
# Loading work.IO_Controller
# Loading work.DMA
# Loading sv_std.std
# Loading work.RAM
add wave -position insertpoint  \
sim:/IO_Unit/decompressedData \
sim:/IO_Unit/inputSection \
sim:/IO_Unit/load_process \
sim:/IO_Unit/cnn_img \
sim:/IO_Unit/rst \
sim:/IO_Unit/interrupt \
sim:/IO_Unit/clk \
sim:/IO_Unit/inputSection \
sim:/IO_Unit/dma_done \
sim:/IO_Unit/done \
sim:/IO_Unit/decompressor_done \
sim:/IO_Unit/output_to_ram \
sim:/IO_Unit/ram_address \
sim:/IO_Unit/dma_enable \
sim:/IO_Unit/ram_write

force -freeze sim:/IO_Unit/rst 0 0
run
force -freeze sim:/IO_Unit/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/IO_Unit/interrupt 1 0
force -freeze sim:/IO_Unit/cnn_img 1 0
force -freeze sim:/IO_Unit/load_process 0 0
force -freeze sim:/IO_Unit/inputSection 0000000000000010 0
run
force -freeze sim:/IO_Unit/inputSection 0000000000001010 0
run
force -freeze sim:/IO_Unit/load_process 1 0
run 3200
run

force -freeze sim:/IO_Unit/load_process 0 0
force -freeze sim:/IO_Unit/inputSection 0000000000001010 0
run
force -freeze sim:/IO_Unit/inputSection 0000000000000010 0
run
force -freeze sim:/IO_Unit/load_process 1 0
run 3200
run


