reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_02E.eps'

set size ratio 1
set key spacing 0.8
set key at 2.2e-1, 1.5e-1
set key font ",19" samplen 2

set log
set format x "10^{%L}"
set format y "10^{%L}"

set xlabel "t"
set ylabel "<{/Symbol D}r@^{2}_{C}(t)/t>"
set yrange [1e-5:1e2]
set xtics 1e-8,100,1e8
set ytics 1e-8,100,1e8

set border linewidth 2

set style line 5 lt 1 lc rgb "red" lw 4 ps 2 pt 7
set style line 6 lt 1 lc rgb "orange" lw 4 ps 2 pt 7
set style line 7 lt 1 lc rgb "dark-orange" lw 4 ps 2 pt 7
set style line 8 lt 1 lc rgb "green" lw 4 ps 2 pt 7
set style line 9 lt 1 lc rgb "dark-green" lw 4 ps 2 pt 7
set style line 10 lt 1 lc rgb "dark-cyan" lw 4 ps 2 pt 7
set style line 11 lt 1 lc rgb "blue" lw 4 ps 2 pt 7
set style line 12 lt 1 lc rgb "violet" lw 4 ps 2 pt 7
set style line 13 lt 1 lc rgb "gray50" lw 4 ps 2 pt 7
set style line 14 lt 1 lc rgb "black" lw 4 ps 2 pt 7

set label "f_0 = 1.0, {/Symbol t}_{p} = 50" at 3.e-4, 2e1 font ',20'
set label "activity-driven" at 5.5e1, 8.3e1 font ',19' rotate by 40 right
set label "cage-hopping" at 2.e3, 1.5e-2 font ',19' rotate by 0 right
set label "arrest" at 2.e2, 6e-5 font ',19' rotate by -45 right

pl [][] \
'data/MSDC_av_0.079_f1.0' every ::1 u 1:($2/$1) w l ls 12 ti '{/Symbol f} = 0.08',\
'data/MSDC_av_0.20_f1.0' every ::1 u 1:($2/$1) w l ls 11 ti '0.20',\
'data/MSDC_av_0.40_f1.0' every ::1 u 1:($2/$1) w l ls 10 ti '0.40',\
'data/MSDC_av_0.60_f1.0' every ::1 u 1:($2/$1) w l ls 9 ti '0.60',\
'data/MSDC_av_0.70_f1.0' every ::1 u 1:($2/$1) w l ls 8 ti '0.70',\
'data/MSDC_av_0.75_f1.0' every ::1 u 1:($2/$1) w l ls 7 ti '0.75',\
'data/MSDC_av_0.80_f1.0' every ::1 u 1:($2/$1) w l ls 6 ti '0.80',\
'data/MSDC_av_0.85_f1.0' every ::1 u 1:($2/$1) w l ls 5 ti '0.85',\
'data/MSDC_av_0.90_f1.0' every ::1 u 1:($2/$1) w l ls 14 ti '0.90'
