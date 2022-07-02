reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_01C_inset.eps'

set size sq
set border linewidth 2
set log y
set format y "10^{%L}"

set xlabel "{/Symbol f}" font ',37'
set ylabel "{/Symbol t}_{M}" font ',37'
set ytics 1e-4,1e2,1e8 font ',33'
set xtics 0.60,0.05,1 font ',33'

set style line 1 lt 1 lc rgb "black" lw 2 ps 3.6 pt 4
set style line 2 lt 1 lc rgb "red" lw 1 ps 3.4 pt 5

pl [0.68:0.87][1.e-1:1.e4] \
'data/omegaC' u 1:(1.0/$2) w p ls 1 notit, \
'' u 1:(1.0/$2) w p ls 2 notit
