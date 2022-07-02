reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_04C_densProf.eps'

set key top left samplen 2
set key spacing 1.7
set key font ",20"

set size ratio 2

set ylabel '{/Symbol d}{/Symbol r}(x,0)' font ',20'
set xlabel 'x' font ',20'
set border linewidth 2
set xtics -20,10,20 font ',20'
set ytics -0.05, 0.05 font ',20'

a = 0.02

pl [-20:20][-0.001:] \
'data/00/ref_y0p_x_rho_t090' u 1:($2-$4 + a) w l lw 4 lc 'red' notit,\
'data/02_shortrun/ref_y0p_x_rho_t010e-2' u 1:($2-$4 + (2*a)) w l lw 4 lc 'dark-green' notit,\
'data/02_shortrun/ref_y0p_x_rho_t050e-2' u 1:($2-$4 + (3*a)) w l lw 4 lc 'dark-green' notit,\
'data/02_shortrun/ref_y0p_x_rho_t197e-2' u 1:($2-$4 + (4*a)) w l lw 4 lc 'dark-green' notit,\
'data/02/ref_y0p_x_rho_t010' u 1:($2-$4 + (5*a)) w l lw 4 lc 'dark-green' notit,\
'data/02/ref_y0p_x_rho_t020' u 1:($2-$4 + (6*a)) w l lw 4 lc 'dark-green' notit,\
'data/02/ref_y0p_x_rho_t200' u 1:($2-$4 + (7*a)) w l lw 4 lc 'dark-green' notit,\
'data/02/ref_y0p_x_rho_t2000' u 1:($2-$4 + (8*a)) w l lw 4 lc 'dark-green' notit,\
'data/03_shortrun/ref_y0p_x_rho_t010e-2' u 1:($2-$4 + (9*a)) w l lw 4 lc 'red' notit,\
'data/03_shortrun/ref_y0p_x_rho_t100e-2' u 1:($2-$4 + (10*a)) w l lw 4 lc 'red' notit,\
'data/03/ref_y0p_x_rho_t002' u 1:($2-$4 + (11*a)) w l lw 4 lc 'red' notit,\
'data/03/ref_y0p_x_rho_t020' u 1:($2-$4 + (12*a)) w l lw 4 lc 'red' notit,\
'data/03/ref_y0p_x_rho_t200' u 1:($2-$4 + (13*a)) w l lw 4 lc 'red' notit,\
'data/03/ref_y0p_x_rho_t1900' u 1:($2-$4 + (14*a)) w l lw 4 lc 'red' notit

