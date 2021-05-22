vsim -gui work.Filter_Buffer_testbench
add wave -position insertpoint  \
sim:/Filter_Buffer_testbench/input_filter \
sim:/Filter_Buffer_testbench/output_filter \
sim:/Filter_Buffer_testbench/read \
sim:/Filter_Buffer_testbench/finish
run 60000 ps
