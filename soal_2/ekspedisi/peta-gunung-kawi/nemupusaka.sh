#!/bin/bash

lat1=$(awk -F',' 'NR==1{print $3}' titik-penting.txt)
lon1=$(awk -F',' 'NR==1{print $4}' titik-penting.txt)
lat3=$(awk -F',' 'NR==3{print $3}' titik-penting.txt)
lon3=$(awk -F',' 'NR==3{print $4}' titik-penting.txt)

lat_tengah=$(awk "BEGIN {printf \"%.6f\", ($lat1 + $lat3) / 2}")
lon_tengah=$(awk "BEGIN {printf \"%.6f\", ($lon1 + $lon3) / 2}")

echo "Koordinat pusat: $lat_tengah, $lon_tengah"
echo "$lat_tengah, $lon_tengah" > posisipusaka.txt
