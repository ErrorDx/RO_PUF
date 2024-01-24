#set_property ALLOW_COMBINATORIAL_LOOPS true [get_cells -quiet [list system_i/ROs/ROPUF_0/U0/PUF/RO_array_1]]
#set_property ALLOW_COMBINATORIAL_LOOPS true [get_cells -quiet [list system_i/ROs/ROPUF_1/U0/PUF/RO_array_1]]
#set_property ALLOW_COMBINATORIAL_LOOPS true [get_cells -quiet [list system_i/ROs/ROPUF_2/U0/PUF/RO_array_1]]
#set_property ALLOW_COMBINATORIAL_LOOPS true [get_cells -quiet [list system_i/ROs/ROPUF_3/U0/PUF/RO_array_1]]
#set_property ALLOW_COMBINATORIAL_LOOPS true [get_cells -quiet [list system_i/ROs/ROPUF_4/U0/PUF/RO_array_1]]
#set_property ALLOW_COMBINATORIAL_LOOPS true [get_cells -quiet [list system_i/ROs/ROPUF_5/U0/PUF/RO_array_1]]
#set_property ALLOW_COMBINATORIAL_LOOPS true [get_cells -quiet [list system_i/ROs/ROPUF_6/U0/PUF/RO_array_1]]
#set_property ALLOW_COMBINATORIAL_LOOPS true [get_cells -quiet [list system_i/ROs/ROPUF_7/U0/PUF/RO_array_1]]
#set_property ALLOW_COMBINATORIAL_LOOPS true [get_cells -quiet [list system_i/ROs/ROPUF_8/U0/PUF/RO_array_1]]
#set_property ALLOW_COMBINATORIAL_LOOPS true [get_cells -quiet [list system_i/ROs/ROPUF_9/U0/PUF/RO_array_1]]
#set_property ALLOW_COMBINATORIAL_LOOPS true [get_cells -quiet [list system_i/ROs/ROPUF_10/U0/PUF/RO_array_1]]
#set_property ALLOW_COMBINATORIAL_LOOPS true [get_cells -quiet [list system_i/ROs/ROPUF_11/U0/PUF/RO_array_1]]
#set_property ALLOW_COMBINATORIAL_LOOPS true [get_cells -quiet [list system_i/ROs/ROPUF_12/U0/PUF/RO_array_1]]
#set_property ALLOW_COMBINATORIAL_LOOPS true [get_cells -quiet [list system_i/ROs/ROPUF_13/U0/PUF/RO_array_1]]
#set_property ALLOW_COMBINATORIAL_LOOPS true [get_cells -quiet [list system_i/ROs/ROPUF_14/U0/PUF/RO_array_1]]

 
set_property SEVERITY {Warning}  [get_drc_checks LUTLP-1]
 
set_property SEVERITY {Warning} [get_drc_checks NSTD-1]

create_pblock RO_array_0
add_cells_to_pblock [get_pblocks RO_array_0] [get_cells -quiet [list system_i/ROs/ROPUF_0/U0/PUF/RO_array_1]]
resize_pblock [get_pblocks RO_array_0] -add {SLICE_X0Y180:SLICE_X0Y239 \
                                             SLICE_X3Y180:SLICE_X3Y239 \
                                             SLICE_X6Y180:SLICE_X6Y239 \
                                             SLICE_X9Y180:SLICE_X9Y239 \
                                             SLICE_X11Y180:SLICE_X11Y239 \
                                             SLICE_X14Y180:SLICE_X14Y239 \
                                             SLICE_X15Y180:SLICE_X15Y239 \
                                             SLICE_X16Y180:SLICE_X16Y239 \
                                             SLICE_X19Y180:SLICE_X19Y239 \
                                             SLICE_X22Y180:SLICE_X22Y239 \ 
                                             SLICE_X1Y180:SLICE_X1Y239 \
                                             SLICE_X2Y180:SLICE_X2Y239 \
                                             SLICE_X4Y180:SLICE_X4Y239 \
                                             SLICE_X5Y180:SLICE_X5Y239 \
                                             SLICE_X7Y180:SLICE_X7Y239 \
                                             SLICE_X8Y180:SLICE_X8Y239 \
                                             SLICE_X10Y180:SLICE_X10Y239 \
                                             SLICE_X12Y180:SLICE_X12Y239 \
                                             SLICE_X13Y180:SLICE_X13Y239 \
                                             SLICE_X17Y180:SLICE_X17Y239 \
                                             SLICE_X18Y180:SLICE_X18Y239 \
                                             SLICE_X20Y180:SLICE_X20Y239 \
                                             SLICE_X21Y180:SLICE_X21Y239 }
