#!/bin/bash

grep -E '"id"|"site_name"|"latitude"|"longitude"' gsxtrack.json | \
awk '
/"id"/ { id=$0; gsub(/.*: "|",?$/, "", id) }
/"site_name"/ { name=$0; gsub(/.*: "|",?$/, "", name) }
/"latitude"/ { lat=$0; gsub(/.*: |,?$/, "", lat) }
/"longitude"/ { lon=$0; gsub(/.*: |,?$/, "", lon); print id","name","lat","lon }
' > titik-penting.txt

echo "Parsing selesai! Hasil disimpan di titik-penting.txt"
cat titik-penting.txt
