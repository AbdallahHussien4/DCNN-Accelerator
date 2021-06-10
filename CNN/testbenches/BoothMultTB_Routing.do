vsim -gui work.BoothMultTB_Routing
add wave -position insertpoint  \
sim:/BoothMultTB_Routing/A16 \
sim:/BoothMultTB_Routing/B16 \
sim:/BoothMultTB_Routing/out32
run
run
run
run

