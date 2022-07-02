reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_S02A.eps'

set size ratio 0.8
set border linewidth 2

set key at 0.37, 1.e6 samplen 2
set key font ",22"
set key spacing 1.0

set log y
set format y "10^{%L}"

set xlabel "{/Symbol f}" font ',35'
set ylabel "{/Symbol t}_{/Symbol a}" font ',35'
set xtics 0.30,0.05 font ',35'
set ytics 1.e-2,1.e2 font ',35'

set style line 1 lt 1 lc rgb "#cb181d" lw 1 ps 2.5 pt 7 # red
set style line 2 lt 1 lc rgb "black" lw 2 ps 2.6 pt 6
set style line 3 lt 0 lc rgb "black" lw 10

f(x) = (x > 0.285 && x < 0.42) ? exp(A + (B/(C-x))) : 1/0

C = 0.437104
B = 0.174902
A = 3.56771

pl [0.28:0.43][7.e1:2.e6] \
     'data/taua_phi' u 1:2 w p ls 2 notit, \
                       '' u 1:2 w p ls 1 ti 'T = 10^{-3}', \
     f(x) w l ls 3 ti 'VFT fit'
