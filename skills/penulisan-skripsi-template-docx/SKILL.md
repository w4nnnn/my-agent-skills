---
name: penulisan-skripsi-template-docx
description: "Use when writing thesis chapters. Builds MD to DOCX."
version: 1.0.0
metadata:
  hermes:
    tags: [skripsi, proposal, thesis, docx-template, markdown, academic, indonesian]
    category: productivity
    related_skills: [docx, pengajuan-judul-skripsi, tata-tulis-ilmiah, grounded-citations]
---

# Penulisan Bab Proposal & Skripsi Berbasis Template DOCX

Workflow untuk menyusun bab proposal atau skripsi secara modular per sub-bab dalam Markdown lalu mengimplementasikannya ke salinan template `.docx` resmi kampus melalui metode insert/replace berbasis kloning XML.

## Procedure

1. **Disambiguasi workspace dan lokasi template.**
   - Gunakan `search_files` dengan pola wildcard untuk menemukan path asli template `.docx` (direktif `@file:` sering terpotong bila nama berkas memuat spasi atau tanda kurung).
   - Periksa seluruh direktori topik/penulis yang sejajar dan konfirmasi sasaran penulis serta ruang lingkup perubahan (hanya bab tertentu vs sekaligus sampul/halaman depan) sebelum mulai menulis.

2. **Audit struktur dan XML template sebelum menyusun draf.**
   - Baca garis besar template memakai `docx_read.py <tpl.docx> --structure` dan `--styles`, lalu inspeksi `word/document.xml`, `word/styles.xml`, dan `word/numbering.xml` untuk memetakan:
     - Batas antar-bab yang memegang `<w:sectPr>` dan `<w:br w:type="page"/>`.
     - Sub-bab yang memakai penomoran otomatis `<w:numPr>` vs penomoran literal.
     - Properti bawaan `docDefaults` (misalnya font default non-Times New Roman) dan `<w:color w:val="FF0000"/>` di `<w:pPr>/<w:rPr>` pada paragraf contoh/instruksi.
   - Bila kampus hanya menyediakan template umum lintas program studi (misalnya berlabel prodi lain), pertahankan kerangka heading wajib dan pembatas seksi template, lalu adaptasikan poin instruksi khusus ke konteks bidang studi sasaran setelah disetujui pengguna.

3. **Verifikasi silang fakta, sitasi, dan dalil sebelum menulis.**
   - Cocokkan nama penulis, tahun terbit, volume, nomor halaman, dan angka metrik langsung terhadap hasil ekstraksi PDF primer (`referensi-markdown/*.md`) — jangan menyalin mentah metadata dari berkas ringkasan atau tugas sebelumnya karena kerap menyimpan kekeliruan penulis/tahun.
   - Untuk kutipan ayat Al-Qur'an atau hadis yang dipersyaratkan template institusi, verifikasi redaksi terjemahan resmi secara verbatim melalui `web_extract` sebelum menyisipkannya ke naskah.
   - Jika template meminta data pra-riset atau observasi lapangan lokal yang belum diukur, pasang penanda eksplisit `[isi data observasi/pra-riset awal ...]` alih-alih mengarang angka statistik.

4. **Susun draf Markdown modular (`1 bab = 1 direktori`, `1 sub-bab berisi = 1 file .md`).**
   - Simpan di `bab-<n>-<slug>/<n>.<m>-<slug>.md` dengan heading tingkat pertama (`# <n>.<m> <Judul>`) di baris awal.
   - Buat file `.md` **hanya untuk sub-bab yang memiliki isi**. Jika sebuah sub-bab induk (misalnya `1.5 Manfaat Penelitian`) hanya menjadi tajuk pembungkus bagi anak sub-bab (`1.5.1`, `1.5.2`), jangan buat file `.md` kosong untuk induknya.
   - Gunakan sudut pandang orang ketiga formal (`penulis` atau `peneliti`) atau kalimat pasif (kecuali di dalam kutipan langsung), selaraskan butir Rumusan Masalah dan Tujuan Penelitian secara berpasangan 1-ke-1, serta pisahkan gaya EYD V secara konsisten: nama diri platform/perangkat lunak tetap tegak, istilah asing umum memakai `*italic*`, dan pengenal teknis/kode memakai `` `backtick` ``.

