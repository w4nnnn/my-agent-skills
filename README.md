# Academic Agent Skills Collection

Kumpulan **Skill Kustom (Custom Agent Skills)** berstandar akademik untuk ekosistem **Google Antigravity (GUI & CLI)**, Claude Code, dan AI Coding Agents.

Repositori ini berisi serangkaian prosedur kerja (*runbooks*), panduan tipografi akademik, tata kelola dokumen formal, dan konversi format otomatis untuk mahasiswa dan akademisi.

---

## 📚 Daftar Skill Akademik

| Nama Skill | Versi | Fokus & Kegunaan |
| :--- | :---: | :--- |
| **[`penulisan-tugas`](skills/penulisan-tugas/)** | `3.2.0` | Standar penulisan resume materi dan tugas perkuliahan formal (Markdown, DOCX, & PDF). Menggunakan tabel identitas Mode A (tanpa cover), integrasi **Mermaid diagram horizontal** dengan preservasi rasio aspek (*anti-gepeng*), dan daftar pustaka opsional. |
| **[`penulisan-tugas-tulis-tangan`](skills/penulisan-tugas-tulis-tangan/)** | `1.1.0` | Panduan tata letak tugas kuliah gaya tulisan tangan pada kertas folio bergaris (margin, nomor halaman, dan struktur bab). |
| **[`penulisan-skripsi-template-docx`](skills/penulisan-skripsi-template-docx/)** | `1.0.0` | Template dan aturan penulisan bab proposal & skripsi berstandar ilmiah berbasis template `.docx` (Bab I s.d. Bab V). |
| **[`laporan-kerja-praktek-unusida`](skills/laporan-kerja-praktek-unusida/)** | `1.0.0` | Panduan penyusunan naskah Laporan Kerja Praktek (KP) / Magang sesuai standar resmi UNUSIDA. |

---

## 🚀 Cara Instalasi

### 1. Kloning Repositori
```bash
git clone git@github.com:w4nnnn/my-agent-skills.git
cd my-agent-skills
```

### 2. Jalankan Skrip Pemasangan Otomatis
```bash
chmod +x install.sh
./install.sh
```

Skrip akan menautkan (*symlink*) seluruh folder skill ke:
* `~/.gemini/config/skills/` (Discovery Global Antigravity GUI & CLI)
* `~/.agents/skills/` (Discovery User Local)

---

## 🛠️ Contoh Pemanggilan pada AI Agent

Anda cukup meminta agen di chat Antigravity:
```text
"Tolong buatkan resume materi dari slide ini untuk tugas kuliah bimbingan konseling menggunakan skill penulisan-tugas"
```
Agen secara otomatis akan memuat instruksi dari `skills/penulisan-tugas/SKILL.md` dan mematuhi seluruh kaidah tipografi, diagram Mermaid proporsional, serta konversi dokumen DOCX/PDF.

---

## 📄 Lisensi
MIT License © [w4nnnn](https://github.com/w4nnnn)
