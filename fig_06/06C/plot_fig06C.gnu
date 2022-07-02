reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_06C.eps'

set size ratio 0.8
set border linewidth 2

set key top left samplen 2
set key font ",24"
set key spacing 1.0
unset key

set xlabel "u/{/Symbol x}" font ',33'
set ylabel "|u/{/Symbol x}|^{3/2} {/Symbol d}{/Symbol r}" font ',33'

set xtics -30, 1 font ',33'
#set ytics -0.04, 0.01 font ',33'

set style line 1 lt 1 lc rgb "black" lw 2 ps 1.0 pt 5
set style line 2 lt 1 lc rgb "#EE6677" lw 2 ps 0.9 pt 5

xi = 14.0
p = 1.5

pl [-3.1:3.1][-0.01:0.01] \
'data/y0_x_delrho_sigrho' every 1::0 u ($1/xi):($2*((sqrt($1*$1/(xi*xi)))**p)) w p ls 1 notit, \
'data/y0_x_delrho_sigrho' every 1::0 u ($1/xi):($2*((sqrt($1*$1/(xi*xi)))**p)):3 w yerrorbars ls 2 notit