set_property CONTAIN_ROUTING true [get_pblocks RO_array_0]
set_property EXCLUDE_PLACEMENT true [get_pblocks RO_array_0]                                    

create_pblock RO_array_1
add_cells_to_pblock [get_pblocks RO_array_1] [get_cells -quiet [list system_i/ROs/ROPUF_1/U0/PUF/RO_array_1]]
resize_pblock [get_pblocks RO_array_1] -add {SLICE_X23Y180:SLICE_X23Y239 \
                                             SLICE_X26Y180:SLICE_X26Y239 \
                                             SLICE_X27Y180:SLICE_X27Y239 \
                                             SLICE_X30Y180:SLICE_X30Y239 \
                                             SLICE_X33Y180:SLICE_X33Y239 \
                                             SLICE_X36Y180:SLICE_X36Y239 \
                                             SLICE_X39Y180:SLICE_X39Y239 \
                                             SLICE_X24Y180:SLICE_X24Y239 \
                                             SLICE_X25Y180:SLICE_X25Y239 \
                                             SLICE_X28Y180:SLICE_X28Y239 \
                                             SLICE_X29Y180:SLICE_X29Y239 \
                                             SLICE_X31Y180:SLICE_X31Y239 \
                                             SLICE_X32Y180:SLICE_X32Y239 \
                                             SLICE_X34Y180:SLICE_X34Y239 \
                                             SLICE_X35Y180:SLICE_X35Y239 \
                                             SLICE_X37Y180:SLICE_X37Y239 \
                                             SLICE_X38Y180:SLICE_X38Y239 \
                                             SLICE_X40Y180:SLICE_X40Y239  }
set_property CONTAIN_ROUTING true [get_pblocks RO_array_1]
set_property EXCLUDE_PLACEMENT true [get_pblocks RO_array_1]   

create_pblock RO_array_2
add_cells_to_pblock [get_pblocks RO_array_2] [get_cells -quiet [list system_i/ROs/ROPUF_2/U0/PUF/RO_array_1]]
resize_pblock [get_pblocks RO_array_2] -add {SLICE_X42Y180:SLICE_X42Y239 \
                                             SLICE_X44Y180:SLICE_X44Y239 \
                                             SLICE_X46Y180:SLICE_X46Y239 \
                                             SLICE_X47Y180:SLICE_X47Y239 \
                                             SLICE_X48Y180:SLICE_X48Y239 \
                                             SLICE_X49Y180:SLICE_X49Y239 \
                                             SLICE_X50Y180:SLICE_X50Y239 \
                                             SLICE_X51Y180:SLICE_X51Y239 \
                                             SLICE_X52Y180:SLICE_X52Y239 \
                                             SLICE_X55Y180:SLICE_X55Y239 \
                                             SLICE_X56Y180:SLICE_X56Y239 \ 
                                             SLICE_X57Y180:SLICE_X57Y239 \ 
                                             SLICE_X59Y180:SLICE_X59Y239 \ 
                                             SLICE_X60Y180:SLICE_X60Y239 \
                                             SLICE_X41Y180:SLICE_X41Y239 \
                                             SLICE_X43Y180:SLICE_X43Y239 \
                                             SLICE_X45Y180:SLICE_X45Y239 \
                                             SLICE_X53Y180:SLICE_X53Y239 \
                                             SLICE_X54Y180:SLICE_X54Y239 \
                                             SLICE_X58Y180:SLICE_X58Y239 }
set_property CONTAIN_ROUTING true [get_pblocks RO_array_2]
set_property EXCLUDE_PLACEMENT true [get_pblocks RO_array_2]   

