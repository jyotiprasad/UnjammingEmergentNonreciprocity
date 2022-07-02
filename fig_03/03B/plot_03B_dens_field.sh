#!/bin/sh
mkdir -p plot
file="list"
while IFS= read line
do
echo "creating density field plot for $line"
gnuplot -e "set term pngcairo enhanced; set size sq; set ylabel ''; set xlabel ''; unset xtics; unset ytics; set xrange [-22.25:22.25]; set yrange [-22.25:22.25]; set cbrange [0.00044:0.00054]; unset colorbox; set border linewidth 2; set pm3d map; set pm3d interpolate 4,4; spl 'data/dens_field_$line' u 1:2:3 w pm3d notit" > plot/dens_field_$line.png
done <"$file"
