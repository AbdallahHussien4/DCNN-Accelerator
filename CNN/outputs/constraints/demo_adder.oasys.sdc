#
# Created by 
#   ../bin/Linux-x86_64-O/oasysGui 19.2-p002 on Wed May 26 17:39:58 2021
# (C) Mentor Graphics Corporation
#
set_units -time ns -capacitance ff -resistance kohm -power nW -voltage V -current mA
create_clock -period 60 -waveform {0 30} -name vsysclk 
group_path -name I2R -from [list [get_ports clk] [get_ports reset] [get_ports start]]
group_path -name I2O -from [list [get_ports clk] [get_ports reset] [get_ports start]]  -to [get_ports finish]
group_path -name R2O -to [get_ports finish]
set_load 10 [get_ports finish]
set_input_transition 0.1 [get_ports start]
set_input_transition 0.1 [get_ports reset]
set_input_transition 0.1 [get_ports clk]
set_input_delay 0.7 [get_ports start]
set_input_delay 0.7 [get_ports reset]
set_input_delay 0.7 [get_ports clk]
set_output_delay 18 -clock vsysclk [get_ports finish]
set_operating_conditions  -library  [get_libs {NangateOpenCellLibrary}] -max  typical
