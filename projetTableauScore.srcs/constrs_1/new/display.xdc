# Définition de l'horloge principale à 100 MHz
create_clock -name clk -period 10.000 [get_ports CLK]

# Contraintes sur les entrées (arrivent jusqu'à 5 ns avant le front d'horloge)
set_input_delay -max 5.000 -clock clk [get_ports {CE_1ms CE_1s}]
set_input_delay -min 0.000 -clock clk [get_ports {CE_1ms CE_1s}]

set_input_delay -max 5.000 -clock clk [get_ports {data_disp1_L0[*] data_disp1_L1[*] data_disp1_R0[*] data_disp1_R1[*] \
                                                  data_disp2_L0[*] data_disp2_L1[*] data_disp2_R0[*] data_disp2_R1[*]}]
set_input_delay -min 0.000 -clock clk [get_ports {data_disp1_L0[*] data_disp1_L1[*] data_disp1_R0[*] data_disp1_R1[*] \
                                                  data_disp2_L0[*] data_disp2_L1[*] data_disp2_R0[*] data_disp2_R1[*]}]

# Contraintes sur les sorties (doivent être stables dans les 5 ns suivant le front d'horloge)
set_output_delay -max 5.000 -clock clk [get_ports {AN[*] LEDS[*]}]
set_output_delay -min 0.000 -clock clk [get_ports {AN[*] LEDS[*]}]
