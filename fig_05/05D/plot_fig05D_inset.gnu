reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_05D_inset.eps'

set key top left samplen 2
set key spacing 1.5
set key font ",20"

set size ratio 1
set border linewidth 2

set ylabel 'C/{/Symbol g}' font ',40'
set xlabel 'f' font ',40'
set xtics 0,1,10 font ',40'
set ytics 0,100,1000 font ',40'

set style line 1 lt 1 lc rgb 'black' lw 3 ps 3.5 pt 6
set style line 2 lt 1 lc rgb '#cb181d' lw 2 ps 3.35 pt 7
set style line 3 lt 0 lc rgb '#black' lw 10
set style fill transparent solid 0.5 noborder

pl [1.2:5.2][0:210] \
'data/f_Cbyg_allproc' u 1:2 w p ps 0.6 pt 7 lc '#fc9272' notit, \
'data/f_Cbyg_avg' u 1:($3 - $4):($3 + $4) with filledcurves lc rgb "#black" notit, \
'data/f_Cbyg_avg' u 1:3 w l ls 3 notit, \
'data/f_Cbyg_avg' u 1:2 w p ls 1 notit, \
'data/f_Cbyg_avg' u 1:2 w p ls 2 notit
