# === CONTRAINTE D'HORLOGE PRINCIPALE ===
create_clock -period 10.000 -name CLK -waveform {0 5} [get_ports CLK]

# === CONTRAINTES D'ENTRÉE (input delay) ===
set_input_delay -clock CLK 5 [get_ports WAIT_t]
set_input_delay -clock CLK 5 [get_ports START]
set_input_delay -clock CLK 5 [get_ports CE_1s]
set_input_delay -clock CLK 5 [get_ports Reset]

# === CONTRAINTES DE SORTIE (output delay) ===
set_output_delay -clock CLK 5 [get_ports sec_unit]
set_output_delay -clock CLK 5 [get_ports sec_dec]
set_output_delay -clock CLK 5 [get_ports min_unit]
set_output_delay -clock CLK 5 [get_ports min_dec]