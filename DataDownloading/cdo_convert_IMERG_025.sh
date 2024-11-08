#!/bin/bash
cat > mygrid << EOF
gridtype = lonlat
xsize    = 1440
ysize    = 719
xfirst   = 0
xinc     = 0.25
yfirst   = -89.75
yinc     = 0.25
EOF

cat IMERG_2001.txt | while read p; do
   fid=$p
   sl="/neelin2020/ACRE/IMERG_025/${fid:30:56}"
#cdo remapcon2,mygrid -select,name=precipitationCal ${sl} ${sl}_re025.nc
ncks -3 -v precipitationCal ${sl} ${sl}.out0251.nc
cdo remapcon,mygrid ${sl}.out0251.nc ${sl}.re025.nc
rm ${sl}.out0251.nc
done 
