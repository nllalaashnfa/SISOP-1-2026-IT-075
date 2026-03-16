#!/usr/bin/awk -f

BEGIN {
    FS = ","
    option = ARGV[2]
    delete ARGV[2]
}

NR == 1 { next }

{
    # Kolom: $1=Nama, $2=Usia, $3=Kursi Kelas, $4=Gerbong
    count_passenger++
    carriages[$4] = 1

    if ($2 > max_age) {
        max_age = $2
        oldest_name = $1
    }

    total_age += $2

    if ($3 == "Business") {
        business++
    }
}

END {
    if (option == "a") {
        print "Jumlah seluruh penumpang KANJ adalah " count_passenger " orang"
    }
    else if (option == "b") {
        for (c in carriages) total_carriage++
        print "Jumlah gerbong penumpang KANJ adalah " total_carriage
    }
    else if (option == "c") {
        print oldest_name " adalah penumpang kereta tertua dengan usia " max_age " tahun"
    }
    else if (option == "d") {
        avg = int(total_age / count_passenger)
        print "Rata-rata usia penumpang adalah " avg " tahun"
    }
    else if (option == "e") {
        print "Jumlah penumpang business class ada " business " orang"
    }
    else {
        print "Soal tidak dikenali. Gunakan a, b, c, d, atau e."
        print "Contoh penggunaan: awk -f file.sh data.csv a"
    }
}
