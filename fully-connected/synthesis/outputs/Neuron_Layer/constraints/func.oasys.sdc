#
# Created by 
#   ../bin/Linux-x86_64-O/oasysGui 19.2-p002 on Thu May  6 01:21:53 2021
# (C) Mentor Graphics Corporation
#
set_units -time ns -capacitance ff -resistance kohm -power nW -voltage V -current mA
create_clock -period 60 -waveform {0 30} -name vsysclk 
group_path -name I2R -from [list [get_ports reset] [get_ports {load_address[0]}] [get_ports {load_address[1]}] [get_ports {load_address[2]}] [get_ports {load_address[3]}] [get_ports {load_address[4]}] [get_ports {load_address[5]}] [get_ports {load_address[6]}] [get_ports {load_address[7]}] [get_ports {load_address[8]}] [get_ports {load_address[9]}] [get_ports {load_address[10]}] [get_ports {load_address[11]}] [get_ports {load_address[12]}] [get_ports {load_address[13]}] [get_ports {load_address[14]}] [get_ports {load_address[15]}] [get_ports {load_value[0]}] [get_ports {load_value[1]}] [get_ports {load_value[2]}] [get_ports {load_value[3]}] [get_ports {load_value[4]}] [get_ports {load_value[5]}] [get_ports {load_value[6]}] [get_ports {load_value[7]}] [get_ports {load_value[8]}] [get_ports {load_value[9]}] [get_ports {load_value[10]}] [get_ports {load_value[11]}] [get_ports {load_value[12]}] [get_ports {load_value[13]}] [get_ports {load_value[14]}] [get_ports {load_value[15]}] [get_ports load_en] [get_ports clk]]
group_path -name I2O -from [list [get_ports reset] [get_ports {load_address[0]}] [get_ports {load_address[1]}] [get_ports {load_address[2]}] [get_ports {load_address[3]}] [get_ports {load_address[4]}] [get_ports {load_address[5]}] [get_ports {load_address[6]}] [get_ports {load_address[7]}] [get_ports {load_address[8]}] [get_ports {load_address[9]}] [get_ports {load_address[10]}] [get_ports {load_address[11]}] [get_ports {load_address[12]}] [get_ports {load_address[13]}] [get_ports {load_address[14]}] [get_ports {load_address[15]}] [get_ports {load_value[0]}] [get_ports {load_value[1]}] [get_ports {load_value[2]}] [get_ports {load_value[3]}] [get_ports {load_value[4]}] [get_ports {load_value[5]}] [get_ports {load_value[6]}] [get_ports {load_value[7]}] [get_ports {load_value[8]}] [get_ports {load_value[9]}] [get_ports {load_value[10]}] [get_ports {load_value[11]}] [get_ports {load_value[12]}] [get_ports {load_value[13]}] [get_ports {load_value[14]}] [get_ports {load_value[15]}] [get_ports load_en] [get_ports clk]]  -to [list [get_ports {values[1][0]}] [get_ports {values[1][1]}] [get_ports {values[1][2]}] [get_ports {values[1][3]}] [get_ports {values[1][4]}] [get_ports {values[1][5]}] [get_ports {values[1][6]}] [get_ports {values[1][7]}] [get_ports {values[1][8]}] [get_ports {values[1][9]}] [get_ports {values[1][10]}] [get_ports {values[1][11]}] [get_ports {values[1][12]}] [get_ports {values[1][13]}] [get_ports {values[1][14]}] [get_ports {values[1][15]}] [get_ports {values[0][0]}] [get_ports {values[0][1]}] [get_ports {values[0][2]}] [get_ports {values[0][3]}] [get_ports {values[0][4]}] [get_ports {values[0][5]}] [get_ports {values[0][6]}] [get_ports {values[0][7]}] [get_ports {values[0][8]}] [get_ports {values[0][9]}] [get_ports {values[0][10]}] [get_ports {values[0][11]}] [get_ports {values[0][12]}] [get_ports {values[0][13]}] [get_ports {values[0][14]}] [get_ports {values[0][15]}]]
group_path -name R2O -to [list [get_ports {values[1][0]}] [get_ports {values[1][1]}] [get_ports {values[1][2]}] [get_ports {values[1][3]}] [get_ports {values[1][4]}] [get_ports {values[1][5]}] [get_ports {values[1][6]}] [get_ports {values[1][7]}] [get_ports {values[1][8]}] [get_ports {values[1][9]}] [get_ports {values[1][10]}] [get_ports {values[1][11]}] [get_ports {values[1][12]}] [get_ports {values[1][13]}] [get_ports {values[1][14]}] [get_ports {values[1][15]}] [get_ports {values[0][0]}] [get_ports {values[0][1]}] [get_ports {values[0][2]}] [get_ports {values[0][3]}] [get_ports {values[0][4]}] [get_ports {values[0][5]}] [get_ports {values[0][6]}] [get_ports {values[0][7]}] [get_ports {values[0][8]}] [get_ports {values[0][9]}] [get_ports {values[0][10]}] [get_ports {values[0][11]}] [get_ports {values[0][12]}] [get_ports {values[0][13]}] [get_ports {values[0][14]}] [get_ports {values[0][15]}]]
set_load 10 [get_ports {values[0][15]}]
set_load 10 [get_ports {values[0][14]}]
set_load 10 [get_ports {values[0][13]}]
set_load 10 [get_ports {values[0][12]}]
set_load 10 [get_ports {values[0][11]}]
set_load 10 [get_ports {values[0][10]}]
set_load 10 [get_ports {values[0][9]}]
set_load 10 [get_ports {values[0][8]}]
set_load 10 [get_ports {values[0][7]}]
set_load 10 [get_ports {values[0][6]}]
set_load 10 [get_ports {values[0][5]}]
set_load 10 [get_ports {values[0][4]}]
set_load 10 [get_ports {values[0][3]}]
set_load 10 [get_ports {values[0][2]}]
set_load 10 [get_ports {values[0][1]}]
set_load 10 [get_ports {values[0][0]}]
set_load 10 [get_ports {values[1][15]}]
set_load 10 [get_ports {values[1][14]}]
set_load 10 [get_ports {values[1][13]}]
set_load 10 [get_ports {values[1][12]}]
set_load 10 [get_ports {values[1][11]}]
set_load 10 [get_ports {values[1][10]}]
set_load 10 [get_ports {values[1][9]}]
set_load 10 [get_ports {values[1][8]}]
set_load 10 [get_ports {values[1][7]}]
set_load 10 [get_ports {values[1][6]}]
set_load 10 [get_ports {values[1][5]}]
set_load 10 [get_ports {values[1][4]}]
set_load 10 [get_ports {values[1][3]}]
set_load 10 [get_ports {values[1][2]}]
set_load 10 [get_ports {values[1][1]}]
set_load 10 [get_ports {values[1][0]}]
set_input_transition 0.1 [get_ports clk]
set_input_transition 0.1 [get_ports load_en]
set_input_transition 0.1 [get_ports {load_value[15]}]
set_input_transition 0.1 [get_ports {load_value[14]}]
set_input_transition 0.1 [get_ports {load_value[13]}]
set_input_transition 0.1 [get_ports {load_value[12]}]
set_input_transition 0.1 [get_ports {load_value[11]}]
set_input_transition 0.1 [get_ports {load_value[10]}]
set_input_transition 0.1 [get_ports {load_value[9]}]
set_input_transition 0.1 [get_ports {load_value[8]}]
set_input_transition 0.1 [get_ports {load_value[7]}]
set_input_transition 0.1 [get_ports {load_value[6]}]
set_input_transition 0.1 [get_ports {load_value[5]}]
set_input_transition 0.1 [get_ports {load_value[4]}]
set_input_transition 0.1 [get_ports {load_value[3]}]
set_input_transition 0.1 [get_ports {load_value[2]}]
set_input_transition 0.1 [get_ports {load_value[1]}]
set_input_transition 0.1 [get_ports {load_value[0]}]
set_input_transition 0.1 [get_ports {load_address[15]}]
set_input_transition 0.1 [get_ports {load_address[14]}]
set_input_transition 0.1 [get_ports {load_address[13]}]
set_input_transition 0.1 [get_ports {load_address[12]}]
set_input_transition 0.1 [get_ports {load_address[11]}]
set_input_transition 0.1 [get_ports {load_address[10]}]
set_input_transition 0.1 [get_ports {load_address[9]}]
set_input_transition 0.1 [get_ports {load_address[8]}]
set_input_transition 0.1 [get_ports {load_address[7]}]
set_input_transition 0.1 [get_ports {load_address[6]}]
set_input_transition 0.1 [get_ports {load_address[5]}]
set_input_transition 0.1 [get_ports {load_address[4]}]
set_input_transition 0.1 [get_ports {load_address[3]}]
set_input_transition 0.1 [get_ports {load_address[2]}]
set_input_transition 0.1 [get_ports {load_address[1]}]
set_input_transition 0.1 [get_ports {load_address[0]}]
set_input_transition 0.1 [get_ports reset]
set_input_delay 0.7 [get_ports clk]
set_input_delay 0.7 [get_ports load_en]
set_input_delay 0.7 [get_ports {load_value[15]}]
set_input_delay 0.7 [get_ports {load_value[14]}]
set_input_delay 0.7 [get_ports {load_value[13]}]
set_input_delay 0.7 [get_ports {load_value[12]}]
set_input_delay 0.7 [get_ports {load_value[11]}]
set_input_delay 0.7 [get_ports {load_value[10]}]
set_input_delay 0.7 [get_ports {load_value[9]}]
set_input_delay 0.7 [get_ports {load_value[8]}]
set_input_delay 0.7 [get_ports {load_value[7]}]
set_input_delay 0.7 [get_ports {load_value[6]}]
set_input_delay 0.7 [get_ports {load_value[5]}]
set_input_delay 0.7 [get_ports {load_value[4]}]
set_input_delay 0.7 [get_ports {load_value[3]}]
set_input_delay 0.7 [get_ports {load_value[2]}]
set_input_delay 0.7 [get_ports {load_value[1]}]
set_input_delay 0.7 [get_ports {load_value[0]}]
set_input_delay 0.7 [get_ports {load_address[15]}]
set_input_delay 0.7 [get_ports {load_address[14]}]
set_input_delay 0.7 [get_ports {load_address[13]}]
set_input_delay 0.7 [get_ports {load_address[12]}]
set_input_delay 0.7 [get_ports {load_address[11]}]
set_input_delay 0.7 [get_ports {load_address[10]}]
set_input_delay 0.7 [get_ports {load_address[9]}]
set_input_delay 0.7 [get_ports {load_address[8]}]
set_input_delay 0.7 [get_ports {load_address[7]}]
set_input_delay 0.7 [get_ports {load_address[6]}]
set_input_delay 0.7 [get_ports {load_address[5]}]
set_input_delay 0.7 [get_ports {load_address[4]}]
set_input_delay 0.7 [get_ports {load_address[3]}]
set_input_delay 0.7 [get_ports {load_address[2]}]
set_input_delay 0.7 [get_ports {load_address[1]}]
set_input_delay 0.7 [get_ports {load_address[0]}]
set_input_delay 0.7 [get_ports reset]
set_output_delay 18 -clock vsysclk [get_ports {values[0][15]}]
set_output_delay 18 -clock vsysclk [get_ports {values[0][14]}]
set_output_delay 18 -clock vsysclk [get_ports {values[0][13]}]
set_output_delay 18 -clock vsysclk [get_ports {values[0][12]}]
set_output_delay 18 -clock vsysclk [get_ports {values[0][11]}]
set_output_delay 18 -clock vsysclk [get_ports {values[0][10]}]
set_output_delay 18 -clock vsysclk [get_ports {values[0][9]}]
set_output_delay 18 -clock vsysclk [get_ports {values[0][8]}]
set_output_delay 18 -clock vsysclk [get_ports {values[0][7]}]
set_output_delay 18 -clock vsysclk [get_ports {values[0][6]}]
set_output_delay 18 -clock vsysclk [get_ports {values[0][5]}]
set_output_delay 18 -clock vsysclk [get_ports {values[0][4]}]
set_output_delay 18 -clock vsysclk [get_ports {values[0][3]}]
set_output_delay 18 -clock vsysclk [get_ports {values[0][2]}]
set_output_delay 18 -clock vsysclk [get_ports {values[0][1]}]
set_output_delay 18 -clock vsysclk [get_ports {values[0][0]}]
set_output_delay 18 -clock vsysclk [get_ports {values[1][15]}]
set_output_delay 18 -clock vsysclk [get_ports {values[1][14]}]
set_output_delay 18 -clock vsysclk [get_ports {values[1][13]}]
set_output_delay 18 -clock vsysclk [get_ports {values[1][12]}]
set_output_delay 18 -clock vsysclk [get_ports {values[1][11]}]
set_output_delay 18 -clock vsysclk [get_ports {values[1][10]}]
set_output_delay 18 -clock vsysclk [get_ports {values[1][9]}]
set_output_delay 18 -clock vsysclk [get_ports {values[1][8]}]
set_output_delay 18 -clock vsysclk [get_ports {values[1][7]}]
set_output_delay 18 -clock vsysclk [get_ports {values[1][6]}]
set_output_delay 18 -clock vsysclk [get_ports {values[1][5]}]
set_output_delay 18 -clock vsysclk [get_ports {values[1][4]}]
set_output_delay 18 -clock vsysclk [get_ports {values[1][3]}]
set_output_delay 18 -clock vsysclk [get_ports {values[1][2]}]
set_output_delay 18 -clock vsysclk [get_ports {values[1][1]}]
set_output_delay 18 -clock vsysclk [get_ports {values[1][0]}]
set_operating_conditions  -library  [get_libs {NangateOpenCellLibrary}] -max  typical