5. **Implementasikan ke salinan template baru via kloning XML (`insert/replace`).**
   - Muat salinan `Document(template_path)` dan tulis hasil ke berkas `.docx` baru — jangan memanggil `Document()` kosong atau menimpa template asli.
   - Urutkan berkas `.md` dengan kunci tuple numerik (`tuple(int(x) for x in m.group(1).split('.'))`), bukan urutan alfabetis string agar `1.10` tidak mendahului `1.2`.
   - Clone paragraf contoh bawaan template (`copy.deepcopy(sample._p)`): hapus `paraId`/`textId`, hapus seluruh `<w:r>`/`<w:proofErr>`, hapus `<w:color>` di `<w:pPr>/<w:rPr>` agar teks merah instruksi tidak menular, lalu tambahkan `<w:r>` baru dengan `<w:rFonts>` (`Times New Roman` untuk teks, `Consolas` untuk `` `code` ``) dan `<w:sz>/<w:szCs>` eksplisit agar tidak jatuh ke font `docDefaults`.
   - Bersihkan paragraf instruksi merah pada sub-bab induk tanpa isi (seperti `1.5`) saat mengganti rentang dummy antar-anchor `Heading 2`.
   - Untuk daftar bernomor template: pertahankan `<w:numPr>` jika template membedakan `numId` per sub-bab atau me-restart `ilvl=1` di bawah `Heading 2` (`ilvl=0`), dan kupas prefix literal `1. ` dari item Markdown agar nomor tidak ganda; bila template berbagi satu `numId` global lintas bab, kupas `<w:numPr>` dan terapkan tab-stop indentasi gantung eksplisit.
   - Jangan pernah menghapus paragraf yang memuat `<w:sectPr>` atau `<w:br w:type="page"/>` pada batas akhir bab.

6. **Verifikasi paket, XML, dan hasil render visual.**
   - Jalankan uji otomatis untuk memastikan: nol run berwarna merah (`FF0000`), nol sisa teks placeholder contoh template, nol kebocoran karakter Markdown (`**`, `*`, `` ` ``), font eksplisit pada setiap run isi, jumlah `doc.sections` identik dengan template, dan kecocokan seluruh sitasi primer.
   - Periksa garis besar via `docx_read.py <out.docx> --structure`.
   - Bandingkan keluaran JSON `docx_validate.py <out.docx>` terhadap `docx_validate.py <tpl.docx>` untuk memastikan nol isu paket baru (beberapa template kampus sudah membawa false-positive dari `.rels` header/footer).
   - Konversi ke PDF dengan `soffice --headless --convert-to pdf`, render halaman bab ke PNG dengan `pdftoppm -png -r 150`, dan inspeksi visual dengan `vision_analyze` untuk memastikan restart penomoran list, spasi, watermark, nomor halaman header/footer, dan pemisahan halaman bab berikutnya tampil bersih.

## Pitfalls

- **Jangan hanya menghapus run lama tanpa membersihkan `<w:pPr>/<w:rPr>` saat mengkloning paragraf instruksi.** Template kampus kerap menaruh `<w:color w:val="FF0000"/>` di properti paragraf (`pPr/rPr`) sekaligus di tiap run, sehingga run baru tanpa warna eksplisit akan tetap tampil merah.
- **Selalu pasang `<w:rFonts>` dan `<w:sz>` pada setiap `<w:r>` hasil kloning.** Mengandalkan style `Normal` yang mewarisi `docDefaults` dapat menjatuhkan font paragraf sisipan ke font default template (misalnya `Univers`) alih-alih `Times New Roman` 12pt.
- **Jangan langsung menganggap hasil `"ok": false` dari `docx_validate.py` sebagai kerusakan kode baru.** Bandingkan laporan isu dengan template asli lebih dulu; skrip validator yang mengindeks `.rels` per folder bisa tertimpa oleh `header*.xml.rels` pada template ber-header majemuk dan memicu galat semu `unresolved-reference` pada `document.xml`.
- **Hapus rentang paragraf dummy dalam urutan indeks terbalik (*reverse order*) atau tangkap elemen anchor sebelum mutasi.** Menghapus elemen dari atas menggeser seluruh indeks `doc.paragraphs` di bawahnya dan berisiko menyasar paragraf `Heading 2` atau `<w:sectPr>` berikutnya.
- **Verifikasi restart penomoran list lewat render PDF LibreOffice, bukan hanya inspeksi XML.** Perilaku restart `ilvl=1` di bawah `Heading 2` (`ilvl=0`) dan pemutusan halaman antar-seksi baru tampak nyata pada halaman hasil render visual.
