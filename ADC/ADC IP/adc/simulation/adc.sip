set_global_assignment -entity "adc" -library "lib_adc" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "adc" -library "lib_adc" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "adc" -library "lib_adc" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_adc" -name SPD_FILE [file join $::quartus(sip_path) "../adc.spd"]
set_global_assignment -library "lib_adc" -name MISC_FILE [file join $::quartus(sip_path) "../../adc.qsys"]

set_global_assignment -library "lib_adc" -name MISC_FILE [file join $::quartus(sip_path) "adc.v"]
set_global_assignment -library "lib_adc" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_up_avalon_adv_adc.v"]
set_global_assignment -library "lib_adc" -name MISC_FILE [file join $::quartus(sip_path) "submodules/adc_adc_mega_0.v"]
