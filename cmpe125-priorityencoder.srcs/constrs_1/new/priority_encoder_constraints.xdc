# Switches
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {IN_SWITCHES[0]}];  
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports {IN_SWITCHES[1]}];  
set_property -dict {PACKAGE_PIN W16 IOSTANDARD LVCMOS33} [get_ports {IN_SWITCHES[2]}];   
set_property -dict {PACKAGE_PIN W17 IOSTANDARD LVCMOS33} [get_ports {IN_SWITCHES[3]}];   
set_property -dict {PACKAGE_PIN W15 IOSTANDARD LVCMOS33} [get_ports {IN_SWITCHES[4]}];  
set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports {IN_SWITCHES[5]}];  
set_property -dict {PACKAGE_PIN W14 IOSTANDARD LVCMOS33} [get_ports {IN_SWITCHES[6]}];   
set_property -dict {PACKAGE_PIN W13 IOSTANDARD LVCMOS33} [get_ports {IN_SWITCHES[7]}];  


# LEDs
set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVCMOS33} [get_ports {OUT_LED[0]}];
set_property -dict {PACKAGE_PIN E19 IOSTANDARD LVCMOS33} [get_ports {OUT_LED[1]}];
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports {OUT_LED[2]}];  
set_property -dict {PACKAGE_PIN V19 IOSTANDARD LVCMOS33} [get_ports {VALID_LED}];
