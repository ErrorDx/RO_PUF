set n_PUFs 4
set n_INVs 5
set n_ROs 512

for {set k 0} {$k < $n_PUFs} {incr k} { 
	for {set i 0} {$i < $n_ROs} {incr i} {
		for {set j 1} {$j <= $n_INVs} {incr j} {
			unplace_cell [get_cells system_i/ROs/ROPUF_${k}/U0/PUF/RO_array_1/RO_array_0[$i].RO_X/inv_chain_inferred_i_$j]
		}
		unplace_cell [get_cells system_i/ROs/ROPUF_${k}/U0/PUF/RO_array_1/RO_array_0[$i].RO_X/RO_clk_out_INST_0]
	}
}

set x_bounds {
	{0 3 6 9 11 14 15 16 19 22}
	{42 44 46 47 48 49 50 51 52 55 56 57 59 60}
	{42 44 46 47 48 49 50 51 52 55 56 57 59 60}
	{0 3 6 9 11 14 15 16 19 22}
}

set y_bounds {
	{180 239}
	{180 239}
	{0 59}
	{0 59}
}

for {set k 0} {$k < $n_PUFs} {incr k} {
	set x_pointer 0
	set y_index [lindex $y_bounds $k 0]
	set y_bound [lindex $y_bounds $k 1]
	for {set i 0} {$i < $n_ROs} {incr i} {
		set x_index [lindex $x_bounds $k $x_pointer]
		for {set j 1} {$j <= $n_INVs} {incr j} {
			set_property LOC SLICE_X${x_index}Y${y_index} [get_cells system_i/ROs/ROPUF_${k}/U0/PUF/RO_array_1/RO_array_0[$i].RO_X/inv_chain_inferred_i_$j]
		}
		set_property LOC SLICE_X${x_index}Y${y_index} [get_cells system_i/ROs/ROPUF_${k}/U0/PUF/RO_array_1/RO_array_0[$i].RO_X/RO_clk_out_INST_0]
		incr y_index
		if { $y_index > $y_bound } {
			set y_index [lindex $y_bounds $k 0]
			incr x_pointer
		}
	}
}

place_design

route_design

