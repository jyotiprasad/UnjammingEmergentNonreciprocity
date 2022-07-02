reset
set term post enhan color eps 'CMUSerif-Roman, 30'
set output 'fig_S04C.eps'

set size ratio 0.8
set border linewidth 2

set key top left samplen 2
set key font ",24"
set key spacing 1.0
unset key

set xlabel "w/{/Symbol x}" font ',33'
set ylabel "v_u" font ',33'

set style line 1 lt 1 lc rgb "black" lw 2 ps 1.05 pt 5
set style line 2 lt 1 lc rgb "#EE6677" lw 2 ps 0.9 pt 5
set style line 3 lt 1 lc rgb "black" lw 2 ps 1.05 pt 5
set style line 4 lt 1 lc rgb "#4477AA" lw 2 ps 0.9 pt 5

xi = 14.0

pl [-2.1:2.1][-0.0075:0.03] \
'data/x2p_y_delrho_vu_vw_sigrho_sigvu_sigvw' every 1::0 u ($1/xi):3 ls 1 notit, \
'data/x2p_y_delrho_vu_vw_sigrho_sigvu_sigvw' every 1::0 u ($1/xi):3:6 w yerrorbars ls 2 ti 'u = +2',\
'data/x2m_y_delrho_vu_vw_sigrho_sigvu_sigvw' every 1::0 u ($1/xi):3 ls 3 notit, \
'data/x2m_y_delrho_vu_vw_sigrho_sigvu_sigvw' every 1::0 u ($1/xi):3:6 w yerrorbars ls 4 ti '= -2'
