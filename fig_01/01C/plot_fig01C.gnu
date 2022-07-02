reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_01C.eps'

set size ratio 0.8
set border linewidth 2
set key at 6.e-1,9.e1 samplen 2
set key spacing 0.85
set key font ",20"

set log
set format x "10^{%L}"
set format y "10^{%L}"

set xlabel "{/Symbol w} {/Symbol t}_{M}" font ',27'
set ylabel "G'({/Symbol w}), G''({/Symbol w})" font ',27'
set xtics 1e-6,1.e2,1e6
set ytics 1e-6,1.e2,1e6

set style line 1 lt 1 lc rgb "#EE6677" lw 4
set style line 2 lt 2 lc rgb "#EE6677" lw 5
set style line 3 lt 1 lc rgb "#4477AA" lw 4
set style line 4 lt 2 lc rgb "#4477AA" lw 5

w70 = 2.9248676026948757
w80 = 1.0970507352523164E-002

pl [1.e-2:1.e2][1.e-2:1.e2] \
'data/GP_0.70' u ($1/w70):2 w l ls 1 ti "{/Symbol f} = 0.70, G' ",\
'data/GPP_0.70' every 1 u ($1/w70):2 w l ls 2 ti "G''",\
'data/GP_0.80' u ($1/w80):2 w l ls 3 ti "{/Symbol f} = 0.80, G' ",\
'data/GPP_0.80' every 1 u ($1/w80):2 w l ls 4 ti "G''"
