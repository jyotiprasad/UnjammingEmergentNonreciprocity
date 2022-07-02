reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_S02B.eps'

set key top left samplen 2
set key spacing 1.0
set key font ",22"

set size ratio 0.8

set log x
set format x "10^{%L}"
set ylabel '{/Symbol y}({/Symbol l}_{+},{/Symbol l}_{-})' font ',35'
set xlabel '{/Symbol t}' font ',35'
set xtics 1.e-4, 1.e2 font ',35'
set ytics -0.2,0.2,1.2 font ',35'
set border linewidth 2


set style line 1 lt 1 lc rgb "black" lw 2 ps 2.6 pt 4
set style line 2 lt 1 lc rgb "#cb181d" lw 1 ps 2.5 pt 5 # red

set style line 3 lt 1 lc rgb "black" lw 2 ps 2.6 pt 6
set style line 4 lt 1 lc rgb "#238b45" lw 1 ps 2.5 pt 7 # green (or #006d2c darker green)

set style line 5 lt 1 lc rgb "black" lw 2 ps 2.6 pt 8
set style line 6 lt 1 lc rgb "#2171b5" lw 1 ps 2.5 pt 9 # blue (or #08519c darker blue)

set style line 7 lt 1 lc rgb "black" lw 2 ps 2.6 pt 12
set style line 8 lt 1 lc rgb "#ae017e" lw 1 ps 2.5 pt 13  # violet (or #6a51a3 purple)


pl [7.0e-3:4.3e2][0:1.1] \
'data/taup_lam1_lam2_phi0.350_all' every 1::0 u 1:(2*(($2/($2+$3))-0.5)) w p ls 1 notit,\
'data/taup_lam1_lam2_phi0.350_all' every 1::0 u 1:(2*(($2/($2+$3))-0.5)) w p ls 2 ti '{/Symbol f} = 0.350',\
'data/taup_lam1_lam2_phi0.375_all' every 1::0 u 1:(2*(($2/($2+$3))-0.5)) w p ls 3 notit,\
'data/taup_lam1_lam2_phi0.375_all' every 1::0 u 1:(2*(($2/($2+$3))-0.5)) w p ls 4 ti '0.375',\
'data/taup_lam1_lam2_phi0.400_all' every 1::0 u 1:(2*(($2/($2+$3))-0.5)) w p ls 5 notit,\
'data/taup_lam1_lam2_phi0.400_all' every 1::0 u 1:(2*(($2/($2+$3))-0.5)) w p ls 6 ti '0.400',\
'data/taup_lam1_lam2_phi0.420_all' every 1::0 u 1:(2*(($2/($2+$3))-0.5)) w p ls 7 notit,\
'data/taup_lam1_lam2_phi0.420_all' every 1::0 u 1:(2*(($2/($2+$3))-0.5)) w p ls 8 ti '0.420'
