reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_07B.eps'

set size ratio 0.8
set ylabel '({~X{0.8.}}_{2} - ~X{0.8.})/({~X{0.8.}}_{1} - ~X{0.8.})' font ',45'
set xlabel 't' font ',45'
set border linewidth 2.5
set xtics 0,250 font ',40'
set ytics 0,2 font ',40'

set style line 1 lt 1 lw 1 lc rgb '#fcbba1' ps 0.5 pt 7
set style line 2 lt 1 lw 5 lc rgb '#2171b5' ps 0.3 pt 7
set style line 3 lt 1 lw 10 lc rgb '#2171b5'
set style line 4 lt 2 lw 5 lc rgb '#000000'

pl [500:1250][0:10] \
'data/d_20.00_t2500_avg_t_nonreci_err' u 1:2:3 w yerrorbars ls 2 notit, \
                                    '' u 1:2 w l ls 3 notit, \
                                           1 w l ls 4 notit
