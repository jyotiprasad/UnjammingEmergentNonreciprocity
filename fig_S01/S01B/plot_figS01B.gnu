reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_S01B.eps'

set size ratio 0.8
set border linewidth 2

set key top left samplen 2
set key font ",22"
set key spacing 1.0

set log y
set format y "10^{%L}"

set xlabel "{/Symbol f}" font ',35'
set ylabel "{/Symbol t}_{/Symbol a}" font ',35'
set xtics 0.50,0.10 font ',35'
set ytics 1.e-2,1.e2 font ',35'

set style line 1 lt 1 lc rgb "#cb181d" lw 1 ps 2.5 pt 7 # red
set style line 2 lt 1 lc rgb "black" lw 1 ps 2.6 pt 6
set style line 3 lt 0 lc rgb "black" lw 10
set style line 4 lt 1 lc rgb "#41ab5d" lw 1 ps 2.5 pt 7 # medium-green

f(x) = (x > 0.57 && x < 0.84) ? exp(A + (B/(C-x))) : 1/0

C = 0.930062 
B = 1.08189
A = -3.59261

pl [0.55:0.85][1.e-1:1.e4] \
     'data/phi_taua_f0.0' u 1:3 w p ls 2 notit, \
                       '' u 1:3 w p ls 1 ti 'f = 0.0', \
     f(x) w l ls 3 ti 'VFT fit'
