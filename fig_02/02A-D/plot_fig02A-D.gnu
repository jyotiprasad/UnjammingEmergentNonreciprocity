reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_02A_xy_traj_phi08_f1e+0.eps'

set size sq
set key top left samplen 2
set key spacing 1
set key font ",24"

set ylabel "y" font ',27'
set xlabel "x" font ',27'

set label '{/Symbol f} = 0.08' at -60,60 font ',24'
set label 'f = 1.00' at -57,45 font ',24'

pl [][] 'data/phi0.08_f1.0_conf00' every (56)::1 u ($1+40):($2+0) w l lw 6 lc 'violet' notit
#############################################################################################

reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_02B_xy_traj_phi60_f1e+0.eps'

set size sq
set key top left samplen 2
set key spacing 1
set key font ",24"

set ylabel "y" font ',27'
set xlabel "x" font ',27'

set label '{/Symbol f} = 0.60' at -50,50 font ',24'
set label 'f = 1.00' at -48,35 font ',24'

pl [-70:70][-70:70] 'data/phi0.60_f1.0_conf00' every (56)::7 u ($1-10):($2-40) w l lw 6 lc 'dark-green' notit
###############################################################################################################

reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_02C_xy_traj_phi80_f1e+0.eps'

set size sq
set key top left samplen 2
set key spacing 1
set key font ",24"

set ylabel "y" font ',27'
set xlabel "x" font ',27'

set label '{/Symbol f} = 0.80' at -3,-1 font ',24'
set label 'f = 1.00' at -2.85,-1.5 font ',24'

pl [-4:4][-4:4] 'data/phi0.80_f1.0_conf00' every (56)::15 u ($1+20):($2-20.5) w l lw 6 lc 'orange' notit
########################################################################################################

reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_02D_xy_traj_phi90_f1e+0.eps'

set size sq
set key top left samplen 2
set key spacing 1
set key font ",24"

set ylabel "y" font ',27'
set xlabel "x" font ',27'

set label '{/Symbol f} = 0.90' at -1.5,1.5 font ',24'
set label 'f = 1.00' at -1.43,1.2 font ',24'
set xtics -4,1,4
set ytics -4,1,4

pl [-2:2][-2:2] 'data/phi0.90_f1.0_conf00' every (56)::18 u ($1-17.2):($2-8) w l lw 6 lc 'black' notit
