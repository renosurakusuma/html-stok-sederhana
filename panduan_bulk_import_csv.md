# Panduan Bulk Import CSV StockPro

Panduan ini menjelaskan cara memakai template CSV untuk `Barang Masuk`, `Barang Keluar`, dan `Stok Opname`.

## Aturan Umum

- File harus disimpan dalam format `.csv`
- Baris pertama wajib berisi header kolom template
- Satu `kode_transaksi` atau `kode_sesi` yang sama berarti masuk dalam satu batch yang sama
- Jangan ubah nama header kolom
- Angka jumlah, harga, dan stok harus berupa angka tanpa teks tambahan
- Tanggal boleh `YYYY-MM-DD` (contoh `2026-12-31`) atau `DD/MM/YYYY` (contoh `31/12/2026`)
- CSV dengan pemisah titik koma (`;`) dari Excel berbahasa Indonesia juga diterima
- Kolom `kode_barang` dipakai lebih dulu untuk mencari barang; jika kosong, dicari lewat nama barang
- Kolom `lot` dan `tanggal_kedaluwarsa` boleh dikosongkan untuk barang yang tidak memakai lot

## Barang Masuk

Template `Barang Masuk` memakai kolom berikut:

| Kolom | Wajib | Isi |
|---|---|---|
| `kode_transaksi` | Ya | Kode batch, misalnya `IN-2026-10-14-A` |
| `tanggal` | Ya | Format `YYYY-MM-DD` |
| `supplier` | Tidak | Nama supplier / sumber barang |
| `tipe_barang` | Ya | Isi `existing` atau `baru` |
| `kode_barang` | Tidak | Kode barang. Untuk barang lama dipakai untuk mencari barang; untuk barang baru disimpan sebagai kodenya |
| `nama_barang_existing` | Ya, jika existing (atau isi `kode_barang`) | Nama barang yang sudah ada di sistem |
| `nama_barang_baru` | Ya, jika baru | Nama barang baru yang belum ada di sistem |
| `kategori_barang_baru` | Ya, jika baru | Kategori untuk barang baru |
| `satuan_barang_baru` | Ya, jika baru | Satuan untuk barang baru |
| `merek_barang_baru` | Tidak | Merek untuk barang baru |
| `izin_edar_barang_baru` | Tidak | Nomor izin edar (AKL/AKD/PKRT) untuk barang baru |
| `lot` | Tidak | Nomor lot / batch |
| `tanggal_kedaluwarsa` | Tidak | Tanggal kedaluwarsa lot (ED) |
| `jumlah` | Ya | Jumlah barang masuk |
| `harga_satuan` | Tidak | Harga satuan |
| `keterangan` | Tidak | Catatan transaksi |

### Contoh Barang Masuk

```csv
kode_transaksi,tanggal,supplier,tipe_barang,kode_barang,nama_barang_existing,nama_barang_baru,kategori_barang_baru,satuan_barang_baru,merek_barang_baru,izin_edar_barang_baru,lot,tanggal_kedaluwarsa,jumlah,harga_satuan,keterangan
IN-2026-10-14-A,2026-10-14,PT Sumber Jaya,existing,SGN-M,Sarung Tangan Nitril M,,,,,,LT2410A,2027-09-30,20,75000,restock gudang
IN-2026-10-14-A,2026-10-14,PT Sumber Jaya,existing,,Masker Medis 3 Ply,,,,,,,,10,35000,restock gudang
IN-2026-10-14-B,2026-10-14,PT Lab Supply,baru,REA-GLU,,Reagen Glukosa,Reagen,box,MerkX,AKD 20101234567,R2410,31/03/2027,5,450000,barang baru
```

### Cara Isi Barang Baru

- Isi `tipe_barang` dengan `baru`
- Kosongkan `nama_barang_existing`
- Isi `nama_barang_baru`
- Isi `kategori_barang_baru`
- Isi `satuan_barang_baru`
- Isi `jumlah`

## Barang Keluar

Template `Barang Keluar` memakai kolom berikut:

