reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_01B.eps'

set format cb "10^{%L}"

set xtics 0.70,0.05,1.00 font ',25'
set ytics 0, 1, 3 font ',25'
set cbtics font ',24'
set xrange [0.74:0.97]
set yrange [0.0:2.5]
set cbrange [6.e0:1.e5]
set border linewidth 2

set size ratio 0.8

set pm3d map
set pm3d interpolate 5,5
set palette defined ( 1.e1 "#f7fcf0", 3.e2 "#e0f3db", 5.e3 "#ccebc5", 7.e3 "#a8ddb5", 1.e4 "#7bccc4", 3.e4 "#4eb3d3", 5.e4 "#2b8cbe", 7.e4 "#0868ac", 1.e5 "#084081" ) #9-class-GnBu

set style line 1 lt 1 lc rgb "black" lw 2 ps 1.50 pt 5
set style line 2 lt 1 lc rgb "white" lw 2 ps 1.40 pt 5
set style line 3 lt 1 lc rgb "black" lw 5 ps 2.20 pt 6
set style line 4 lt 1 lc rgb "white" lw 1 ps 2.05 pt 7

set log cb
spl 'data/new_cg_phi_f_taua' u 1:2:($3) w pm3d notit, \
'data/phi_taua_f0.0' u 1:2:(0) w p ls 1 notit, \
'data/phi_taua_f0.5' u 1:2:(0) w p ls 1 notit, \
'data/phi_taua_f1.0' u 1:2:(0) w p ls 1 notit, \
'data/phi_taua_f1.25' u 1:2:(0) w p ls 1 notit, \
'data/phi_taua_f1.5' u 1:2:(0) w p ls 1 notit, \
'data/phi_taua_f2.0' u 1:2:(0) w p ls 1 notit, \
'data/phi_taua_f2.5' u 1:2:(0) w p ls 1 notit, \
'data/phi_taua_f3.0' u 1:2:(0) w p ls 1 notit, \
'data/new_VFT_fit_fall' every ::0::3 u 4:1:(0) w lp ls 3 notit, \
'' every ::0::3 u 4:1:(0) w p ls 4 notit
