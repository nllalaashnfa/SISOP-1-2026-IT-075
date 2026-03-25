#!/bin/bash

# Ambil baris-baris yang mengandung id, site_name, latitude, longitude
# dari file gsxtrack.json, lalu olah dengan awk
grep -E '"id"|"site_name"|"latitude"|"longitude"' gsxtrack.json | \
awk '
# Kalau baris ini mengandung kata "id"
/"id"/ {
    id = $0                        # simpan seluruh baris ke variabel id
    gsub(/.*: "|",?$/, "", id)     # hapus karakter tidak perlu, sisakan nilai id saja
                                   # contoh hasil: node_001
}

# Kalau baris ini mengandung kata "site_name"
/"site_name"/ {
    name = $0                      # simpan seluruh baris ke variabel name
    gsub(/.*: "|",?$/, "", name)   # hapus karakter tidak perlu, sisakan nama lokasi saja
                                   # contoh hasil: Titik Berak Paman Mas Mba
}

# Kalau baris ini mengandung kata "latitude"
/"latitude"/ {
    lat = $0                       # simpan seluruh baris ke variabel lat
    gsub(/.*: |,?$/, "", lat)      # hapus karakter tidak perlu, sisakan angka latitude saja
                                   # contoh hasil: -7.920000
}

# Kalau baris ini mengandung kata "longitude"
/"longitude"/ {
    lon = $0                       # simpan seluruh baris ke variabel lon
    gsub(/.*: |,?$/, "", lon)      # hapus karakter tidak perlu, sisakan angka longitude saja
                                   # contoh hasil: 112.450000

    # Setelah longitude didapat, semua data sudah lengkap
    # langsung cetak dalam format: id,nama,latitude,longitude
    print id","name","lat","lon
}
' > titik-penting.txt             # simpan semua output ke file titik-penting.txt

# Tampilkan pesan bahwa proses selesai
echo "Parsing selesai! Hasil disimpan di titik-penting.txt"

# Tampilkan isi file hasil parsing ke layar
cat titik-penting.txt
