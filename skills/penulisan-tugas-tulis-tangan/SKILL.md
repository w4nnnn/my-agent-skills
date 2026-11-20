---
name: penulisan-tugas-tulis-tangan
description: "Use when creating handwritten folio assignments."
version: 1.1.0
author: Nous Research
license: MIT
metadata:
  hermes:
    tags: [academic, handwritten, folio, assignment, pdf, unusida, kuliah]
    category: productivity
---

# Penulisan Tugas Tulisan Tangan (Kertas Folio Bergaris)

Panduan pembuatan lembar tugas kuliah dengan format tulisan tangan di atas kertas folio bergaris (*double folio / loose-leaf*), menghasilkan berkas PDF dan gambar resolusi tinggi yang otentik, realistis, dan rapi sesuai instruksi dosen.

---

## When to Use
- Gunakan saat pengguna meminta pengerjaan tugas kuliah/sekolah berformat **tulisan tangan** atau di atas lembar **kertas folio bergaris** (*ruled paper / loose-leaf*).
- Gunakan saat diminta hasil tugas dengan gaya tulisan tangan yang santai, cepat, atau "sedikit jelek / cakar ayam khas mahasiswa" yang tetap terbaca.
- Gunakan untuk menghasilkan simulasi lembar folio digital (PDF & PNG) serta teks draf ringkas yang siap disalin manual dengan pulpen.
- Untuk naskah ketikan formal akademis (DOCX & PDF dengan Times New Roman, running header/footer, dan tabel standar), gunakan skill `penulisan-tugas`.

---

## 1. Format Fisik & Media Kertas Folio

### a. Dimensi Kertas Standar Indonesia
- **Ukuran Utama (Folio / F4):** `215 mm x 330 mm` (`609.45 pt x 935.43 pt`). Kertas folio ganda bergaris (SiDU, Kiky) menggunakan standar ini.
- **Ukuran Alternatif (A4):** `210 mm x 297 mm` (`595.3 pt x 841.9 pt`) jika portal e-learning kampus membatasi rasio halaman A4.

### b. Warna & Anatomi Garis Folio
- **Warna Latar Kertas:** Bukan putih murni digital (`#FFFFFF`), melainkan putih gading / krem lembut hangat (`#F8F6EF` atau `#FBF9F2`).
- **Garis Kepala (Header Bar):** Dua garis horizontal ganda di bagian atas (jarak 3 pt, warna `#9AB3CE`, tebal 0.7 pt).
- **Garis Baris Horizontal (Ruled Lines):** Garis biru keabu-abuan halus (`#9AB3CE` atau `#C2D5E8`, tebal 0.55 pt) dengan jarak baris standar folio Indonesia yaitu **8.5 mm** (`~24.0 pt s.d. 24.2 pt`).
- **Garis Margin Vertikal (Kiri):** Garis merah muda lembut (`#E58C8C`, tebal 0.75 pt) di posisi `x = 75 pt` (~2.6 cm dari tepi kiri).
- **Lubang Binder (Perforasi):** 2–3 lingkaran halus di tepi kiri luar margin merah (`x = 22 pt`, arsiran warna `#E2DFD2` bergaris `#D0CDBF`) untuk merepresentasikan lembar *loose-leaf* fisik.

---

## 2. Struktur Konten Super Sederhana

Untuk tugas ujian atau lembar jawaban berformat folio:
1. **Header Ringkas Pojok Kiri Atas:**
   - Ditempatkan tepat di sebelah kanan garis margin merah di baris paling atas:
     ```text
     Nama : [Nama Lengkap Mahasiswa]
     NIM  : [Nomor Induk Mahasiswa]
     ```
   - Hindari tabel identitas kaku, kop dokumen berlebihan, atau atribut administratif panjang jika mahasiswa meminta format sederhana.
2. **Nomor Langsung Jawaban:**
   - Nomor soal (1, 2, 3, ...) langsung diikuti poin inti jawaban tanpa menuliskan ulang soal yang panjang.
   - Poin jawaban harus **sangat singkat, padat, dan analitis**.
   - Berikan satu baris kosong antar-nomor soal untuk memberi jeda visual yang nyaman dibaca (*breathing room*).
3. **Proporsi Satu Halaman Tuntas:**
   - Pastikan seluruh jawaban nomor 1 s.d. selesai termuat tuntas dalam **1 halaman lembar folio** (maksimal 30–33 baris teks), sehingga tidak menyisakan halaman kedua yang menggantung.

---

## 3. Tipografi Tulisan Tangan & Karakter "Cakar Ayam Realistis"

### a. Pilihan Font Sesuai Karakter Mahasiswa
Hindari font kaligrafi atau font yang terlalu estetik/feminin jika diminta tulisan tangan pria/mahasiswa umum:
- **`ReenieBeanie` (Pilihan Utama untuk Ceker/Cakar Ayam & Fast Scribble):**
  - Goresan pena ramping (*fine tip* 0.3–0.5 mm), karakter jangkung, acak, miring bebas, meniru catatan cepat saat kuliah mengejar waktu namun tetap sangat terbaca (*legible*).
  - **Catatan Ukuran:** Wajib gunakan ukuran **14.0–15.0 pt** (karena glif ramping dan ascender tinggi).
