# My Agent Skills Collection

Kumpulan **Skill Kustom (Custom Agent Skills)** untuk ekosistem **Google Antigravity (GUI & CLI)**, Claude Code, dan AI Coding Agents.

Repositori ini menyediakan serangkaian prosedur kerja (*runbooks*), panduan penulisan akademik, manipulasi dokumen, dan integrasi otomatisasi yang dapat dipanggil langsung oleh agen AI selama sesi kerja berlangsung.

---

## 📚 Daftar Skill Unggulan

| Nama Skill | Versi | Sumber / Pembuat | Deskripsi |
| :--- | :---: | :---: | :--- |
| **[`penulisan-tugas`](skills/penulisan-tugas/)** | `3.2.0` | [@w4nnnn](https://github.com/w4nnnn) | Standar penulisan tugas perkuliahan formal (Markdown, DOCX & PDF), tabel identitas Mode A (tanpa cover), integrasi **Mermaid diagram horizontal** dengan preservasi rasio aspek (*anti-gepeng*), dan daftar pustaka opsional. |
| **[`docx`](skills/docx/)** | `1.0.0` | [Anthropic](https://github.com/anthropics/skills) | Pembuatan, penyuntingan, dan bedah file Microsoft Word (`.docx`) menggunakan pustaka `docx-js` dan konversi headless LibreOffice. |
| **[`pdf`](skills/pdf/)** | `1.0.0` | [Anthropic](https://github.com/anthropics/skills) | Operasi pemrosesan PDF (baca, gabung/split, ekstraksi gambar, dan OCR). |
| **[`pptx`](skills/pptx/)** | `1.0.0` | [Anthropic](https://github.com/anthropics/skills) | Pembuatan dan manipulasi presentasi PowerPoint (`.pptx`). |
| **[`xlsx`](skills/xlsx/)** | `1.0.0` | [Anthropic](https://github.com/anthropics/skills) | Manipulasi dan analisis spreadsheet Excel (`.xlsx`). |
| **[`penulisan-tugas-tulis-tangan`](skills/penulisan-tugas-tulis-tangan/)** | `1.0.0` | [@w4nnnn](https://github.com/w4nnnn) | Panduan tata letak tugas kuliah gaya tulisan tangan pada kertas folio bergaris. |
| **[`penulisan-skripsi-template-docx`](skills/penulisan-skripsi-template-docx/)** | `1.0.0` | [@w4nnnn](https://github.com/w4nnnn) | Template dan aturan penulisan tugas akhir/skripsi berstandar akademik. |
| **[`laporan-kerja-praktek-unusida`](skills/laporan-kerja-praktek-unusida/)** | `1.0.0` | [@w4nnnn](https://github.com/w4nnnn) | Panduan penyusunan naskah Laporan Kerja Praktek khusus UNUSIDA. |

---

## 🚀 Cara Instalasi

### 1. Kloning Repositori
```bash
git clone git@github.com:w4nnnn/my-agent-skills.git
cd my-agent-skills
```

### 2. Jalankan Script Pemasangan Otomatis
```bash
chmod +x install.sh
./install.sh
```

Script akan menautkan (*symlink*) seluruh folder skill ke:
* `~/.gemini/config/skills/` (Discovery Global Antigravity GUI & CLI)
* `~/.agents/skills/` (Discovery User Local)

---

## 🛠️ Contoh Pemanggilan pada AI Agent

Anda cukup meminta agen di chat Antigravity:
```text
"Tolong buatkan resume materi dari slide ini untuk tugas kuliah menggunakan skill penulisan-tugas"
```
Agen secara otomatis akan memuat instruksi dari `skills/penulisan-tugas/SKILL.md` dan mematuhi seluruh kaidah tipografi, diagram Mermaid proporsional, serta konversi dokumen DOCX/PDF.

---

## 🙏 Atribusi & Kredit (Attributions)

Repositori ini menyatukan skill kustom pribadi serta beberapa skill utilitas dokumen resmi:
- **Dokumen Skills (`docx`, `pdf`, `pptx`, `xlsx`)**: Bersumber dari repositori resmi **[anthropics/skills](https://github.com/anthropics/skills)** oleh Anthropic, PBC. Ketentuan lisensi dan hak cipta bawaan tetap berlaku pada masing-masing folder skill (lihat `LICENSE.txt` di direktori terkait).
- **Skill Kustom Akademik & Desain (`penulisan-tugas`, `penulisan-skripsi-template-docx`, `laporan-kerja-praktek-unusida`, dll.)**: Dibuat dan dikembangkan secara independen oleh [@w4nnnn](https://github.com/w4nnnn).

---

## 📄 Lisensi
Repositori ini dilisensikan di bawah MIT License untuk kode dan konfigurasi yang dikembangkan oleh kontributor, dengan tetap menghormati lisensi upstream dari Anthropic untuk bundel `docx`, `pdf`, `pptx`, dan `xlsx`.
