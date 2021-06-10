vsim -gui work.BoothMultTB_RTL
add wave -position insertpoint  \
sim:/BoothMultTB_RTL/A16 \
sim:/BoothMultTB_RTL/B16 \
sim:/BoothMultTB_RTL/out32
run
run
run
run

