reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_S04A.eps'

set size ratio 0.8
set border linewidth 2

set key at -3.3, 0.02 samplen 2
set key font ",27"
set key spacing 1.0

set xlabel "u" font ',33'
set ylabel "{/Symbol d}{/Symbol r}" font ',33'
set xtics -30, 5 font ',33'
set ytics -0.1, 0.01 font ',33'

set style line 1 lt 1 lc rgb "#e31a1c" lw 6  # #e41a1c
set style line 2 lt 1 lc rgb "#238443" lw 6  # #4daf4a
set style line 3 lt 1 lc rgb "#225ea8" lw 6  # #377eb8

set label '{/Symbol f} = 0.40, T = 0.1' at -14, 0.025 font ',27'

pl [-15:15][-0.03:0.03] \
'data/phi0.40_f0.5_ref_y0p_x_rho_t200' u 1:($2-$5) w l ls 1 ti 'f = 0.5', \
'data/phi0.40_f2.0_ref_y0p_x_rho_t200' u 1:($2-$5) w l ls 2 ti '2.0', \
'data/phi0.40_f8.0_ref_y0p_x_rho_t200' u 1:($2-$5) w l ls 3 ti '8.0'
