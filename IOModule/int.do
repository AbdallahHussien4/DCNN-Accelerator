vsim work.INT_D
# vsim work.INT_D 
# Start time: 22:20:33 on May 25,2021
# Loading work.INT_D
# Loading work.DMA
# Loading sv_std.std
# Loading work.RAM
add wave -position insertpoint  \
sim:/INT_D/clk \
sim:/INT_D/dma_enable \
sim:/INT_D/decompressedRow \
sim:/INT_D/done \
sim:/INT_D/write \
sim:/INT_D/ram_en \
sim:/INT_D/finish \
sim:/INT_D/blockToWrite \
sim:/INT_D/address
force -freeze sim:/INT_D/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/INT_D/decompressedRow 00000001111111111111111000000000000000010101010101010101010101010101010 0
force -freeze sim:/INT_D/dma_enable 1 0
run

run
run
run
run