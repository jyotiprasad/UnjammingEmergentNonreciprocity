reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_07B_inset.eps'

set key at 35,0.42 samplen 2
set key spacing 1.5
set key font ',25'

set size ratio 1
set ylabel '{~X{0.8.}}_{cm}' font ',55'
set xlabel 't' font ',55'
set border linewidth 2
set ytics 0,0.2 font ',50'
set xtics -1000,1000 font ',50'

set style line 1 lt 1 lw 1 lc rgb '#c6dbef' ps 0.3 pt 7
set style line 2 lt 1 lw 1 lc rgb '#cb181d' ps 2.0 pt 7
set style line 3 lt 1 lw 4 lc rgb '#000000' ps 2.2 pt 7
set style line 4 lt 1 lw 5 lc rgb '#000000'

vx = 0.375
term = 0.005

pl [0:2500][0.2:0.6] \
'data/d_20.00_t2500_avg_t_xcmdot_err' every 2 u 1:2 w p ls 3 notit, \
'data/d_20.00_t2500_avg_t_xcmdot_err' every 2 u 1:2:3 w yerrorbars ls 2 notit, \
(vx+term) w l ls 4 notit