- **`NothingYouCouldDo` (Semi-Sambung Miring Cepat):**
  - Miring ke kanan (*slanted*), semi-sambung cepat, ada percampuran spontan huruf besar di tengah kata (seperti huruf K). Ukuran ideal: **10.5–11.0 pt**.
- **`PatrickHand` (Tulisan Tangan Cetak Tegak & Rapi):**
  - Cetak tegak, membulat, bersahabat, sangat rapi khas mahasiswa tertib. Ukuran ideal: **11.0–12.0 pt**.
- **`CoveredByYourGrace`:**
  - Cetak jangkung, goresan tebal, santai. Ukuran ideal: **12.0–13.0 pt**.

### b. Warna Tinta Pena Autentik
- **Biru Pulpen Standar (*Navy/Royal Blue*):** `#0D2B52`, `#0B2648`, atau `#113665` (meniru tinta *ballpoint* Faster/Standard/Snowman).
- **Hitam Pulpen Gel:** `#1A1C1E` atau `#1E2024` (meniru tinta gel Sarasa/Pilot G-2/Standard Gel).

### c. Variasi Alami (*Micro-Jitter Baseline*)
Komputer mencetak teks pada garis horizontal yang lurus 100% secara kaku. Untuk menciptakan ilusi tulisan tangan manusia alami:
- Tambahkan pergeseran mikro acak pada sumbu Y: `jitter_y = random.uniform(-0.5, 0.7)` pt.
- Tambahkan pergeseran mikro acak pada sumbu X: `jitter_x = random.uniform(-0.4, 0.5)` pt.
- Posisi dasar tulisan (*baseline*) diletakkan sekitar **3.5–4.0 pt di atas garis horizontal folio**.

### d. Variasi Multi-Mahasiswa (Tugas Teman / Rekan / Kelompok)
Jika diminta membuatkan tugas untuk lebih dari satu mahasiswa (misal tugas berpasangan atau teman sekelas):
1. **Wajib Beda Font:** Contoh Mahasiswa A memakai `NothingYouCouldDo` atau `PatrickHand`, sedangkan Mahasiswa B memakai `ReenieBeanie`.
2. **Wajib Beda Tinta:** Pasangkan satu lembar bertinta biru *ballpoint* (`#0D2B52`) dan lembar lainnya bertinta hitam gel (`#1A1C1E`).
3. **Wajib Beda Struktur & Parafrase Total:** Bedakan gaya penomoran (bullet point vs angka 1-2-3-4), ubah konstruksi kalimat, dan variasikan sudut pandang penjelasan agar kedua tugas terlihat orisinal hasil kerja mandiri tanpa terkesan saling mencontek.

---

## 4. Alur Kerja Implementasi Teknis (ReportLab + PDF + PNG)

1. **Unduh Font TrueType (jika belum ada):**
   ```bash
   # ReenieBeanie (Cakar ayam ramping)
   curl -sL -o /tmp/ReenieBeanie.ttf "https://raw.githubusercontent.com/google/fonts/main/ofl/reeniebeanie/ReenieBeanie.ttf"
   # NothingYouCouldDo (Miring semi-sambung)
   curl -sL -o /tmp/NothingYouCouldDo.ttf "https://raw.githubusercontent.com/google/fonts/main/ofl/nothingyoucoulddo/NothingYouCouldDo.ttf"
   # PatrickHand (Cetak tegak rapi)
   curl -sL -o /tmp/PatrickHand.ttf "https://raw.githubusercontent.com/google/fonts/main/ofl/patrickhand/PatrickHand-Regular.ttf"
   ```
2. **Generasi PDF via ReportLab:**
   ```python
   import random, sys, glob, os
   from reportlab.pdfgen import canvas
   from reportlab.pdfbase import pdfmetrics
   from reportlab.pdfbase.ttfonts import TTFont
   from reportlab.lib.colors import HexColor

   # Daftarkan font
   pdfmetrics.registerFont(TTFont('ReenieBeanie', '/tmp/ReenieBeanie.ttf'))

   # Dimensi F4: 215mm x 330mm (609.45 pt x 935.43 pt)
   PAGE_WIDTH, PAGE_HEIGHT = 215 * 72 / 25.4, 330 * 72 / 25.4
   c = canvas.Canvas("dokumen.pdf", pagesize=(PAGE_WIDTH, PAGE_HEIGHT))

   # Render kata per kata dengan micro-jitter agar alami
   for w in text.split(" "):
       jx = random.uniform(-0.35, 0.45)
       jy = random.uniform(-0.55, 0.65)
       c.drawString(cur_x + jx, y_base + 3.8 + jy, w)
       cur_x += pdfmetrics.stringWidth(w, font_name, size) + space_w
   ```
3. **Konversi ke Gambar PNG Resolusi Tinggi:**
   ```bash
   pdftoppm -png -r 150 dokumen.pdf dokumen_folio
   ```
4. **Verifikasi Visual:**
   - Gunakan `vision_analyze` pada gambar PNG untuk memeriksa ketepatan teks pada garis folio, keseimbangan halaman, dan keterbacaan tulisan tangan.
5. **Dual-Delivery (Wajib):**
   - Berikan berkas PDF & PNG lembar folio tulisan tangan.
   - Sertakan pula draf teks polos/Markdown super ringkas di pesan obrolan agar mahasiswa yang ingin menyalin manual dengan pulpen fisik ke lembar folio asli dapat melakukannya dengan cepat.
