#################################################################################################
set terminal cairolatex standalone pdf size 8.0,3.2 in header "\\input{packages}"
set xlabel "Time (\\si{\\days})"
set xrange [2 : 8]
set xtics   0,1,9
#set grid
set lmargin 9
set tmargin 2
set bmargin 3.5
set datafile separator ','
set style data linespoints

#################################################################################################
set ylabel "Flow rate (\\si[per-mode=symbol]{\\metre\\tothe{3}\\per\\s})" offset -0.5,0
set yrange [-50: 2000]
set ytics     0,500,2000
set tmargin 3
set bmargin -1
set rmargin -1
unset grid
set linestyle 1 lt 1 lw 2 pt 7 pi 48 lc rgbcolor "#008837"
set linestyle 2 lt 1 lw 2 pt 2 pi  4 lc rgbcolor "#d7191c"
set linestyle 3 lt 1 lw 2 pt 4 pi  4 lc rgbcolor "#a6611a"
set linestyle 4 lt 1 lw 2 pt 8 pi  4 lc rgbcolor "#5e3c99"
set linestyle 5 lt 1 lw 2 pt 12 pi  4 lc rgbcolor "#0571b0"
set linestyle 7 lt 1 lw 2 pt 14 pi  12 lc rgbcolor "#fdae61"
set linestyle 8 lt 1 lw 2 pt 16 pi  12 lc rgbcolor "#2b83ba"
# Yellow: "#fdae61"
# Other:  "#2b83ba"
# Other:  "#8c510a"
#set linestyle 6 dt 3 lw 2 pt 8 pi  4 lc rgbcolor "#5e3c99"
#set linestyle 5 lt 1 lw 2 pt 3 pi 96 lc rgbcolor "#0571b0"
#################################################################################################
set output 'harvey_hcfcd_outflow_hydrograph.tex'

set key outside width 8 vertical maxrows 15 right reverse Left spacing 2.4
set title 'Hydrograph at Brays Bayou at MLK Jr. Blvd, Houston, TX'

### Plotting Data

plot './USGS_Gage_Data.csv'                   using ($1/86400):($2/35.314666212661) ls 1 title "USGS gauge data", \
     './gssha.constslopebc.csv'               using ($1/1440):($2/35.314666212661)  ls 2 title "GSSHA-only; Hydraulic slope BC" , \
     './gssha.constdepthbc.csv'               using ($1/1440):($2/35.314666212661)  ls 3 title "GSSHA-only; Constant depth BC" , \
     './adhgssha.withriver.csv'               using ($1/1440):($2/35.314666212661)  ls 4 title "Water Coupler: GSSHA-AdH" , \
     './adcircgssha.withriver.csv'            using ($1/1440):($2/35.314666212661)  ls 5 title "Water Coupler: GSSHA-ADCIRC" #, \
     #'./adcirclstmnn.event_pred_morgans.csv'  using ((37.0/24.0)+$1/24):($18)       ls 7 title "AdcircNN: LSTM NN-ADCIRC: Moragn's point" , \
     #'./adcirclstmnn.event_pred_braysMLK.csv' using ((37.0/24.0)+$1/24):($18)       ls 8 title "AdcircNN: LSTM NN-ADCIRC: Brays @ MLK" #, \

     #'./adhgssha.withoutriver.csv'            using ($1/1440):($2/35.314666212661)  ls 7 title "Water Coupler: GSSHA-AdH: Old" , \
     #'./adcircgssha.withoutriver.csv'         using ($1/1440):($2/35.314666212661)  ls 8 title "Water Coupler: GSSHA-ADCIRC: Old" , \

unset output
