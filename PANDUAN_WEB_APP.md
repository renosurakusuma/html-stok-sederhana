# Panduan Web App StockPro

Dokumen ini menjelaskan cara menjalankan paket StockPro sebagai web app lokal di MacBook dan Windows.

## Isi Paket

- `index.html`
- `stockpro_html_offline.html`
- `panduan_bulk_import_csv.md`
- `README.md`
- `start_stockpro_mac.command`
- `start_stockpro_windows.bat`

## Rekomendasi Distribusi

Saat membagikan aplikasi ke user lain, kirim seluruh folder ini dalam satu paket `.zip`.

User cukup:

- extract folder
- jalankan launcher sesuai sistem operasi
- buka aplikasi di browser

## Kapan Pakai `index.html`

Gunakan `index.html` sebagai entry point utama saat aplikasi dijalankan dari server lokal.

## Kapan Pakai `stockpro_html_offline.html`

Gunakan file ini jika ingin membuka aplikasi utama secara langsung atau saat melakukan pengembangan/edit.

## Port Default

Launcher bawaan memakai port:

- `8765`

Jika port sedang dipakai aplikasi lain, ubah nilainya di file launcher.

## Backup Data

Sebelum update file aplikasi:

- lakukan export JSON
- lakukan export CSV backup

Tujuannya agar data lokal tetap aman saat file aplikasi diganti.
