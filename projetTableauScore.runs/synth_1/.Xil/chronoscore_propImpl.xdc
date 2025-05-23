set_property SRC_FILE_INFO {cfile:C:/Users/mapam/Documents/Polytech/ETN/S8/SOPC/projetTableauScorev3/projetTableauScore/projetTableauScore.srcs/constrs_1/new/chronoscore.xdc rfile:../../../projetTableauScore.srcs/constrs_1/new/chronoscore.xdc id:1} [current_design]
set_property SRC_FILE_INFO {cfile:C:/Users/mapam/Documents/Polytech/ETN/S8/SOPC/projetTableauScorev3/projetTableauScore/projetTableauScore.srcs/constrs_1/new/chronometer.xdc rfile:../../../projetTableauScore.srcs/constrs_1/new/chronometer.xdc id:2} [current_design]
set_property SRC_FILE_INFO {cfile:C:/Users/mapam/Documents/Polytech/ETN/S8/SOPC/projetTableauScorev3/projetTableauScore/projetTableauScore.srcs/constrs_1/new/display.xdc rfile:../../../projetTableauScore.srcs/constrs_1/new/display.xdc id:3} [current_design]
set_property SRC_FILE_INFO {cfile:C:/Users/mapam/Documents/Polytech/ETN/S8/SOPC/projetTableauScorev3/projetTableauScore/projetTableauScore.srcs/constrs_1/new/score.xdc rfile:../../../projetTableauScore.srcs/constrs_1/new/score.xdc id:4} [current_design]
set_property src_info {type:XDC file:1 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W5 [get_ports GCLK]
set_property src_info {type:XDC file:1 line:16 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W7 [get_ports LEDS[0]]
set_property src_info {type:XDC file:1 line:18 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W6 [get_ports LEDS[1]]
set_property src_info {type:XDC file:1 line:20 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U8 [get_ports LEDS[2]]
set_property src_info {type:XDC file:1 line:22 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V8 [get_ports LEDS[3]]
set_property src_info {type:XDC file:1 line:24 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U5 [get_ports LEDS[4]]
set_property src_info {type:XDC file:1 line:26 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V5 [get_ports LEDS[5]]
set_property src_info {type:XDC file:1 line:28 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U7 [get_ports LEDS[6]]
set_property src_info {type:XDC file:1 line:30 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V7 [get_ports LEDS[7]]
set_property src_info {type:XDC file:1 line:34 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U2 [get_ports AN[0]]
set_property src_info {type:XDC file:1 line:36 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U4 [get_ports AN[1]]
set_property src_info {type:XDC file:1 line:38 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V4 [get_ports AN[2]]
set_property src_info {type:XDC file:1 line:40 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W4 [get_ports AN[3]]
set_property src_info {type:XDC file:1 line:51 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W19 [get_ports BPV]
set_property src_info {type:XDC file:1 line:53 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T17 [get_ports BPL]
set_property src_info {type:XDC file:1 line:55 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U17 [get_ports BPreset]
set_property src_info {type:XDC file:1 line:59 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V17 [get_ports START]
set_property src_info {type:XDC file:1 line:61 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V16 [get_ports TEST]
set_property src_info {type:XDC file:1 line:63 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W16 [get_ports TEST_HSLS]
set_property src_info {type:XDC file:1 line:87 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T1 [get_ports WAIT_t]
set_property src_info {type:XDC file:1 line:89 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN R2 [get_ports RESET]
set_property src_info {type:XDC file:2 line:2 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 10.000 -name CLK -waveform {0 5} [get_ports CLK]
set_property src_info {type:XDC file:2 line:5 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -clock CLK 5 [get_ports WAIT_t]
set_property src_info {type:XDC file:2 line:6 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -clock CLK 5 [get_ports START]
set_property src_info {type:XDC file:2 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -clock CLK 5 [get_ports CE_1s]
set_property src_info {type:XDC file:2 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -clock CLK 5 [get_ports Reset]
set_property src_info {type:XDC file:2 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_output_delay -clock CLK 5 [get_ports sec_unit]
set_property src_info {type:XDC file:2 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_output_delay -clock CLK 5 [get_ports sec_dec]
set_property src_info {type:XDC file:2 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_output_delay -clock CLK 5 [get_ports min_unit]
set_property src_info {type:XDC file:2 line:14 export:INPUT save:INPUT read:READ} [current_design]
set_output_delay -clock CLK 5 [get_ports min_dec]
set_property src_info {type:XDC file:3 line:2 export:INPUT save:INPUT read:READ} [current_design]
create_clock -name clk -period 10.000 [get_ports CLK]
set_property src_info {type:XDC file:3 line:5 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -max 5.000 -clock clk [get_ports {CE_1ms CE_1s}]
set_property src_info {type:XDC file:3 line:6 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -min 0.000 -clock clk [get_ports {CE_1ms CE_1s}]
set_property src_info {type:XDC file:3 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -max 5.000 -clock clk [get_ports {data_disp1_L0[*] data_disp1_L1[*] data_disp1_R0[*] data_disp1_R1[*] data_disp2_L0[*] data_disp2_L1[*] data_disp2_R0[*] data_disp2_R1[*]}]
set_property src_info {type:XDC file:3 line:10 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -min 0.000 -clock clk [get_ports {data_disp1_L0[*] data_disp1_L1[*] data_disp1_R0[*] data_disp1_R1[*] data_disp2_L0[*] data_disp2_L1[*] data_disp2_R0[*] data_disp2_R1[*]}]
set_property src_info {type:XDC file:3 line:14 export:INPUT save:INPUT read:READ} [current_design]
set_output_delay -max 5.000 -clock clk [get_ports {AN[*] LEDS[*]}]
set_property src_info {type:XDC file:3 line:15 export:INPUT save:INPUT read:READ} [current_design]
set_output_delay -min 0.000 -clock clk [get_ports {AN[*] LEDS[*]}]
set_property src_info {type:XDC file:4 line:2 export:INPUT save:INPUT read:READ} [current_design]
create_clock -name CLK -period 10.000 [get_ports CLK]
set_property src_info {type:XDC file:4 line:5 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -max 5.000 -clock CLK [get_ports CE_1ms]
set_property src_info {type:XDC file:4 line:6 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -max 5.000 -clock CLK [get_ports BPL]
set_property src_info {type:XDC file:4 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -max 5.000 -clock CLK [get_ports BPV]
set_property src_info {type:XDC file:4 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -max 5.000 -clock CLK [get_ports BP_reset]
set_property src_info {type:XDC file:4 line:11 export:INPUT save:INPUT read:READ} [current_design]
foreach i {0 1 2 3} {
set_output_delay -max 5.000 -clock CLK [get_ports loc_unit[$i]]
set_output_delay -max 5.000 -clock CLK [get_ports loc_dec[$i]]
set_output_delay -max 5.000 -clock CLK [get_ports vis_unit[$i]]
set_output_delay -max 5.000 -clock CLK [get_ports vis_dec[$i]]
}
