vsim -gui work.pooling_testbench
add wave -position insertpoint  \
sim:/pooling_testbench/image \
sim:/pooling_testbench/start \
sim:/pooling_testbench/pixel_out \
sim:/pooling_testbench/finish
run 60000 ps
