reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_05D.eps'

set key at 1.5, 1.5 samplen 2
set key spacing 1.2
set key font ",15"

set size ratio 0.8

set ylabel "f/{/Symbol g} - <V>" font ',25' textcolor rgb '#cb181d'
set y2label "{/Symbol r}{/Symbol \266}_{x}{/Symbol r}" font ',25' textcolor rgb '#2171b5'
set xlabel "f" font ',25'
set border linewidth 2
set xrange [0:6]
set yrange [0:1.4]
set y2range [0:0.016667]
set xtics 0, 1 font ',24'
set ytics nomirror 0, 0.5 font ',24' textcolor rgb '#cb181d'
set y2tics 0, 0.005 font ',24' textcolor rgb '#2171b5'

set style line 1 lt 1 lw 2 lc rgb 'black' ps 2.5 pt 6
set style line 2 lt 1 lw 1 lc rgb '#cb181d' ps 2.35 pt 7
set style line 3 lt 1 lw 2 lc rgb 'black' ps 2.2 pt 4
set style line 4 lt 1 lw 1 lc rgb '#2171b5' ps 2.05 pt 5
set style line 5 lt 1 lw 1 lc rgb '#fcbba1' ps 0.3 pt 7
set style line 6 lt 1 lw 1 lc rgb '#9ecae1' ps 0.3 pt 7
set style fill transparent solid 0.5 noborder

gam = 2.24323

pl [:5.2][] \
'data/f_rdxr_allproc' u 1:2 w p ls 6 axis x1y2 notit, \
'data/f_rdot_allproc' u 1:($1/gam - $2) w p ls 5 axis x1y1 notit, \
'data/f_rdot_rdxr_avg' u 1:($1/gam - $2) w p ls 1 axis x1y1 notit, \
'data/f_rdot_rdxr_avg' u 1:($1/gam - $2) w p ls 2 axis x1y1 notit, \
'data/f_rdot_rdxr_avg' u 1:3 w p ls 3 axis x1y2 notit, \
'data/f_rdot_rdxr_avg' u 1:3 w p ls 4 axis x1y2 notit
