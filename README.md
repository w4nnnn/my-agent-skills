# Academic Agent Skills Collection

Kumpulan **Skill Kustom (Custom Agent Skills)** berstandar akademik untuk semua AI Agent modern (**Google Antigravity**, **Claude Code**, **Cursor**, **Windsurf**, **Roo Code**, **Cline**, dan agen AI lainnya).

Repositori ini memuat panduan penulisan akademik (*runbooks*), standar tipografi, integrasi diagram Mermaid proporsional (*anti-gepeng*), serta otomasi konversi dokumen Word (`.docx`) dan PDF.

---

## 📚 Daftar Skill Akademik

| Nama Skill | Versi | Fokus & Kegunaan |
| :--- | :---: | :--- |
| **[`penulisan-tugas`](skills/penulisan-tugas/)** | `3.2.0` | Standar penulisan resume materi dan tugas perkuliahan formal (Markdown, DOCX, & PDF). Menggunakan tabel identitas Mode A (tanpa cover), integrasi **Mermaid diagram horizontal** dengan rasio aspek terjaga (*anti-gepeng*), dan daftar pustaka opsional. |
| **[`penulisan-tugas-tulis-tangan`](skills/penulisan-tugas-tulis-tangan/)** | `1.1.0` | Panduan tata letak tugas kuliah gaya tulisan tangan pada kertas folio bergaris (margin, penomoran, dan format bab). |
| **[`penulisan-skripsi-template-docx`](skills/penulisan-skripsi-template-docx/)** | `1.0.0` | Template dan aturan penulisan bab proposal & skripsi berstandar ilmiah berbasis template `.docx` (Bab I s.d. Bab V). |
| **[`laporan-kerja-praktek-unusida`](skills/laporan-kerja-praktek-unusida/)** | `1.0.0` | Panduan penyusunan naskah Laporan Kerja Praktek (KP) / Magang sesuai standar resmi UNUSIDA. |

---

## 🤖 Prompt untuk AI Agent (Langsung Pakai)

Anda dapat langsung menyalin prompt di bawah ini ke dalam chat AI Agent Anda (Antigravity, Claude Code, Cursor, dll.) agar agen mengunduh dan memasang skill ini secara otomatis:

### 1. Prompt Pemasangan Otomatis (Auto-Install)
```text
Tolong pasang kumpulan skill akademik dari repositori https://github.com/w4nnnn/my-agent-skills.
Kloning repositori tersebut, lalu ekstrak dan pindahkan seluruh isi folder `skills/` ke dalam direktori skill agen Anda (misalnya `.agents/skills/` pada proyek saat ini atau direktori global agent Anda). Pastikan skill `penulisan-tugas` terbaca dan siap digunakan.
```

### 2. Prompt Eksekusi Tugas Kuliah / Resume
```text
Gunakan skill `penulisan-tugas` untuk membuat resume/tugas akademik dari materi berikut:
[Lampirkan teks / slide presentasi / file materi di sini]

Pastikan:
1. Menggunakan Tabel Identitas Mode A (tanpa cover).
2. Jika ada diagram Mermaid, gunakan flowchart horizontal (LR) dengan rasio aspek proporsional.
3. Konversikan hasil akhir ke format DOCX dan PDF.
```

---

## 📦 Panduan Instalasi Manual (Universal)

Jika Anda ingin memasangnya secara manual untuk proyek kerja Anda:

### Metode 1: Workspace Proyek (Universal untuk Semua Agen)
Cukup ekstrak isi folder `skills/` ke dalam folder `.agents/skills/` di root proyek Anda:

```bash
# Jalankan di terminal root proyek Anda:
mkdir -p .agents/skills
git clone https://github.com/w4nnnn/my-agent-skills.git /tmp/my-agent-skills
cp -r /tmp/my-agent-skills/skills/* .agents/skills/
rm -rf /tmp/my-agent-skills
```

### Metode 2: Global User Directory
Agar skill dapat diakses oleh AI Agent di folder mana pun di komputer Anda:

```bash
# Standar Open Agent / Claude Code:
mkdir -p ~/.agents/skills
git clone https://github.com/w4nnnn/my-agent-skills.git /tmp/my-agent-skills
cp -r /tmp/my-agent-skills/skills/* ~/.agents/skills/
rm -rf /tmp/my-agent-skills

# Khusus Google Antigravity (jika ingin terbaca di Antigravity GUI & CLI):
mkdir -p ~/.gemini/config/skills
cp -r ~/.agents/skills/* ~/.gemini/config/skills/
```

---

## 📄 Lisensi
MIT License © [w4nnnn](https://github.com/w4nnnn)
