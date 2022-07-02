reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_04B.eps'

unset key
set size ratio 0.8
set border linewidth 2

set log x
set format x "10^{%L}"
set ylabel '|<~{/:Bold R}{1.1.}>|' font ',25'
set xlabel '{/Symbol t}' font ',25'
set xtics 1.e-3, 1.e1, 1.e3
set ytics -0.2, 0.2, 1.6 

#set label "f = 3.0" at 3.e-2,0.7 font ',20'

pl [5.e-3:5.e2][-0.1:1.3]\
'data/taup_AvgVel_phi0.350_all' u 1:4 w p ps 2.75 pt 5 lw 2 lc 'black' notit,\
'data/taup_AvgVel_phi0.350_all' u 1:4 w p ps 2.5 pt 5 lc '#4477AA' ti '{/Symbol f} = 0.350',\
'data/taup_AvgVel_phi0.375_all' u 1:4 w p ps 2.75 pt 7 lw 2 lc 'black' notit,\
'data/taup_AvgVel_phi0.375_all' u 1:4 w p ps 2.5 pt 7 lc '#228833' ti '0.375',\
'data/taup_AvgVel_phi0.400_all' u 1:4 w p ps 2.75 pt 9 lw 2 lc 'black' notit,\
'data/taup_AvgVel_phi0.400_all' u 1:4 w p ps 2.5 pt 9 lc '#EE6677' ti '0.400',\
'data/taup_AvgVel_phi0.420_all' u 1:4 w p ps 2.75 pt 11 lw 2 lc 'black' notit,\
'data/taup_AvgVel_phi0.420_all' u 1:4 w p ps 2.5 pt 11 lc '#AA3377' ti '0.420'
