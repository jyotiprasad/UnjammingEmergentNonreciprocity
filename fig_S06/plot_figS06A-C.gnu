reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_S06A.eps'
#set output 'fig_S06B.eps'
#set output 'fig_S06C.eps'

set size ratio 0.8
set border linewidth 2

set key top left samplen 2
set key font ",24"
set key spacing 1.0

set xlabel "u/{/Symbol x}" font ',33'
set ylabel "{/Symbol d}{/Symbol r}" font ',33'
#set ylabel "|u/{/Symbol x}|^{1/2} {/Symbol d}{/Symbol r}" font ',33'
#set ylabel "|u/{/Symbol x}|^{3/2} {/Symbol d}{/Symbol r}" font ',33'

#set xtics -30, 0.5 font ',33'
#set ytics -0.3, 0.03 font ',33'

set style line 1 lt 1 lc rgb "#EE6677" lw 2 ps 0.85 pt 5
set style line 2 lt 1 lc rgb "#4477AA" lw 2 ps 1.0 pt 7

p = 0.0
#p = 0.5
#p = 1.5
xi = 14.0

pl [-3:3][] \
'data/y0_avg_L0_45' every 2::0 u ($1/xi):($2*((sqrt($1*$1/(xi*xi)))**p)) w lp ls 1 ti 'L_0 = 45', \
'data/y0_avg_L0_90' every 1::0 u ($1/xi):($2*((sqrt($1*$1/(xi*xi)))**p)) w lp ls 2 ti '= 90'
