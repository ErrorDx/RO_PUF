set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets -of_objects [get_cells PUF]]
 
set_property SEVERITY {Warning}  [get_drc_checks LUTLP-1]
 
set_property SEVERITY {Warning} [get_drc_checks NSTD-1]




set_property CONTAIN_ROUTING true [get_pblocks PUF3]
set_property EXCLUDE_PLACEMENT true [get_pblocks PUF3]
set_property CONTAIN_ROUTING true [get_pblocks PUF2]
set_property EXCLUDE_PLACEMENT true [get_pblocks PUF2]
set_property CONTAIN_ROUTING true [get_pblocks PUF1]
set_property EXCLUDE_PLACEMENT true [get_pblocks PUF1]
