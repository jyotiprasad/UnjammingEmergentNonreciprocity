reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_04A.eps'

set key at 6.e-1,1.1 samplen 2
set key spacing 1.3
set key font ",20"

set size ratio 0.8
set border linewidth 2

set log x
set format x "10^{%L}"
set ylabel '{/Symbol y}({/Symbol l}_{+},{/Symbol l}_{-})' font ',25'
set xlabel '{/Symbol t}_{p}' font ',25'
set ytics -0.2,0.2,1.2

#set label '{/Symbol y} = 2({/Symbol l}_{+}/({/Symbol l}_{+}+{/Symbol l}_{-}) - 1/2)' at 1,0.3 font ',22'

pl [5.e-3:5.e2][0:1.1] 'data/taup_lam1_lam2_lamr_phi0.350_all' every 1::0 u 1:(2*(($2/($2+$3))-0.5)) w p ps 2.75 pt 5 lw 2 lc 'black' notit,\
'data/taup_lam1_lam2_lamr_phi0.350_all' every 1::0 u 1:(2*(($2/($2+$3))-0.5)) w p ps 2.5 pt 5 lc '#4477AA' ti '{/Symbol f} = 0.350',\
'data/taup_lam1_lam2_lamr_phi0.375_all' every 1::0 u 1:(2*(($2/($2+$3))-0.5)) w p ps 2.75 pt 7 lw 2 lc 'black' notit,\
'data/taup_lam1_lam2_lamr_phi0.375_all' every 1::0 u 1:(2*(($2/($2+$3))-0.5)) w p ps 2.5 pt 7 lc '#228833' ti '0.375',\
'data/taup_lam1_lam2_lamr_phi0.400_all' every 1::0 u 1:(2*(($2/($2+$3))-0.5)) w p ps 2.75 pt 9 lw 2 lc 'black' notit,\
'data/taup_lam1_lam2_lamr_phi0.400_all' every 1::0 u 1:(2*(($2/($2+$3))-0.5)) w p ps 2.5 pt 9 lc '#EE6677' ti '0.400',\
'data/taup_lam1_lam2_lamr_phi0.420_all' every 1::0 u 1:(2*(($2/($2+$3))-0.5)) w p ps 2.75 pt 11 lw 2 lc 'black' notit,\
'data/taup_lam1_lam2_lamr_phi0.420_all' every 1::0 u 1:(2*(($2/($2+$3))-0.5)) w p ps 2.5 pt 11 lc '#AA3377' ti '0.420'
