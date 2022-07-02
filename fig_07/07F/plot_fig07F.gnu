reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_07F.eps'

set log
set format x "10^{%L}"
set format y "10^{%L}"

set key bottom right samplen 2
set key spacing 1.3
set key font ',37'

set size ratio 0.8
set border linewidth 2
set ylabel 'Y_{rel}(t)' font ',45'
set xlabel 't_{*} - t' font ',45'
set xtics font ',40'
set ytics font ',40'

set style line 1 lt 1 lw 2 lc rgb 'black' ps 1.85 pt 12
set style line 2 lt 1 lw 2 lc rgb '#EE6677' ps 1.65 pt 13
set style line 3 lt 1 lw 7 lc rgb 'black'

pl [1180:4000][6:11] \
'data/d_10.00_t_dx_dy_errs' every 30 u (3290.44 - $1):3 w p ls 1 notit,\
'data/d_10.00_t_dx_dy_errs' every 30 u (3290.44 - $1):3:5 w yerrorbars ls 2 notit,\
(x>=1200 && x<=2200 ? 0.23*x**(0.5) : 1/0) w l ls 3 ti '|t_{*}-t|^{1/2}'
