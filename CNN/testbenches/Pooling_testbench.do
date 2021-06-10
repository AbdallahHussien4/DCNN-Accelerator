vsim -gui work.pooling_testbench_RTL
add wave -position insertpoint  \
sim:/pooling_testbench_RTL/image_in \
sim:/pooling_testbench_RTL/start \
-radix decimal sim:/pooling_testbench_RTL/pixel_out \
sim:/pooling_testbench_RTL/finish
run 60000 ps