create_pblock RO_array_3
add_cells_to_pblock [get_pblocks RO_array_3] [get_cells -quiet [list system_i/ROs/ROPUF_3/U0/PUF/RO_array_1]]
resize_pblock [get_pblocks RO_array_3] -add {SLICE_X42Y120:SLICE_X42Y179 \
                                             SLICE_X44Y120:SLICE_X44Y179 \
                                             SLICE_X46Y120:SLICE_X46Y179 \
                                             SLICE_X47Y120:SLICE_X47Y179 \
                                             SLICE_X48Y120:SLICE_X48Y179 \
                                             SLICE_X49Y120:SLICE_X49Y179 \
                                             SLICE_X50Y120:SLICE_X50Y179 \
                                             SLICE_X51Y120:SLICE_X51Y179 \
                                             SLICE_X52Y120:SLICE_X52Y179 \
                                             SLICE_X55Y120:SLICE_X55Y179 \
                                             SLICE_X56Y120:SLICE_X56Y179 \ 
                                             SLICE_X57Y120:SLICE_X57Y179 \ 
                                             SLICE_X59Y120:SLICE_X59Y179 \ 
                                             SLICE_X60Y120:SLICE_X60Y179 \
                                             SLICE_X41Y120:SLICE_X41Y179 \
                                             SLICE_X43Y120:SLICE_X43Y179 \
                                             SLICE_X45Y120:SLICE_X45Y179 \
                                             SLICE_X53Y120:SLICE_X53Y179 \
                                             SLICE_X54Y120:SLICE_X54Y179 \
                                             SLICE_X58Y120:SLICE_X58Y179 }
set_property CONTAIN_ROUTING true [get_pblocks RO_array_3]
set_property EXCLUDE_PLACEMENT true [get_pblocks RO_array_3]   

create_pblock RO_array_4
add_cells_to_pblock [get_pblocks RO_array_4] [get_cells -quiet [list system_i/ROs/ROPUF_4/U0/PUF/RO_array_1]]
resize_pblock [get_pblocks RO_array_4] -add {SLICE_X42Y60:SLICE_X42Y119 \
                                             SLICE_X44Y60:SLICE_X44Y119 \
                                             SLICE_X46Y60:SLICE_X46Y119 \
                                             SLICE_X47Y60:SLICE_X47Y119 \
                                             SLICE_X48Y60:SLICE_X48Y119 \  
                                             SLICE_X49Y60:SLICE_X49Y119 \
                                             SLICE_X50Y60:SLICE_X50Y119 \
                                             SLICE_X51Y60:SLICE_X51Y119 \
                                             SLICE_X52Y60:SLICE_X52Y119 \
                                             SLICE_X55Y60:SLICE_X55Y119 \
                                             SLICE_X56Y60:SLICE_X56Y119 \ 
                                             SLICE_X57Y60:SLICE_X57Y119 \ 
                                             SLICE_X59Y60:SLICE_X59Y119 \ 
                                             SLICE_X60Y60:SLICE_X60Y119 \
                                             SLICE_X41Y60:SLICE_X41Y119 \
                                             SLICE_X43Y60:SLICE_X43Y119 \
                                             SLICE_X45Y60:SLICE_X45Y119 \
                                             SLICE_X53Y60:SLICE_X53Y119 \
                                             SLICE_X54Y60:SLICE_X54Y119 \
                                             SLICE_X58Y60:SLICE_X58Y119 }
set_property CONTAIN_ROUTING true [get_pblocks RO_array_4]
set_property EXCLUDE_PLACEMENT true [get_pblocks RO_array_4]     

create_pblock RO_array_5
add_cells_to_pblock [get_pblocks RO_array_5] [get_cells -quiet [list system_i/ROs/ROPUF_5/U0/PUF/RO_array_1]]
resize_pblock [get_pblocks RO_array_5] -add {SLICE_X42Y0:SLICE_X42Y59 \
                                             SLICE_X44Y0:SLICE_X44Y59 \
                                             SLICE_X46Y0:SLICE_X46Y59 \
                                             SLICE_X47Y0:SLICE_X47Y59 \
                                             SLICE_X48Y0:SLICE_X48Y59 \  
                                             SLICE_X49Y0:SLICE_X49Y59 \
                                             SLICE_X50Y0:SLICE_X50Y59 \
                                             SLICE_X51Y0:SLICE_X51Y59 \
                                             SLICE_X52Y0:SLICE_X52Y59 \
                                             SLICE_X55Y0:SLICE_X55Y59 \
                                             SLICE_X56Y0:SLICE_X56Y59 \ 
                                             SLICE_X57Y0:SLICE_X57Y59 \ 
                                             SLICE_X59Y0:SLICE_X59Y59 \ 
                                             SLICE_X60Y0:SLICE_X60Y59 \
                                             SLICE_X41Y0:SLICE_X41Y59 \
                                             SLICE_X43Y0:SLICE_X43Y59 \
                                             SLICE_X45Y0:SLICE_X45Y59 \
                                             SLICE_X53Y0:SLICE_X53Y59 \
                                             SLICE_X54Y0:SLICE_X54Y59 \
                                             SLICE_X58Y0:SLICE_X58Y59 }
