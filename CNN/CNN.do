vsim -gui work.CNN
add wave -position end  sim:/CNN/start
add wave -position end  sim:/CNN/reset
add wave -position end  sim:/CNN/clk
add wave -position end  sim:/CNN/finish
add wave -position end  sim:/CNN/layerCounter
add wave -position end  sim:/CNN/poolingCounter
add wave -position end  sim:/CNN/poolingState
add wave -position end  sim:/CNN/poolingWindowX
add wave -position end  sim:/CNN/poolingWindowY
add wave -position end  sim:/CNN/DMA_start
add wave -position end  sim:/CNN/DMA_finish
add wave -position end  sim:/CNN/readAdress
add wave -position end  sim:/CNN/writeAdress
add wave -position 9  sim:/CNN/pooling_result
add wave -position end  sim:/CNN/featureMapNumber
add wave -position end  sim:/CNN/featureMapSize
add wave -position end  sim:/CNN/DMA_CNN_input_data
add wave -position end  sim:/CNN/DMA_CNN_output_data
add wave -position end  sim:/CNN/Mem_input_data
add wave -position end  sim:/CNN/Mem_output_data
add wave -position end  sim:/CNN/Mem_enable
add wave -position end  sim:/CNN/Mem_finish
add wave -position end  sim:/CNN/Mem_write
add wave -position end  sim:/CNN/RAM1/output_data
add wave -position end  sim:/CNN/RAM1/mem

force -freeze sim:/CNN/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/CNN/start 1 0
force -freeze sim:/CNN/reset 1 0
run 50 ps
force -freeze sim:/CNN/reset 0 0
run 100 us