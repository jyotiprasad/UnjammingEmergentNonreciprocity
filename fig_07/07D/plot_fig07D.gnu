reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_07D.eps'

unset key

set size ratio 0.8
set border linewidth 2
set ylabel 'Y_{i}(t)' font ',32' #',33'
set xlabel 't' font ',32' #',33'

set style line 1 lt 1 lw 2 ps 1.0 pt 7 lc rgb '#EE6677' # light red
set style line 2 lt 1 lw 2 ps 1.0 pt 7 lc rgb '#4477AA' # light blue
set style line 3 lt 1 lw 2 ps 1.0 pt 7 lc rgb '#000000'


plot [0:2000][] \
 'data/d_10.00_mean_traj' u 0:2:6 w yerrorbars ls 1 notit, \
                       '' u 0:4:8 w yerrorbars ls 2 notit, \
                       '' u 0:2 w l ls 3 notit, \
                       '' u 0:4 w l ls 3 notit #, \
