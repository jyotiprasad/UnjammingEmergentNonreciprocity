
set term svg size 500,420 enhanced font 'CMU sherif,20'
set output 'delrho.svg'
set xtics -10,5,10
set ytics -0.5,0.1,1
set key off
plot [-5:10][:0.3] 'm_x.txt' u ($1/2):($2-0.6221) w lp pt 7 ps 0.6 lc 7 lw 2

reset


set term svg size 500,420 enhanced font 'CMU sherif,20'
set output 'vx.svg'
set xtics -10,5,10
set ytics -0.5,0.1,1
set key off
plot [-5:10][:0.4] 'v_x.txt' u ($1/2):2 w lp pt 7 ps 0.6 lc 7 lw 2

reset

