####################################################################################
# DigicodeS_v0.xdc 
# Declarations saisies a la main suite a une tentative infructueuse de generation
# automatique a l'aide de la commande write_xdc
# SEA December 2020
# Multiplexage manuel
####################################################################################


## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk_100M]							
set_property IOSTANDARD LVCMOS33 [get_ports clk_100M]
	#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports BoardClk]
 
##7 segments display
    set_property PACKAGE_PIN W7 [get_ports n_seg[0]]                    
    set_property IOSTANDARD LVCMOS33 [get_ports n_seg[0]]
    set_property PACKAGE_PIN W6 [get_ports n_seg[1]]                    
    set_property IOSTANDARD LVCMOS33 [get_ports n_seg[1]]
    set_property PACKAGE_PIN U8 [get_ports n_seg[2]]                    
    set_property IOSTANDARD LVCMOS33 [get_ports n_seg[2]]
    set_property PACKAGE_PIN V8 [get_ports n_seg[3]]                    
    set_property IOSTANDARD LVCMOS33 [get_ports n_seg[3]]
    set_property PACKAGE_PIN U5 [get_ports n_seg[4]]                    
    set_property IOSTANDARD LVCMOS33 [get_ports n_seg[4]]
    set_property PACKAGE_PIN V5 [get_ports n_seg[5]]                    
    set_property IOSTANDARD LVCMOS33 [get_ports n_seg[5]]
    set_property PACKAGE_PIN U7 [get_ports n_seg[6]]                    
    set_property IOSTANDARD LVCMOS33 [get_ports n_seg[6]]
#    set_property PACKAGE_PIN V7 [get_ports n_dp]                            
#    set_property IOSTANDARD LVCMOS33 [get_ports n_dp]
    
    ## allum anode controls    
    set_property PACKAGE_PIN U2 [get_ports n_allum[0]]                    
    set_property IOSTANDARD LVCMOS33 [get_ports n_allum[0]]
    set_property PACKAGE_PIN U4 [get_ports n_allum[1]]                    
    set_property IOSTANDARD LVCMOS33 [get_ports n_allum[1]]   
    set_property PACKAGE_PIN V4 [get_ports n_allum[2]]                    
    set_property IOSTANDARD LVCMOS33 [get_ports n_allum[2]]
    set_property PACKAGE_PIN W4 [get_ports n_allum[3]]                    
    set_property IOSTANDARD LVCMOS33 [get_ports n_allum[3]]

##Buttons
# Version pour les BPs de la carte Basys 3
# Signaux BPs actifs au NLH

set_property PACKAGE_PIN U18 [get_ports BP_Validation]						
set_property IOSTANDARD LVCMOS33 [get_ports BP_Validation]
set_property PACKAGE_PIN T18 [get_ports BP_Inc]
set_property IOSTANDARD LVCMOS33 [get_ports BP_Inc]
set_property PACKAGE_PIN W19 [get_ports BP_Suivant]
set_property IOSTANDARD LVCMOS33 [get_ports BP_Suivant]						
set_property PACKAGE_PIN T17 [get_ports BP_Precedent]						
set_property IOSTANDARD LVCMOS33 [get_ports BP_Precedent]
set_property PACKAGE_PIN U17 [get_ports BP_Dec]						
set_property IOSTANDARD LVCMOS33 [get_ports BP_Dec]

## Digitactif input -- plus en entrée mais en signal
#set_property PACKAGE_PIN V17 [get_ports DigitActif[0]]					
#set_property IOSTANDARD LVCMOS33 [get_ports DigitActif[0]]
#set_property PACKAGE_PIN V16 [get_ports DigitActif[1]]					
#set_property IOSTANDARD LVCMOS33 [get_ports DigitActif[1]]
#set_property PACKAGE_PIN W16 [get_ports {sw[2]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
#set_property PACKAGE_PIN W17 [get_ports {sw[3]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
#set_property PACKAGE_PIN W15 [get_ports {sw[4]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
#set_property PACKAGE_PIN V15 [get_ports {sw[5]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
#set_property PACKAGE_PIN W14 [get_ports {sw[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
#set_property PACKAGE_PIN W13 [get_ports {sw[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]
#set_property PACKAGE_PIN V2 [get_ports {sw[8]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}]
#set_property PACKAGE_PIN T3 [get_ports {sw[9]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]
#set_property PACKAGE_PIN T2 [get_ports {sw[10]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}]
#set_property PACKAGE_PIN R3 [get_ports {sw[11]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[11]}]
#set_property PACKAGE_PIN W2 [get_ports {sw[12]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]
#set_property PACKAGE_PIN U1 [get_ports {sw[13]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}]
#set_property PACKAGE_PIN T1 [get_ports {sw[14]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[14]}]
#set_property PACKAGE_PIN R2 [get_ports {sw15}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {sw15}]
 

## LEDs
#set_property PACKAGE_PIN U16 [get_ports {led0}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {led0}]
#set_property PACKAGE_PIN E19 [get_ports {led[1]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
#set_property PACKAGE_PIN U19 [get_ports {led[2]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
#set_property PACKAGE_PIN V19 [get_ports {led[3]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
#set_property PACKAGE_PIN W18 [get_ports {led[4]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
#set_property PACKAGE_PIN U15 [get_ports {led[5]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
#set_property PACKAGE_PIN U14 [get_ports {led[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
#set_property PACKAGE_PIN V14 [get_ports {led[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
#set_property PACKAGE_PIN V13 [get_ports {led[8]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}]
#set_property PACKAGE_PIN V3 [get_ports {led[9]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[9]}]
#set_property PACKAGE_PIN W3 [get_ports {led[10]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[10]}]
#set_property PACKAGE_PIN U3 [get_ports {led[11]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[11]}]
#set_property PACKAGE_PIN P3 [get_ports {led[12]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[12]}]
#set_property PACKAGE_PIN N3 [get_ports {led13}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {led13}]

#LED14 = Erreur
 set_property PACKAGE_PIN P1 [get_ports {erreur}]					
set_property IOSTANDARD LVCMOS33 [get_ports {erreur}]
 #LED15 = Ouverture
set_property PACKAGE_PIN L1 [get_ports {ouverture}]					
set_property IOSTANDARD LVCMOS33 [get_ports {ouverture}]

