vsim -gui work.pooling_testbench_Synth
add wave -position insertpoint  \
sim:/pooling_testbench_Synth/image_in \
sim:/pooling_testbench_Synth/start \
-radix decimal sim:/pooling_testbench_Synth/pixel_out \
sim:/pooling_testbench_Synth/finish
run 60000 ps
