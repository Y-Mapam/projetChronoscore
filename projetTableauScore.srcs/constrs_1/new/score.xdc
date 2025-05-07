# Contrainte de l'horloge principale à 100 MHz
create_clock -name CLK -period 10.000 [get_ports CLK]

# Entrées synchrones : on suppose qu'elles arrivent juste avant un front d'horloge
set_input_delay -max 5.000 -clock CLK [get_ports CE_1ms]
set_input_delay -max 5.000 -clock CLK [get_ports BPL]
set_input_delay -max 5.000 -clock CLK [get_ports BPV]
set_input_delay -max 5.000 -clock CLK [get_ports BP_reset]

# Sorties : chaque bit est contraint séparément
foreach i {0 1 2 3} {
    set_output_delay -max 5.000 -clock CLK [get_ports loc_unit[$i]]
    set_output_delay -max 5.000 -clock CLK [get_ports loc_dec[$i]]
    set_output_delay -max 5.000 -clock CLK [get_ports vis_unit[$i]]
    set_output_delay -max 5.000 -clock CLK [get_ports vis_dec[$i]]
}
