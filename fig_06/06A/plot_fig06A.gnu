reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_06A.eps'

set size sq
set ylabel "w/{/Symbol x}"
set xlabel "u/{/Symbol x}"
set xtics -4, 1, 4
set ytics -4, 1, 4
set cbtics -0.012, 0.002, 0.012

xi = 14.0
lx = 2.0
set xrange [-lx:lx]
set yrange [-lx:lx]
set cbrange [-0.005:0.005]      #[0.586:0.627]
set border linewidth 2

set pm3d map
set pm3d interpolate 5,5
set palette rgb 33, 13, 10 #rainbow

set label "{/Symbol d}{/Symbol r}" at 30,-30

spl 'data/densvelfield_av' u ($1/xi):($2/xi):3 notit, \
'data/densvelfield_av_nospace' every 2:2 u ($1/xi):($2/xi):(0):(7.e2*$4/xi):(7.e2*$5/xi):(0) with vectors filled head lw 1 lc 'black' notit, \
'data/posC' u ($1/xi):($2/xi):(0) w p ps 2.0 pt 6 lc 'black' notit, \
'data/posC' u ($1/xi):($2/xi):(0) w p ps 1.75 pt 7 lc 'white' notit
