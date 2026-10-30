# StockPro Web App

StockPro adalah aplikasi stok berbasis web yang bisa dipakai di browser pada MacBook dan Windows tanpa proses instalasi yang rumit.

## File Utama

- `index.html`: pintu masuk utama web app
- `stockpro_html_offline.html`: file aplikasi utama
- `panduan_bulk_import_csv.md`: panduan bulk import CSV
- `start_stockpro_mac.command`: launcher untuk macOS
- `start_stockpro_windows.bat`: launcher untuk Windows

## Cara Paling Mudah

### MacBook

1. Buka folder aplikasi.
2. Jalankan `start_stockpro_mac.command`.
3. Browser akan membuka `http://127.0.0.1:8765/`.
4. Biarkan terminal tetap terbuka selama aplikasi dipakai.

Catatan:
- Jika file `.command` belum bisa dijalankan, buka Terminal lalu jalankan:

```bash
chmod +x start_stockpro_mac.command
./start_stockpro_mac.command
```

### Windows

1. Buka folder aplikasi.
2. Jalankan `start_stockpro_windows.bat`.
3. Browser akan membuka `http://127.0.0.1:8765/`.
4. Biarkan jendela terminal tetap terbuka selama aplikasi dipakai.

## Alternatif Tanpa Script

Jika Python sudah terinstall, kamu juga bisa menjalankan server lokal manual:

```bash
python3 -m http.server 8765
```

atau di Windows:

```bat
py -3 -m http.server 8765
```

Lalu buka:

- `http://127.0.0.1:8765/`

## Fitur Utama

- Barang masuk, barang keluar, dan stok opname multi-produk
- **Lot / Batch & tanggal kedaluwarsa (ED)** per barang
  - Barang keluar otomatis mengambil lot dengan ED terdekat (FEFO); lot yang sudah expired dilewati
  - Lot bisa dipilih manual (misalnya untuk retur atau pemusnahan barang expired)
  - Stok opname bisa per lot atau total barang
- **Peringatan kedaluwarsa** di Dashboard (batas hari bisa diatur) + export Excel
- **Kode barang, merek, dan nomor izin edar (AKL/AKD)** di data barang
- **Kartu stok** per barang / per lot dengan saldo berjalan, filter periode, cetak A4, dan export Excel (.xlsx)
- **Pengingat backup** jika data belum di-backup dalam beberapa hari (bisa diatur)
- Ringkasan stok dan audit trail
- Export/import JSON dan CSV backup
- Bulk import CSV operasional (mendukung CSV pemisah titik koma dari Excel Indonesia)

## Kompatibilitas Data Lama

Data dari versi sebelumnya tetap terbaca tanpa perlu migrasi. Stok lama yang belum punya
nomor lot dianggap sebagai stok **tanpa lot** dan tetap bisa dikeluarkan seperti biasa.
Lot baru mulai tercatat sejak barang masuk berikutnya diinput dengan nomor lot.

## Penting: Data Tersimpan di Browser

StockPro menyimpan data di browser (localStorage). Data **tidak** otomatis tersinkron antar
komputer atau antar browser, dan bisa hilang jika cache/data situs dihapus. Lakukan
**Export JSON** secara rutin; aplikasi akan mengingatkan jika backup sudah lama.

Catatan: membuka file HTML langsung (`file://`) dan lewat server lokal (`http://127.0.0.1:8765`)
dihitung sebagai dua tempat penyimpanan berbeda. Pilih salah satu cara dan gunakan secara konsisten.

## Bulk Import CSV

Bulk import tersedia langsung di halaman:

- `Barang Masuk`
- `Barang Keluar`
- `Stok Opname`

Untuk panduannya, buka:

- `panduan_bulk_import_csv.md`

## Rekomendasi Pemakaian

- Pakai via server lokal agar lebih stabil dibanding buka file HTML langsung.
- Simpan backup JSON/CSV secara berkala.
- Gunakan browser modern seperti Chrome, Edge, atau Safari.
