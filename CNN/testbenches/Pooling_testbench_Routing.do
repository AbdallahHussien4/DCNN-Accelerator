vsim -gui work.pooling_testbench_Routing
add wave -position insertpoint  \
sim:/pooling_testbench_Routing/image_in \
sim:/pooling_testbench_Routing/start \
-radix decimal sim:/pooling_testbench_Routing/pixel_out \
sim:/pooling_testbench_Routing/finish
run 60000 ps