| Kolom | Wajib | Isi |
|---|---|---|
| `kode_transaksi` | Ya | Kode batch transaksi keluar |
| `tanggal` | Ya | Format `YYYY-MM-DD` |
| `tujuan_penerima` | Tidak | Nama divisi / orang / tujuan |
| `kode_barang` | Tidak | Kode barang (diutamakan untuk mencari barang) |
| `nama_barang` | Ya, jika `kode_barang` kosong | Nama barang yang sudah ada di sistem |
| `lot` | Tidak | Kosongkan agar sistem memilih lot otomatis (ED terdekat dulu, lot expired dilewati). Isi nomor lot untuk mengambil lot tertentu, atau `tanpa lot` untuk stok tanpa lot |
| `jumlah` | Ya | Jumlah barang keluar |
| `keterangan` | Tidak | Catatan transaksi |
| `stok_saat_ini` | Tidak | Kolom bantu dari template, tidak wajib diubah |
| `satuan` | Tidak | Kolom bantu dari template, tidak wajib diubah |

### Contoh Barang Keluar

```csv
kode_transaksi,tanggal,tujuan_penerima,kode_barang,nama_barang,lot,jumlah,keterangan,stok_saat_ini,satuan
OUT-2026-10-14-A,2026-10-14,RS Sehat Sentosa,SGN-M,Sarung Tangan Nitril M,,5,PO-123,20,box
OUT-2026-10-14-A,2026-10-14,RS Sehat Sentosa,REA-GLU,Reagen Glukosa,R2410,2,PO-123,5,box
```

## Stok Opname

Template `Stok Opname` memakai kolom berikut:

| Kolom | Wajib | Isi |
|---|---|---|
| `kode_sesi` | Ya | Kode sesi opname |
| `tanggal` | Ya | Format `YYYY-MM-DD` |
| `alasan_opname` | Ya | Alasan opname, misalnya `stok opname bulanan` |
| `kode_barang` | Tidak | Kode barang (diutamakan untuk mencari barang) |
| `nama_barang` | Ya, jika `kode_barang` kosong | Nama barang yang sudah ada di sistem |
| `lot` | Tidak | Kosongkan untuk opname total barang. Isi nomor lot untuk opname per lot, atau `(tanpa lot)` untuk stok tanpa lot. Lot yang belum tercatat akan dibuat baru |
| `tanggal_kedaluwarsa` | Tidak | Diisi jika lot baru ditemukan saat opname |
| `stok_sistem` | Tidak | Kolom bantu dari template |
| `stok_fisik` | Ya | Hasil hitung fisik aktual |
| `satuan` | Tidak | Kolom bantu dari template |
| `catatan` | Tidak | Catatan tambahan |

### Contoh Stok Opname

```csv
kode_sesi,tanggal,alasan_opname,kode_barang,nama_barang,lot,tanggal_kedaluwarsa,stok_sistem,stok_fisik,satuan,catatan
OP-2026-10-14-A,2026-10-14,stok opname bulanan,SGN-M,Sarung Tangan Nitril M,LT2410A,2027-09-30,15,15,box,sesuai
OP-2026-10-14-A,2026-10-14,stok opname bulanan,REA-GLU,Reagen Glukosa,R2410,2027-03-31,3,2,box,selisih 1
```

Template opname yang diunduh dari aplikasi sudah berisi satu baris per lot, lengkap dengan stok sistem per lot.

Dalam satu sesi, satu barang diopname **per lot** atau **total barang**, jangan dicampur.

## Tips Pakai

- Download template langsung dari halaman yang sesuai di aplikasi
- Isi file di Excel atau Google Sheets
- Saat selesai, simpan kembali sebagai `CSV`
- Import dari halaman yang sama agar prosesnya sesuai jenis transaksi
- Jika ada error saat import, cek lagi nama barang, jumlah, dan kolom wajib

## Rekomendasi

- Pakai satu `kode_transaksi` untuk beberapa baris yang memang satu dokumen
- Pakai satu `kode_sesi` untuk beberapa baris yang memang satu sesi opname
- Jangan campur barang baru dan barang lama tanpa mengisi `tipe_barang` dengan benar pada template barang masuk
