reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_07E.eps'

set key at 35,0.42 samplen 2
set key spacing 1.5
set key font ',25'

set size ratio 0.8
set ylabel '{~X{0.8.}}_{cm}' font ',45'
set xlabel 't' font ',45'
set border linewidth 2
set ytics 0,0.2 font ',40'

set style line 1 lt 1 lw 1 lc rgb '#fcbba1' ps 0.5 pt 7
set style line 2 lt 1 lw 2 lc rgb '#cb181d' ps 2.0 pt 7
set style line 3 lt 1 lw 9 lc rgb '#000000' ps 2.2 pt 7
set style line 4 lt 1 lw 5 lc rgb '#000000'

vx = 0.37538060339468737

pl [][0.2:1] \
'data/avg_t_xcmdot_ycmdot_errs_d_10.00' u 1:2 w p ls 3 notit, \
'data/avg_t_xcmdot_ycmdot_errs_d_10.00' u 1:2:4 w yerrorbars ls 2 notit, \
vx w l ls 4 notit
