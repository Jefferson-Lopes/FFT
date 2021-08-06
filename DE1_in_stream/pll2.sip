set_global_assignment -entity "pll2" -library "lib_pll2" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll2" -library "lib_pll2" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "pll2" -library "lib_pll2" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll2" -name SPD_FILE [file join $::quartus(sip_path) "pll2.spd"]

set_global_assignment -library "lib_pll2" -name MISC_FILE [file join $::quartus(sip_path) "pll2_sim/pll2.vo"]
