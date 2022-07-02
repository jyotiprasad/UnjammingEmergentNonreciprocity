reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_03A1_traj_taup1e-2.eps'

set size sq
set border linewidth 2
set key top left samplen 2
set key spacing 1
set key font ",20"

set ylabel "y" font ',27'
set xlabel "x" font ',27'

#set label 't = 20' at 11,17 font ',18'
set xtics -30,5,30 font ',25'
set ytics -30,5,30 font ',25'
#unset colorbox

h1 = 1/360.0
h2 = 227/360.0
set palette model HSV functions (1-gray)*(h2-h1)+h1,1,0.68

pl [-15:15][-15:15] 'data/t_x_y_phi0.325_taup1.0e-2_proc00' u ($2-3.0443252228368304E-002):($3+0.81106974587861025):1 w l lt 1 lw 5 lc palette notit
##################################################################################################################

reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_03A2_traj_taup1e-1.eps'

set size sq
set border linewidth 2
set key top left samplen 2
set key spacing 1
set key font ",20"

set ylabel "y" font ',27'
set xlabel "x" font ',27'

#set label 't = 20' at 11,17 font ',18'
set xtics -30,5,30 font ',25'
set ytics -30,5,30 font ',25'
unset colorbox

h1 = 1/360.0
h2 = 227/360.0
set palette model HSV functions (1-gray)*(h2-h1)+h1,1,0.68

pl [-15:15][-15:15] 'data/t_x_y_phi0.325_taup1.0e-1_proc00' u ($2-1.3404419937097334):($3+2.7594370317648385):1 w l lt 1 lw 5 lc palette notit
##################################################################################################################

reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_03A3_traj_taup1e+0.eps'

set size sq
set border linewidth 2
set key top left samplen 2
set key spacing 1
set key font ",20"

set ylabel "y" font ',27'
set xlabel "x" font ',27'

#set label 't = 20' at 11,17 font ',18'
set xtics -30,5,30 font ',25'
set ytics -30,5,30 font ',25'
unset colorbox

h1 = 1/360.0
h2 = 227/360.0
set palette model HSV functions (1-gray)*(h2-h1)+h1,1,0.68

pl [-15:15][-15:15] 'data/t_x_y_phi0.325_taup1.0e+0_proc00' u ($2-1.4975555632072144):($3-2.6842792358477814):1 w l lt 1 lw 5 lc palette notit
##################################################################################################################

reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_03A4_traj_taup1e+1.eps'

set size sq
set border linewidth 2
set key top left samplen 2
set key spacing 1
set key font ",20"

set ylabel "y" font ',27'
set xlabel "x" font ',27'

#set label 't = 20' at 11,17 font ',18'
set xtics -30,5,30 font ',25'
set ytics -30,5,30 font ',25'
unset colorbox

h1 = 1/360.0
h2 = 227/360.0
set palette model HSV functions (1-gray)*(h2-h1)+h1,1,0.68

pl [-15:15][-15:15] 'data/t_x_y_phi0.325_taup1.0e+1_proc00' u ($2-11.882307823992763):($3-8.2495385307596560):1 w l lt 1 lw 5 lc palette notit
##################################################################################################################

reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_03A5_traj_taup1e+2.eps'

set size sq
set border linewidth 2
set key top left samplen 2
set key spacing 1
set key font ",20"

set ylabel "y" font ',27'
set xlabel "x" font ',27'

#set label 't = 20' at 11,17 font ',18'
set xtics -30,5,30 font ',25'
set ytics -30,5,30 font ',25'
unset colorbox

h1 = 1/360.0
h2 = 227/360.0
set palette model HSV functions (1-gray)*(h2-h1)+h1,1,0.68

pl [-15:15][-15:15] 'data/t_x_y_phi0.325_taup1.0e+2_proc00' u ($2-12.446838958240352):($3-9.2036560418721010):1 w l lt 1 lw 5 lc palette notit
##################################################################################################################
