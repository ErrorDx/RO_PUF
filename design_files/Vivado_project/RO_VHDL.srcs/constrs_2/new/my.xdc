set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets -of_objects [get_cells ]]
 
set_property SEVERITY {Warning}  [get_drc_checks LUTLP-1]
 
set_property SEVERITY {Warning} [get_drc_checks NSTD-1]



