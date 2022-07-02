reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_05B.eps'

set size ratio 0.8
set key top right samplen 2
set key spacing 1.2
set key font ",19"

set xlabel '{/Symbol r}{/Symbol \266}_{y}{/Symbol r}' font ',25'
set ylabel 'v_{y}' font ',25'
set border linewidth 2
set xtics -0.005,0.001,0.005 font ',22'
set ytics -0.020,0.004,0.020 font ',22'

set style line 1 lt 1 lw 2 lc rgb 'black' ps 0.6 pt 6
set style line 2 lt 1 lw 1 lc rgb '#c6dbef' ps 0.3 pt 7  #  #80cdc1   #fc9272
set style line 3 lt 0 lw 12 lc rgb 'black'

set label "B/{/Symbol G} =  4.29374" at -0.0009, 0.0085 font ',19'
set label "  {/Symbol \261} 0.09348" at -0.0005, 0.0075 font ',19'

b = 4.29374
f(x) = -b*x

pl [-0.0012:0.003][-0.006:0.01] \
'data/x_y_r_dxr_dyr_vx_vy_g2vx_g2vy' u (sqrt($1*$1+$2*$2)>=4 && sqrt($1*$1+$2*$2)<=14 ? $3*$5 : 1/0):7 w p ls 2 notit, \
(x>= -0.0012&& x<=0.002 ? f(x) : 1/0) w l ls 3 notit
