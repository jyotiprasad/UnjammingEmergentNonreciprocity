reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_07E_inset.eps'

set key at 35,0.42 samplen 2  #60, 18
set key spacing 1.5
set key font ',25'

set size ratio 1
set ylabel '{~Y{0.8.}}_{cm}' font ',55'
set xlabel 't' font ',55'
set border linewidth 2
set ytics -1.0,0.2 font ',50'
set xtics -1000,1000 font ',50'

set style line 1 lt 1 lw 7 lc rgb '#2171b5'
set style line 2 lt 1 lw 2 lc rgb '#2171b5' ps 0.4 pt 7
set style line 3 lt 1 lw 1 lc rgb '#c6dbef' ps 0.4 pt 7

pl [0:2500][-0.4:0.4] \
'data/avg_t_xcmdot_ycmdot_errs_d_10.00' u 1:3:5 w yerrorbars ls 2 notit, \
'data/avg_t_xcmdot_ycmdot_errs_d_10.00' u 1:3 w l ls 1 notit
