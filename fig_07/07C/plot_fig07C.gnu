reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_07C.eps'

set log
set format x "10^{%L}"
set format y "10^{%L}"

set key bottom right samplen 2
#set key at 1500, 1 samplen 2
set key spacing 1.3
set key font ',37'

set size ratio 0.8
set border linewidth 2
set ylabel 'X_{rel}(t)' font ',45'
set xlabel 't_{*} - t' font ',45'
set xtics font ',40'
set ytics font ',40'

set style line 1 lt 1 lw 2 lc rgb 'black' ps 1.85 pt 12
set style line 2 lt 1 lw 2 lc rgb '#EE6677' ps 1.65 pt 13
set style line 3 lt 1 lw 7 lc rgb 'black'

pl [100:1000][8:23] \
'data/d_20.00_t2500_t_dx_dy_errs' every 20 u (857.498 - $1):2 w p ls 1 notit,\
'data/d_20.00_t2500_t_dx_dy_errs' every 20 u (857.498 - $1):2:4 w yerrorbars ls 2 notit,\
(x>=400 && x<=900 ? 3.2*x**(2.0/7.0) : 1/0) w l ls 3 ti '|t_{*}-t|^{2/7}'
