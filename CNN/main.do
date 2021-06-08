vsim -gui work.main
add wave -position end  sim:/main/clk
add wave -position end  sim:/main/reset
add wave -position end  sim:/main/start
force -freeze sim:/main/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/main/reset 1 0
force -freeze sim:/main/start 1 0
run 50 ps
force -freeze sim:/main/reset 0 0
#run 100 us
