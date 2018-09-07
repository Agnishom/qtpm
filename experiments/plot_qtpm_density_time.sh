#!/bin/bash

# $1: file_name
if (($# < 2)); then
    echo "Usage: $0 input_file [output_file]" # [plot_type]
    exit 1
fi

gnuplot <<EOF
set terminal tikz
set output "$2"
set xlabel 'Sampling Frequency [Hz]'
set ylabel 'Execution Time [s]'
plot "$1" u (6000/\$1):2 w lp title 'Overshoot',  "$1" u (6000/\$1):4 w lp title 'Ringing'
EOF