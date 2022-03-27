Judul TA : Modeling Healthcare Indicators Using Classification and Regression Trees
Kelompok : TA-2020/2021-3
Nama	 : Januard Lumbangaol
NIM	 : 11S17064


##Prototipe
Folder ini berisi project prototipe yang digunakan untuk menjalankan model prediksi lama tinggal dan menghitung total biaya
berdasarkan data prediksi lama hari dengan memanfaatkan microframeworok flask


## Struktur Project
Project ini terdiri dari empat struktur besar
1. model.py - berisi kode program untuk model prediksi lama tinggal pasien.
2. app.py - berisi Flask API yang menerima detail data melalui panggilan GUI atau API, menghitung nilai yang diprediksi berdasarkan model dan menampilkannya.
	    serta tampilan prototipe yang digunakan untuk menghitung total biaya.
3. request.py - modul permintaan untuk memanggil API yang sudah ditentukan di app.py dan menampilkan nilai didapat.
4. templates - berisi template HTML untuk memungkinkan pengguna memasukkan data pasien dan menampilkan prediksi lama tinggal dan total biaya.

## Data
1. Data rekam medis pada file "AnalysisdatasetPemeriksaanFisikPasien.csv" untuk prediksi lama tinggal pasien.
2. Database "datarumahsakit.sql" berisi data biaya obat sesuai diagnosis dan biaya sesuai rungan pada Rumah Sakit XYZ untuk menghitung estimasi total biaya.

## Menjalankan Project
1. Memastikan berada pada home directory project dan menjalankan model prediksi lama tinggal dengan perintah :
```
python model.py
```
Hal tersebut akan membuat versi serial dari model  menjadi file model.pkl


2. Menjalankan Flask API
```
python app.py
```
flask akan berjalan pada port 5000 secara default.

3. Buka URL http://localhost:5000


## Langkah Menggunakan Prototipe
1. Memasukkan data pemeriksaan fisik pasien pada form data pasien.
2. Menekan tombol Prediksi untuk mendapatkan prediksi lama tinggal berdasarkan data yang sudah didapat.
3. Prediksi lama tinggal akan tampil pada side sebelah kanan.
4. Masukkan diagnosis pasien untuk mengetahui biaya obat.
5. Pilih ruangan rawat inap yang diinginkan.
6. Tekan tombol Hitung untuk mendapatkan estimasi total biaya berdasarkan lama tinggal, biaya obat, dan ruangan rawat inap.