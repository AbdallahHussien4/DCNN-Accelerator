vsim -gui work.Filter_Buffer_testbench
add wave -position end  sim:/Filter_Buffer_testbench/FB_bias
add wave -position end  sim:/Filter_Buffer_testbench/FB_bias_or_filter
add wave -position end  sim:/Filter_Buffer_testbench/FB_filter
add wave -position end  sim:/Filter_Buffer_testbench/FB_filter_buffer_finish
add wave -position end  sim:/Filter_Buffer_testbench/FB_index_bias
add wave -position end  sim:/Filter_Buffer_testbench/FB_index_filter
add wave -position end  sim:/Filter_Buffer_testbench/FB_output_bias
add wave -position end  sim:/Filter_Buffer_testbench/FB_write
add wave -position end  sim:/Filter_Buffer_testbench/N
add wave -position end  sim:/Filter_Buffer_testbench/filter
add wave -position end  sim:/Filter_Buffer_testbench/i
add wave -position end  sim:/Filter_Buffer_testbench/index_filter
add wave -position end  sim:/Filter_Buffer_testbench/period
add wave -position end  sim:/Filter_Buffer_testbench/reset
add wave -position end  sim:/Filter_Buffer_testbench/x
add wave -position end  sim:/Filter_Buffer_testbench/y
run 60000 ps
