# Panduan Bulk Import CSV StockPro

Panduan ini menjelaskan cara memakai template CSV untuk `Barang Masuk`, `Barang Keluar`, dan `Stok Opname`.

## Aturan Umum

- File harus disimpan dalam format `.csv`
- Baris pertama wajib berisi header kolom template
- Satu `kode_transaksi` atau `kode_sesi` yang sama berarti masuk dalam satu batch yang sama
- Jangan ubah nama header kolom
- Angka jumlah, harga, dan stok harus berupa angka tanpa teks tambahan

## Barang Masuk

Template `Barang Masuk` memakai kolom berikut:

| Kolom | Wajib | Isi |
|---|---|---|
| `kode_transaksi` | Ya | Kode batch, misalnya `IN-2026-10-14-A` |
| `tanggal` | Ya | Format `YYYY-MM-DD` |
| `supplier` | Tidak | Nama supplier / sumber barang |
| `tipe_barang` | Ya | Isi `existing` atau `baru` |
| `nama_barang_existing` | Ya, jika existing | Nama barang yang sudah ada di sistem |
| `nama_barang_baru` | Ya, jika baru | Nama barang baru yang belum ada di sistem |
| `kategori_barang_baru` | Ya, jika baru | Kategori untuk barang baru |
| `satuan_barang_baru` | Ya, jika baru | Satuan untuk barang baru |
| `jumlah` | Ya | Jumlah barang masuk |
| `harga_satuan` | Tidak | Harga satuan |
| `keterangan` | Tidak | Catatan transaksi |

### Contoh Barang Masuk

```csv
kode_transaksi,tanggal,supplier,tipe_barang,nama_barang_existing,nama_barang_baru,kategori_barang_baru,satuan_barang_baru,jumlah,harga_satuan,keterangan
IN-2026-10-14-A,2026-10-14,PT Sumber Jaya,existing,Kertas A4,,,,10,65000,restock gudang
IN-2026-10-14-A,2026-10-14,PT Sumber Jaya,existing,Pulpen Biru,,,,24,3500,restock gudang
IN-2026-10-14-B,2026-10-14,PT Alat Kantor,baru,,Map Arsip,ATK,pcs,50,12000,barang baru
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
| `nama_barang` | Ya | Nama barang yang sudah ada di sistem |
| `jumlah` | Ya | Jumlah barang keluar |
| `keterangan` | Tidak | Catatan transaksi |
| `stok_saat_ini` | Tidak | Kolom bantu dari template, tidak wajib diubah |
| `satuan` | Tidak | Kolom bantu dari template, tidak wajib diubah |

### Contoh Barang Keluar

```csv
kode_transaksi,tanggal,tujuan_penerima,nama_barang,jumlah,keterangan,stok_saat_ini,satuan
OUT-2026-10-14-A,2026-10-14,Produksi,Kertas A4,2,untuk kebutuhan kantor,10,pcs
OUT-2026-10-14-A,2026-10-14,Produksi,Pulpen Biru,5,untuk kebutuhan kantor,24,pcs
```

## Stok Opname

Template `Stok Opname` memakai kolom berikut:

| Kolom | Wajib | Isi |
|---|---|---|
| `kode_sesi` | Ya | Kode sesi opname |
| `tanggal` | Ya | Format `YYYY-MM-DD` |
| `alasan_opname` | Ya | Alasan opname, misalnya `stok opname bulanan` |
| `nama_barang` | Ya | Nama barang yang sudah ada di sistem |
| `stok_sistem` | Tidak | Kolom bantu dari template |
| `stok_fisik` | Ya | Hasil hitung fisik aktual |
| `satuan` | Tidak | Kolom bantu dari template |
| `catatan` | Tidak | Catatan tambahan |

### Contoh Stok Opname

```csv
kode_sesi,tanggal,alasan_opname,nama_barang,stok_sistem,stok_fisik,satuan,catatan
OP-2026-10-14-A,2026-10-14,stok opname bulanan,Kertas A4,8,8,pcs,sesuai
OP-2026-10-14-A,2026-10-14,stok opname bulanan,Pulpen Biru,19,18,pcs,selisih 1
```

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
