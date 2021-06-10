vsim -gui work.BoothMultTB_Synth
add wave -position insertpoint  \
sim:/BoothMultTB_Synth/A16 \
sim:/BoothMultTB_Synth/B16 \
sim:/BoothMultTB_Synth/out32
run
run
run
run

