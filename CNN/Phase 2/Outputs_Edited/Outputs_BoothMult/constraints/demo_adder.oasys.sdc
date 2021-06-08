#
# Created by 
#   ../bin/Linux-x86_64-O/oasysGui 19.2-p002 on Wed May  5 19:27:51 2021
# (C) Mentor Graphics Corporation
#
set_units -time ns -capacitance ff -resistance kohm -power nW -voltage V -current mA
create_clock -period 60 -waveform {0 30} -name vsysclk 
group_path -name I2R -from [list [get_ports {multiplier[0]}] [get_ports {multiplier[1]}] [get_ports {multiplier[2]}] [get_ports {multiplier[3]}] [get_ports {multiplier[4]}] [get_ports {multiplier[5]}] [get_ports {multiplier[6]}] [get_ports {multiplier[7]}] [get_ports {multiplier[8]}] [get_ports {multiplier[9]}] [get_ports {multiplier[10]}] [get_ports {multiplier[11]}] [get_ports {multiplier[12]}] [get_ports {multiplier[13]}] [get_ports {multiplier[14]}] [get_ports {multiplier[15]}] [get_ports {multiplicand[0]}] [get_ports {multiplicand[1]}] [get_ports {multiplicand[2]}] [get_ports {multiplicand[3]}] [get_ports {multiplicand[4]}] [get_ports {multiplicand[5]}] [get_ports {multiplicand[6]}] [get_ports {multiplicand[7]}] [get_ports {multiplicand[8]}] [get_ports {multiplicand[9]}] [get_ports {multiplicand[10]}] [get_ports {multiplicand[11]}] [get_ports {multiplicand[12]}] [get_ports {multiplicand[13]}] [get_ports {multiplicand[14]}] [get_ports {multiplicand[15]}]]
group_path -name I2O -from [list [get_ports {multiplier[0]}] [get_ports {multiplier[1]}] [get_ports {multiplier[2]}] [get_ports {multiplier[3]}] [get_ports {multiplier[4]}] [get_ports {multiplier[5]}] [get_ports {multiplier[6]}] [get_ports {multiplier[7]}] [get_ports {multiplier[8]}] [get_ports {multiplier[9]}] [get_ports {multiplier[10]}] [get_ports {multiplier[11]}] [get_ports {multiplier[12]}] [get_ports {multiplier[13]}] [get_ports {multiplier[14]}] [get_ports {multiplier[15]}] [get_ports {multiplicand[0]}] [get_ports {multiplicand[1]}] [get_ports {multiplicand[2]}] [get_ports {multiplicand[3]}] [get_ports {multiplicand[4]}] [get_ports {multiplicand[5]}] [get_ports {multiplicand[6]}] [get_ports {multiplicand[7]}] [get_ports {multiplicand[8]}] [get_ports {multiplicand[9]}] [get_ports {multiplicand[10]}] [get_ports {multiplicand[11]}] [get_ports {multiplicand[12]}] [get_ports {multiplicand[13]}] [get_ports {multiplicand[14]}] [get_ports {multiplicand[15]}]]  -to [list [get_ports {product[0]}] [get_ports {product[1]}] [get_ports {product[2]}] [get_ports {product[3]}] [get_ports {product[4]}] [get_ports {product[5]}] [get_ports {product[6]}] [get_ports {product[7]}] [get_ports {product[8]}] [get_ports {product[9]}] [get_ports {product[10]}] [get_ports {product[11]}] [get_ports {product[12]}] [get_ports {product[13]}] [get_ports {product[14]}] [get_ports {product[15]}] [get_ports {product[16]}] [get_ports {product[17]}] [get_ports {product[18]}] [get_ports {product[19]}] [get_ports {product[20]}] [get_ports {product[21]}] [get_ports {product[22]}] [get_ports {product[23]}] [get_ports {product[24]}] [get_ports {product[25]}] [get_ports {product[26]}] [get_ports {product[27]}] [get_ports {product[28]}] [get_ports {product[29]}] [get_ports {product[30]}] [get_ports {product[31]}]]
group_path -name R2O -to [list [get_ports {product[0]}] [get_ports {product[1]}] [get_ports {product[2]}] [get_ports {product[3]}] [get_ports {product[4]}] [get_ports {product[5]}] [get_ports {product[6]}] [get_ports {product[7]}] [get_ports {product[8]}] [get_ports {product[9]}] [get_ports {product[10]}] [get_ports {product[11]}] [get_ports {product[12]}] [get_ports {product[13]}] [get_ports {product[14]}] [get_ports {product[15]}] [get_ports {product[16]}] [get_ports {product[17]}] [get_ports {product[18]}] [get_ports {product[19]}] [get_ports {product[20]}] [get_ports {product[21]}] [get_ports {product[22]}] [get_ports {product[23]}] [get_ports {product[24]}] [get_ports {product[25]}] [get_ports {product[26]}] [get_ports {product[27]}] [get_ports {product[28]}] [get_ports {product[29]}] [get_ports {product[30]}] [get_ports {product[31]}]]
set_load 10 [get_ports {product[31]}]
set_load 10 [get_ports {product[30]}]
set_load 10 [get_ports {product[29]}]
set_load 10 [get_ports {product[28]}]
set_load 10 [get_ports {product[27]}]
set_load 10 [get_ports {product[26]}]
set_load 10 [get_ports {product[25]}]
set_load 10 [get_ports {product[24]}]
set_load 10 [get_ports {product[23]}]
set_load 10 [get_ports {product[22]}]
set_load 10 [get_ports {product[21]}]
set_load 10 [get_ports {product[20]}]
set_load 10 [get_ports {product[19]}]
set_load 10 [get_ports {product[18]}]
set_load 10 [get_ports {product[17]}]
set_load 10 [get_ports {product[16]}]
set_load 10 [get_ports {product[15]}]
set_load 10 [get_ports {product[14]}]
set_load 10 [get_ports {product[13]}]
set_load 10 [get_ports {product[12]}]
set_load 10 [get_ports {product[11]}]
set_load 10 [get_ports {product[10]}]
set_load 10 [get_ports {product[9]}]
set_load 10 [get_ports {product[8]}]
set_load 10 [get_ports {product[7]}]
set_load 10 [get_ports {product[6]}]
set_load 10 [get_ports {product[5]}]
set_load 10 [get_ports {product[4]}]
set_load 10 [get_ports {product[3]}]
set_load 10 [get_ports {product[2]}]
set_load 10 [get_ports {product[1]}]
set_load 10 [get_ports {product[0]}]
set_input_transition 0.1 [get_ports {multiplicand[15]}]
set_input_transition 0.1 [get_ports {multiplicand[14]}]
set_input_transition 0.1 [get_ports {multiplicand[13]}]
set_input_transition 0.1 [get_ports {multiplicand[12]}]
set_input_transition 0.1 [get_ports {multiplicand[11]}]
set_input_transition 0.1 [get_ports {multiplicand[10]}]
set_input_transition 0.1 [get_ports {multiplicand[9]}]
set_input_transition 0.1 [get_ports {multiplicand[8]}]
set_input_transition 0.1 [get_ports {multiplicand[7]}]
set_input_transition 0.1 [get_ports {multiplicand[6]}]
set_input_transition 0.1 [get_ports {multiplicand[5]}]
set_input_transition 0.1 [get_ports {multiplicand[4]}]
set_input_transition 0.1 [get_ports {multiplicand[3]}]
set_input_transition 0.1 [get_ports {multiplicand[2]}]
set_input_transition 0.1 [get_ports {multiplicand[1]}]
set_input_transition 0.1 [get_ports {multiplicand[0]}]
set_input_transition 0.1 [get_ports {multiplier[15]}]
set_input_transition 0.1 [get_ports {multiplier[14]}]
set_input_transition 0.1 [get_ports {multiplier[13]}]
set_input_transition 0.1 [get_ports {multiplier[12]}]
set_input_transition 0.1 [get_ports {multiplier[11]}]
set_input_transition 0.1 [get_ports {multiplier[10]}]
set_input_transition 0.1 [get_ports {multiplier[9]}]
set_input_transition 0.1 [get_ports {multiplier[8]}]
set_input_transition 0.1 [get_ports {multiplier[7]}]
set_input_transition 0.1 [get_ports {multiplier[6]}]
set_input_transition 0.1 [get_ports {multiplier[5]}]
set_input_transition 0.1 [get_ports {multiplier[4]}]
set_input_transition 0.1 [get_ports {multiplier[3]}]
set_input_transition 0.1 [get_ports {multiplier[2]}]
set_input_transition 0.1 [get_ports {multiplier[1]}]
set_input_transition 0.1 [get_ports {multiplier[0]}]
set_input_delay 0.7 [get_ports {multiplicand[15]}]
set_input_delay 0.7 [get_ports {multiplicand[14]}]
set_input_delay 0.7 [get_ports {multiplicand[13]}]
set_input_delay 0.7 [get_ports {multiplicand[12]}]
set_input_delay 0.7 [get_ports {multiplicand[11]}]
set_input_delay 0.7 [get_ports {multiplicand[10]}]
set_input_delay 0.7 [get_ports {multiplicand[9]}]
set_input_delay 0.7 [get_ports {multiplicand[8]}]
set_input_delay 0.7 [get_ports {multiplicand[7]}]
set_input_delay 0.7 [get_ports {multiplicand[6]}]
set_input_delay 0.7 [get_ports {multiplicand[5]}]
set_input_delay 0.7 [get_ports {multiplicand[4]}]
set_input_delay 0.7 [get_ports {multiplicand[3]}]
set_input_delay 0.7 [get_ports {multiplicand[2]}]
set_input_delay 0.7 [get_ports {multiplicand[1]}]
set_input_delay 0.7 [get_ports {multiplicand[0]}]
set_input_delay 0.7 [get_ports {multiplier[15]}]
set_input_delay 0.7 [get_ports {multiplier[14]}]
set_input_delay 0.7 [get_ports {multiplier[13]}]
set_input_delay 0.7 [get_ports {multiplier[12]}]
set_input_delay 0.7 [get_ports {multiplier[11]}]
set_input_delay 0.7 [get_ports {multiplier[10]}]
set_input_delay 0.7 [get_ports {multiplier[9]}]
set_input_delay 0.7 [get_ports {multiplier[8]}]
set_input_delay 0.7 [get_ports {multiplier[7]}]
set_input_delay 0.7 [get_ports {multiplier[6]}]
set_input_delay 0.7 [get_ports {multiplier[5]}]
set_input_delay 0.7 [get_ports {multiplier[4]}]
set_input_delay 0.7 [get_ports {multiplier[3]}]
set_input_delay 0.7 [get_ports {multiplier[2]}]
set_input_delay 0.7 [get_ports {multiplier[1]}]
set_input_delay 0.7 [get_ports {multiplier[0]}]
set_output_delay 18 -clock vsysclk [get_ports {product[31]}]
set_output_delay 18 -clock vsysclk [get_ports {product[30]}]
set_output_delay 18 -clock vsysclk [get_ports {product[29]}]
set_output_delay 18 -clock vsysclk [get_ports {product[28]}]
set_output_delay 18 -clock vsysclk [get_ports {product[27]}]
set_output_delay 18 -clock vsysclk [get_ports {product[26]}]
set_output_delay 18 -clock vsysclk [get_ports {product[25]}]
set_output_delay 18 -clock vsysclk [get_ports {product[24]}]
set_output_delay 18 -clock vsysclk [get_ports {product[23]}]
set_output_delay 18 -clock vsysclk [get_ports {product[22]}]
set_output_delay 18 -clock vsysclk [get_ports {product[21]}]
set_output_delay 18 -clock vsysclk [get_ports {product[20]}]
set_output_delay 18 -clock vsysclk [get_ports {product[19]}]
set_output_delay 18 -clock vsysclk [get_ports {product[18]}]
set_output_delay 18 -clock vsysclk [get_ports {product[17]}]
set_output_delay 18 -clock vsysclk [get_ports {product[16]}]
set_output_delay 18 -clock vsysclk [get_ports {product[15]}]
set_output_delay 18 -clock vsysclk [get_ports {product[14]}]
set_output_delay 18 -clock vsysclk [get_ports {product[13]}]
set_output_delay 18 -clock vsysclk [get_ports {product[12]}]
set_output_delay 18 -clock vsysclk [get_ports {product[11]}]
set_output_delay 18 -clock vsysclk [get_ports {product[10]}]
set_output_delay 18 -clock vsysclk [get_ports {product[9]}]
set_output_delay 18 -clock vsysclk [get_ports {product[8]}]
set_output_delay 18 -clock vsysclk [get_ports {product[7]}]
set_output_delay 18 -clock vsysclk [get_ports {product[6]}]
set_output_delay 18 -clock vsysclk [get_ports {product[5]}]
set_output_delay 18 -clock vsysclk [get_ports {product[4]}]
set_output_delay 18 -clock vsysclk [get_ports {product[3]}]
set_output_delay 18 -clock vsysclk [get_ports {product[2]}]
set_output_delay 18 -clock vsysclk [get_ports {product[1]}]
set_output_delay 18 -clock vsysclk [get_ports {product[0]}]
set_operating_conditions  -library  [get_libs {NangateOpenCellLibrary}] -max  typical
