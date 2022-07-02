reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_S01C.eps'

set size ratio 0.8
set border linewidth 2

set key top left samplen 2
set key font ",22"
set key spacing 1.0

set log
set format x "10^{%L}"
set format y "10^{%L}"

set xlabel "{/Symbol t}" font ',35'
set ylabel "<{/Symbol D}r^2({/Symbol t})>" font ',35'
set xtics 1.e-4,1.e2 font ',35'
set ytics 1.e-5,1.e2 font ',35'

set style line 1 lt 1 lc rgb "#a50f15" lw 4
set style line 2 lt 1 lc rgb "#006d2c" lw 4
set style line 3 lt 1 lc rgb "#08519c" lw 4
set style line 4 lt 1 lc rgb "#000000" lw 4

pl [1.e-3:2.e4][1.e-3:2.e3] \
'data/MSD_av_0.80' u 1:2 w l ls 1 ti '{/Symbol f} = 0.80', \
'data/MSD_av_0.70' u 1:2 w l ls 2 ti '0.70', \
'data/MSD_av_0.60' u 1:2 w l ls 3 ti '0.60', \
'data/MSD_av_0.20' u 1:2 w l ls 4 ti '0.20'

