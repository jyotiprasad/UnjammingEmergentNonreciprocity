reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_S01A.eps'

set size ratio 0.8
set border linewidth 2

set key at 6.e-1,0.76 samplen 2
set key font ",22"
set key spacing 1.0

set log x
set format x "10^{%L}"

set xlabel "{/Symbol t}" font ',35'
set ylabel "Q({/Symbol t})" font ',35'
set xtics 1e-5,1e2 font ',35'
set ytics 0.0,0.2 font ',35'

set style line 1 lt 1 lc rgb "#67000d" lw 4
set style line 2 lt 1 lc rgb "#ef3b2c" lw 4
set style line 3 lt 1 lc rgb "#fc9272" lw 4

set style line 4 lt 1 lc rgb "#00441b" lw 4
set style line 5 lt 1 lc rgb "#41ab5d" lw 4
set style line 6 lt 1 lc rgb "#a1d99b" lw 4

set style line 7 lt 1 lc rgb "#08306b" lw 4
set style line 8 lt 1 lc rgb "#2171b5" lw 4
set style line 9 lt 1 lc rgb "#6baed6" lw 4

set style line 10 lt 0 lc rgb "#525252" lw 6
set style line 11 lt 0 lc rgb "#000000" lw 6

set label 'e^{-1}' at 5.2e2, exp(-1.0) font ",30"
f(x) = (x > 1.e0 && x < 5.e2) ? exp(-1.0) : 1/0

set arrow from 104.27,0 to 104.27,exp(-1.0) nohead lc rgb '#000000' lt 3 lw 4
set label '{/Symbol t}_{/Symbol a}' at 90,-0.04 font ",30"

pl [1.e-3:1.e4][0:1.01] \
'data/QT_av_0.80_f0.0' u 1:2 w l ls 1 ti 'f = 0.0', \
'data/QT_av_0.80_f1.5' u 1:2 w l ls 2 ti '1.5', \
'data/QT_av_0.80_f3.0' u 1:2 w l ls 3 ti '3.0', \
'data/QT_av_0.75_f0.0' u 1:2 w l ls 4 ti 'f = 0.0', \
'data/QT_av_0.75_f1.5' u 1:2 w l ls 5 ti '1.5', \
'data/QT_av_0.75_f3.0' u 1:2 w l ls 6 ti '3.0', \
'data/QT_av_0.70_f0.0' u 1:2 w l ls 7 ti 'f = 0.0', \
'data/QT_av_0.70_f1.5' u 1:2 w l ls 8 ti '1.5', \
'data/QT_av_0.70_f3.0' u 1:2 w l ls 9 ti '3.0', \
f(x) w l ls 10 notit
