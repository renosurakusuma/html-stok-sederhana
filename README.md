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

- Barang masuk multi-produk
- Barang keluar multi-produk
- Stok opname multi-produk
- Ringkasan stok dan audit trail
- Export/import JSON
- Export/import CSV backup
- Bulk import CSV operasional

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