set_property CONTAIN_ROUTING true [get_pblocks RO_array_5]
set_property EXCLUDE_PLACEMENT true [get_pblocks RO_array_5]  

create_pblock RO_array_6
add_cells_to_pblock [get_pblocks RO_array_6] [get_cells -quiet [list system_i/ROs/ROPUF_6/U0/PUF/RO_array_1]]
resize_pblock [get_pblocks RO_array_6] -add {SLICE_X23Y0:SLICE_X23Y59 \
                                             SLICE_X26Y0:SLICE_X26Y59 \
                                             SLICE_X27Y0:SLICE_X27Y59 \
                                             SLICE_X30Y0:SLICE_X30Y59 \
                                             SLICE_X33Y0:SLICE_X33Y59 \
                                             SLICE_X36Y0:SLICE_X36Y59 \
                                             SLICE_X39Y0:SLICE_X39Y59 \
                                             SLICE_X24Y0:SLICE_X24Y59 \
                                             SLICE_X25Y0:SLICE_X25Y59 \
                                             SLICE_X28Y0:SLICE_X28Y59 \
                                             SLICE_X29Y0:SLICE_X29Y59 \
                                             SLICE_X31Y0:SLICE_X31Y59 \
                                             SLICE_X32Y0:SLICE_X32Y59 \
                                             SLICE_X34Y0:SLICE_X34Y59 \
                                             SLICE_X35Y0:SLICE_X35Y59 \
                                             SLICE_X37Y0:SLICE_X37Y59 \
                                             SLICE_X38Y0:SLICE_X38Y59 \
                                             SLICE_X40Y0:SLICE_X40Y59  }
set_property CONTAIN_ROUTING true [get_pblocks RO_array_6]
set_property EXCLUDE_PLACEMENT true [get_pblocks RO_array_6]   

create_pblock RO_array_7
add_cells_to_pblock [get_pblocks RO_array_7] [get_cells -quiet [list system_i/ROs/ROPUF_7/U0/PUF/RO_array_1]]
resize_pblock [get_pblocks RO_array_7] -add {SLICE_X0Y0:SLICE_X0Y59 \
                                             SLICE_X3Y0:SLICE_X3Y59 \
                                             SLICE_X6Y0:SLICE_X6Y59 \
                                             SLICE_X9Y0:SLICE_X9Y59 \
                                             SLICE_X11Y0:SLICE_X11Y59 \
                                             SLICE_X14Y0:SLICE_X14Y59 \
                                             SLICE_X15Y0:SLICE_X15Y59 \
                                             SLICE_X16Y0:SLICE_X16Y59 \
                                             SLICE_X19Y0:SLICE_X19Y59 \
                                             SLICE_X22Y0:SLICE_X22Y59 \
                                             SLICE_X1Y0:SLICE_X1Y59 \
                                             SLICE_X2Y0:SLICE_X2Y59 \
                                             SLICE_X4Y0:SLICE_X4Y59 \
                                             SLICE_X5Y0:SLICE_X5Y59 \
                                             SLICE_X7Y0:SLICE_X7Y59 \
                                             SLICE_X8Y0:SLICE_X8Y59 \
                                             SLICE_X10Y0:SLICE_X10Y59 \
                                             SLICE_X12Y0:SLICE_X12Y59 \
                                             SLICE_X13Y0:SLICE_X13Y59 \
                                             SLICE_X17Y0:SLICE_X17Y59 \
                                             SLICE_X18Y0:SLICE_X18Y59 \
                                             SLICE_X20Y0:SLICE_X20Y59 \
                                             SLICE_X21Y0:SLICE_X21Y59 }
set_property CONTAIN_ROUTING true [get_pblocks RO_array_7]
set_property EXCLUDE_PLACEMENT true [get_pblocks RO_array_7]  

