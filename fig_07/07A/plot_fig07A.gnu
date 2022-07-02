reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_07A.eps'

set key at 90,12.5 samplen 2
set key spacing 1.0
set key font ',25' #",20"
unset key

set size ratio 0.8
set border linewidth 2
set ylabel 'X_{i}(t) - {~X{0.8.}}t' font ',32'
set xlabel 't' font ',32'

set style line 1 lt 1 lw 2 ps 1.0 pt 7 lc rgb '#EE6677' # light red
set style line 2 lt 1 lw 2 ps 1.0 pt 7 lc rgb '#4477AA' # light blue
set style line 3 lt 1 lw 2 ps 1.0 pt 7 lc rgb '#000000'

V=0.373
x0=43.429273462189343

plot [0:1200][] \
 'data/d_20.00_t2500_mean_traj' u 0:(x0 + $1 - V*$0):5 w yerrorbars ls 1 notit, \
                             '' u 0:(x0 + $3 - V*$0):7 w yerrorbars ls 2 notit, \
                             '' u 0:(x0 + $1 - V*$0) w l ls 3 notit, \
                             '' u 0:(x0 + $3 - V*$0) w l ls 3 notit

