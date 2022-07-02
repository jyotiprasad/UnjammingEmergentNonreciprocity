reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_05C.eps'

set key at 2.0, 1.1 samplen 2
set key spacing 1.2
set key font ",20"

set size ratio 0.8

set ylabel "<~X{0.8.}>" font ',25'
set xlabel "f" font ',25'

set border linewidth 2
set xrange [0:6]
set yrange [0:1.8]
set xtics 0, 1 font ',24'
set ytics 0, 0.5 font ',24'

set style line 1 lt 1 lw 2 lc rgb 'black' ps 2.5 pt 6
set style line 2 lt 1 lw 1 lc rgb '#cb181d' ps 2.35 pt 7
set style line 3 lt 1 lw 1 lc rgb '#fcbba1' ps 0.3 pt 7   #fcbba1     #fc9272

set style line 4 lt 1 lw 2 lc rgb 'black' ps 2.5 pt 6
set style line 5 lt 1 lw 1 lc rgb '#238b45' ps 2.35 pt 7
set style line 6 lt 1 lw 1 lc rgb '#c7e9c0' ps 0.3 pt 7
set style fill transparent solid 0.5 noborder

pl [:4.1][:1.2] \
'data/f_rdot_allproc_phi0.45_T1.e-3' u 1:2 w p ls 3 notit, \
'data/f_rdot_allproc' u 1:2 w p ls 6 notit, \
'data/f_xdot_ydot_rdot_phi0.45_T1.e-3' u 1:2 w p ls 1 notit, \
'data/f_xdot_ydot_rdot_phi0.45_T1.e-3' u 1:2 w p ls 2 ti 'T = 10^{-3}', \
'data/f_rdot_rdxr_avg' u 1:2 w p ls 4 notit, \
'data/f_rdot_rdxr_avg' u 1:2 w p ls 5 ti '10^{-1}'
