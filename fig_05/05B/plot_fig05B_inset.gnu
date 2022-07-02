reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig05B_inset.eps'

set size ratio 0.8
set key at 8, 0.0038 samplen 2
set key spacing 1.2
set key font ",40"

set xlabel 'x' font ',50'
set ylabel 'v_{x}' font ',50'
set border linewidth 2
set xtics -30,10 font ',40'
set ytics -0.01,0.002,0.01 font ',40'
 
set style line 1 lt 1 lw 2 lc rgb 'black' ps 1.2 pt 6
set style line 2 lt 1 lw 1 lc rgb '#b30000' ps 1.05 pt 7   # #228833  #EE6677
set style line 3 lt 1 lw 2 lc rgb 'black' ps 1.0 pt 4 
set style line 4 lt 1 lw 1 lc rgb '#08519c' ps 0.9 pt 5


b = 4.29374

pl [-22:22][-0.004:0.004] \
'data/x_y_r_dxr_dyr_vx_vy_g2vx_g2vy' u ($2>=7 && $2<=9 ? $1 : 1/0):6 w p ls 3 notit, \
'data/x_y_r_dxr_dyr_vx_vy_g2vx_g2vy' u ($2>=7 && $2<=9 ? $1 : 1/0):6 w p ls 4 ti 'v_x', \
'data/x_y_r_dxr_dyr_vx_vy_g2vx_g2vy' u ($2>=7 && $2<=9 ? $1 : 1/0):(-b*$3*$4) w p ls 1 notit, \
'data/x_y_r_dxr_dyr_vx_vy_g2vx_g2vy' u ($2>=7 && $2<=9 ? $1 : 1/0):(-b*$3*$4) w p ls 2 ti '-B/{/Symbol G} {/Symbol r}{/Symbol \266}_{x}{/Symbol r}'
