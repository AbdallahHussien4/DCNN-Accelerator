vsim -gui work.CNN
# add wave -position end  sim:/CNN/start
# add wave -position end  sim:/CNN/reset
add wave -position end  sim:/CNN/clk
add wave -position end  sim:/CNN/finish
add wave -position end  sim:/CNN/layerCounter
# add wave -position end  sim:/CNN/poolingCounter
# add wave -position end  sim:/CNN/poolingState
# add wave -position end  sim:/CNN/poolingWindowX
# add wave -position end  sim:/CNN/poolingWindowY
add wave -position 5  sim:/CNN/kernelCounter
add wave -position end  sim:/CNN/convWindowX
add wave -position end  sim:/CNN/convWindowY
add wave -position end  sim:/CNN/filterCounter
add wave -position end  sim:/CNN/conv_start
add wave -position end  sim:/CNN/conv_finish
add wave -position end  sim:/CNN/CONV1/window
add wave -position end  sim:/CNN/CONV1/filter
add wave -position end  sim:/CNN/CONV1/products
add wave -position end  sim:/CNN/convLocalResult
add wave -position end  sim:/CNN/CONV1/convResult
add wave -position end  sim:/CNN/DMA_start
add wave -position end  sim:/CNN/DMA_finish
add wave -position end  sim:/CNN/convResetState
# add wave -position end  sim:/CNN/readAdress
# add wave -position end  sim:/CNN/writeAdress
# add wave -position end  sim:/CNN/pooling_result
# add wave -position end  sim:/CNN/featureMapNumber
# add wave -position end  sim:/CNN/featureMapSize
add wave -position end  sim:/CNN/DMA_CNN_input_data
add wave -position end  sim:/CNN/DMA_CNN_output_data
add wave -position end  sim:/CNN/Mem_input_data
add wave -position end  sim:/CNN/Mem_output_data
add wave -position end  sim:/CNN/Mem_enable
add wave -position end  sim:/CNN/Mem_finish
add wave -position end  sim:/CNN/Mem_write
add wave -position end  sim:/CNN/RAM1/address
add wave -position end  sim:/CNN/RAM1/output_data
# add wave -position end  sim:/CNN/RAM1/input_data
add wave -position end  sim:/CNN/FILTER_BUFFER/buffer
add wave -position end  sim:/CNN/FILTER_BUFFER/bias_buffer
add wave -position end  sim:/CNN/FILTER_BUFFER/finish
add wave -position end  sim:/CNN/FILTER_BUFFER/input_filter
add wave -position end  sim:/CNN/FILTER_BUFFER/read
add wave -position end  sim:/CNN/DMA1/filter_number
add wave -position end  sim:/CNN/DMA1/filter_index
add wave -position end  sim:/CNN/DMA1/bias
add wave -position end  sim:/CNN/DMA1/biasCounter
add wave -position end  sim:/CNN/DMA1/inner_address





force -freeze sim:/CNN/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/CNN/start 1 0
force -freeze sim:/CNN/reset 1 0
run 50 ps
force -freeze sim:/CNN/reset 0 0
run 100 us