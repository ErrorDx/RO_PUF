# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "Page 0"

  ipgui::add_param $IPINST -name "number_of_INVs"
  ipgui::add_param $IPINST -name "wait_ns"
  ipgui::add_param $IPINST -name "number_of_ROs"

}

proc update_PARAM_VALUE.number_of_INVs { PARAM_VALUE.number_of_INVs } {
	# Procedure called to update number_of_INVs when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.number_of_INVs { PARAM_VALUE.number_of_INVs } {
	# Procedure called to validate number_of_INVs
	return true
}

proc update_PARAM_VALUE.number_of_ROs { PARAM_VALUE.number_of_ROs } {
	# Procedure called to update number_of_ROs when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.number_of_ROs { PARAM_VALUE.number_of_ROs } {
	# Procedure called to validate number_of_ROs
	return true
}

proc update_PARAM_VALUE.wait_ns { PARAM_VALUE.wait_ns } {
	# Procedure called to update wait_ns when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.wait_ns { PARAM_VALUE.wait_ns } {
	# Procedure called to validate wait_ns
	return true
}


proc update_MODELPARAM_VALUE.number_of_INVs { MODELPARAM_VALUE.number_of_INVs PARAM_VALUE.number_of_INVs } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.number_of_INVs}] ${MODELPARAM_VALUE.number_of_INVs}
}

proc update_MODELPARAM_VALUE.number_of_ROs { MODELPARAM_VALUE.number_of_ROs PARAM_VALUE.number_of_ROs } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.number_of_ROs}] ${MODELPARAM_VALUE.number_of_ROs}
}

proc update_MODELPARAM_VALUE.wait_ns { MODELPARAM_VALUE.wait_ns PARAM_VALUE.wait_ns } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.wait_ns}] ${MODELPARAM_VALUE.wait_ns}
}

