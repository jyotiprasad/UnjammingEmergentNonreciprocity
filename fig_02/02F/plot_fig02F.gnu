reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_02F.eps'

set size sq
set border linewidth 2

set key bottom right samplen 2
set key spacing 1.0
set key font ",20"

set log
set format x "10^{%L}"
set format y "10^{%L}"

set xlabel "{/Symbol d}{/Symbol f}^{-{/Symbol n}} f" font ',28'
set ylabel "{/Symbol d}{/Symbol f}^{-{/Symbol m}} D_{/Symbol \245}" font ',28'
set xtics 1e-10,1.e2,1e10 font ',28'
set ytics 1e-10,1.e2,1e12 font ',28'

set style line 1 lt 1 lc rgb "#4477AA" lw 1 ps 2.0 pt 5
set style line 2 lt 1 lc rgb "#228833" lw 1 ps 2.0 pt 7
set style line 3 lt 1 lc rgb "#EE6677" lw 1 ps 2.0 pt 9
set style line 4 lt 1 lc rgb "#AA3377" lw 1 ps 2.0 pt 11

set style line 5 lt 1 lc rgb "black" lw 2 ps 2.15 pt 5
set style line 6 lt 1 lc rgb "black" lw 2 ps 2.15 pt 7
set style line 7 lt 1 lc rgb "black" lw 2 ps 2.15 pt 9
set style line 8 lt 1 lc rgb "black" lw 2 ps 2.15 pt 11

set style line 9 lt 0 lc rgb "black" lw 5
set style line 10 lt 2 lc rgb "gray60" lw 3

p050 = 0.835918
p075 = 0.844506
p100 = 0.840899
p125 = 0.848552
mu = 6.5
nu = 2.5

pl [8.e-1:2.e4][1.e1:3.e6] \
'data/D_individual_f0.5' u ($2/(p050-$1)**nu):($3/(p050-$1)**mu) w p ls 5 notit, \
'data/D_individual_f0.5' u ($2/(p050-$1)**nu):($3/(p050-$1)**mu) w p ls 1 ti 'f = 0.50', \
'data/D_individual_f0.75' u ($2/(p050-$1)**nu):($3/(p050-$1)**mu) w p ls 6 notit, \
'data/D_individual_f0.75' u ($2/(p050-$1)**nu):($3/(p050-$1)**mu) w p ls 2 ti '0.75', \
'data/D_individual_f1.0' u ($2/(p050-$1)**nu):($3/(p050-$1)**mu) w p ls 7 notit, \
'data/D_individual_f1.0' u ($2/(p050-$1)**nu):($3/(p050-$1)**mu) w p ls 3 ti '1.00', \
'data/D_individual_f1.25' u ($2/(p050-$1)**nu):($3/(p050-$1)**mu) w p ls 8 notit, \
'data/D_individual_f1.25' u ($2/(p050-$1)**nu):($3/(p050-$1)**mu) w p ls 4 ti '1.25', \
(x>=1.e0 && x<6.e0 ? 200*x**2 :1/0) w l ls 9 ti '(f/{/Symbol d}{/Symbol f}^{/Symbol n})^{2}', \
(x>=8.e1 && x<1.e3 ? 500*x**1 :1/0) w l ls 10 ti '(f/{/Symbol d}{/Symbol f}^{/Symbol n})^{1}'
