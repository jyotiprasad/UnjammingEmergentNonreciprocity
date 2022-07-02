reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_03C1_traj_taup1e-2.eps'

set size sq
set border linewidth 2
set key top left samplen 2
set key spacing 1
set key font ",20"

set ylabel "y" font ',27'
set xlabel "x" font ',27'

set label 't = 20' at 11,17 font ',18'
set xtics -20,5,20 font ',25'
set ytics -20,5,20 font ',25'
#unset colorbox

h1 = 1/360.0
h2 = 227/360.0
set palette model HSV functions (1-gray)*(h2-h1)+h1,1,0.68

pl [-15:15][-15:15] 'data/t_x_y_phi0.400_taup1.0e-2_proc00' u ($2):($3):1 w l lt 1 lw 5 lc palette notit
##################################################################################################################

reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_03C2_traj_taup1e-1.eps'

set size sq
set border linewidth 2
set key top left samplen 2
set key spacing 1
set key font ",20"

set ylabel "y" font ',27'
set xlabel "x" font ',27'

set label 't = 20' at 11,17 font ',18'
set xtics -20,5,20 font ',25'
set ytics -20,5,20 font ',25'
unset colorbox

h1 = 1/360.0
h2 = 227/360.0
set palette model HSV functions (1-gray)*(h2-h1)+h1,1,0.68

pl [-15:15][-15:15] 'data/t_x_y_phi0.400_taup1.0e-1_proc00' u ($2-2):($3):1 w l lt 1 lw 5 lc palette notit
##################################################################################################################

reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_03C3_traj_taup1e+0.eps'

set size sq
set border linewidth 2
set key top left samplen 2
set key spacing 1
set key font ",20"

set ylabel "y" font ',27'
set xlabel "x" font ',27'

set label 't = 20' at 11,17 font ',18'
set xtics -20,5,20 font ',25'
set ytics -20,5,20 font ',25'
unset colorbox

h1 = 1/360.0
h2 = 227/360.0
set palette model HSV functions (1-gray)*(h2-h1)+h1,1,0.68

pl [-15:15][-15:15] 'data/t_x_y_phi0.400_taup1.0e+0_proc00' u ($2+0):($3-1):1 w l lt 1 lw 5 lc palette notit
##################################################################################################################

reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_03C4_traj_taup1e+1.eps'

set size sq
set border linewidth 2
set key top left samplen 2
set key spacing 1
set key font ",20"

set ylabel "y" font ',27'
set xlabel "x" font ',27'

set label 't = 20' at 11,17 font ',18'
set xtics -20,5,20 font ',25'
set ytics -20,5,20 font ',25'
unset colorbox

h1 = 1/360.0
h2 = 227/360.0
set palette model HSV functions (1-gray)*(h2-h1)+h1,1,0.68

pl [-15:15][-15:15] 'data/t_x_y_phi0.400_taup1.0e+1_proc00' u ($2-9.8):($3-2):1 w l lt 1 lw 5 lc palette notit
##################################################################################################################

reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_03C5_traj_taup1e+2.eps'

set size sq
set border linewidth 2
set key top left samplen 2
set key spacing 1
set key font ",20"

set ylabel "y" font ',27'
set xlabel "x" font ',27'

set label 't = 20' at 11,17 font ',18'
set xtics -20,5,20 font ',25'
set ytics -20,5,20 font ',25'
unset colorbox

h1 = 1/360.0
h2 = 227/360.0
set palette model HSV functions (1-gray)*(h2-h1)+h1,1,0.68

pl [-15:15][-15:15] 'data/t_x_y_phi0.400_taup1.0e+2_proc00' u ($2-10):($3-7.5):1 w l lt 1 lw 5 lc palette notit
##################################################################################################################
