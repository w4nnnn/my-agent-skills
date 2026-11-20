---
name: laporan-kerja-praktek-unusida
description: Drafting Laporan Kerja Praktek (KP) UNUSIDA from official docx template with academic formatting, chapter Markdown structure, XML style preservation, vertical list alignment, transparent diagrams, and mathematical equation typography.
---

# Laporan Kerja Praktek UNUSIDA from Official DOCX Template

Use this skill when drafting, restructuring, or compiling an academic internship report (*Laporan Kerja Praktek / Magang*) whose structure and styling are dictated by the official Universitas Nahdlatul Ulama Sidoarjo (UNUSIDA) Microsoft Word (`.docx`) template (cover, approval pages, Bab I–V, Daftar Pustaka, Lampiran).

---

## 1. Procedure & Workflow

### 1.1 Locate and Audit the Template
- Campus templates often contain spaces or parentheses in filenames (e.g., `Template_LAPORAN KP DIGITAL_baru (1).docx`).
- Inspect the file directly to extract the exact chapter structure, sub-chapter numbering, cover placeholders, and style formatting before writing.
- Note whether the template contains background institution watermarks, custom margins (e.g., left 4 cm, right/top/bottom 3 cm), headers, footers, or section breaks.

### 1.2 Drafting Scope & Directory Structure
Draft only the requested chapters (e.g., "sampai Bab 3"). Keep untouched chapters as template placeholders.
Follow the modular Markdown layout:
```text
docs/
├── laporan-kp-<nama>/
│   ├── info-tambahan.md
│   ├── images/
│   │   ├── fig_2_1_...png
│   │   └── fig_3_1_...png
│   ├── bab-1-pendahuluan/
│   │   ├── 1.1-latar-belakang-masalah.md
│   │   ├── 1.2-rumusan-masalah.md
│   │   ├── 1.3-batasan-masalah.md
│   │   ├── 1.4-tujuan-penelitian.md
│   │   └── 1.5-manfaat-penelitian.md
│   ├── bab-2-landasan-teori/
│   │   ├── 2.1-...md
│   │   └── ...
│   └── bab-3-analisis-dan-rancangan-sistem/
│       ├── 3.1-gambaran-umum-perusahaan.md
│       ├── 3.2-analisis-sistem-sebelumnya.md
│       ├── 3.3-masalah-yang-dihadapi.md
│       └── 3.4-rancangan-sistem.md
```
- Each `.md` file begins with the sub-chapter heading matching the template outline (`# <n>.<m> <Judul Subbab>`).
- Maintain `info-tambahan.md` storing student identity (name, NIM, study program, faculty, campus), internship institution details, supervisor names, and paired teammate's title.

---

## 2. Academic Writing Rules (Indonesian Academic Standards)

1. **Point of View (POV)**:
   - Use strictly third-person singular (`penulis` or `peneliti`) or passive voice throughout chapters `Bab I–V`.
   - Never use first-person pronouns (`saya`, `aku`, `kami` — permitted only in the personal *Pernyataan Keaslian Tulisan* / Cover).
   - Never use second-person pronouns (`Anda`, `kamu` — use `pengguna`, `operator`, or `staf`).
   - Do NOT append the author's own name in parentheses after `penulis` (write `penulis`, not `penulis (Nama)`).
   - When referring to a paired project partner, use their full formal name: `rekan tim (Nama Rekan Lengkap)`.

2. **Two-Person / Team Projects**:
   - Each student's report must have a distinct focus (e.g., core automation engine vs. web dashboard UI/UX).
   - Background, problems, theoretical foundation, and system design must be reworded from their respective domain perspective.

3. **Grounding in Real Repository Data**:
   - Compute mathematical workload justifications from real data ($N \text{ rows} \times \text{seconds per check} \to \text{work hours} \to \text{work days}$).
   - Never fabricate data or leak real citizen credentials (mask NIK / phone numbers in examples).

---

## 3. WordprocessingML (.docx) Preservation & Build Pipeline

When compiling Markdown chapters into the final Word document, **never create a blank document from scratch**. Always load the original template with `docx.Document(template_path)` and clone existing styled elements to preserve margins, headers, footers, and font themes.

### 3.1 Cover Textboxes & DrawingML
Word stores textboxes in two paired XML locations:
- Modern DrawingML (`w:txbxContent`)
- Legacy VML fallback (`v:textbox`)
Query all body paragraphs with `doc.element.body.xpath('.//w:p')`. When replacing multiline text (like titles), write the full string with `\n` to every matching paragraph to avoid the second line landing only in the hidden fallback.

### 3.2 Vertical List Alignment & Multi-Level Hierarchical Indentation
Template list paragraphs typically inherit justified alignment (`w:jc="both"`) and a shared global counter (`<w:numPr>`). Using plain space after numbers (`"1. "`) causes Word to stretch the space unevenly, misaligning list numbers vertically. Furthermore, flat markdown parsers strip leading whitespace, causing nested sub-points to lose indentation and sit flush against parent numbers.
**Rules:**
- Inspect leading spaces in raw markdown lines (`indent_len`):
  - `indent_len < 2`: **Level 1** (top-level numbering `1.`, `2.` or bullet `•`)
  - `2 <= indent_len < 5`: **Level 2** (sub-point bullet `•`)
  - `5 <= indent_len < 8`: **Level 3** (sub-sub-point dash `-`)
  - `indent_len >= 8`: **Level 4**
- Strip both `<w:numPr>` and `<w:tabs>` from cloned `pPr`.
- Apply stair-step hierarchical hanging indent:
  - **Level 1**: `left_indent = Pt(36.0)`, `first_line_indent = Pt(-14.7)` (marker sits at `21.3pt` aligned with paragraph margin, tab stop at `720 twips` / `36pt`).
  - **Level 2**: `left_indent = Pt(54.0)`, `first_line_indent = Pt(-18.0)` (marker sits at `36.0pt` aligned with Level 1 text, tab stop at `1080 twips` / `54pt`).
  - **Level 3**: `left_indent = Pt(72.0)`, `first_line_indent = Pt(-18.0)` (marker sits at `54.0pt` aligned with Level 2 text, tab stop at `1440 twips` / `72pt`).
  - **Level 4**: `left_indent = Pt(90.0)`, `first_line_indent = Pt(-18.0)` (marker sits at `72.0pt`, tab stop at `1800 twips` / `90pt`).
- Emit the prefix with a tab character: `r_pref = p.add_run(prefix + "\t")`. All list levels will stair-step cleanly with flawless hanging indentation.

### 3.3 Nested Bold-Italic Formatting & Table Cell Parsing
Numbered items and table cells frequently contain formatting tokens, e.g. `**1. Penantian Otomatis (*Auto-Waiting*)**` or table cells with `**Fitur**`, `*italic*`, and `` `code` ``.
- A naive single regex or `cell.text = val` leaves inner asterisks and backticks unparsed as literal characters.
- In tables (`tbl.cell`), **never assign raw strings via `cell.text = val`**. Instead, take `cell.paragraphs[0]`, clear runs, and invoke `add_formatted_runs(p, val, font_size_pt=9.0)` so all bold (`**`), italic (`*`), and monospace (`` ` ``) spans render into styled runs with zero leaking symbols.
- Set table cell padding `w:tblCellMar` (`top=80 dxa`, `bottom=80 dxa`, `left=120 dxa`, `right=120 dxa`) and row properties `w:cantSplit` and `w:tblHeader` on the first row.
- Use a recursive run tokenizer that passes `base_bold=True` so nested `*italic*` renders as clean **bold-italic** without raw markdown tokens.

### 3.4 Mathematical Equation Typography (3-Column Borderless Table)
Never output raw LaTeX syntax (`$$...$$`, `\text{}`, `\times`, `\approx`, `\frac{}{}`) into the `.docx`.
When parsing math blocks:
1. Parse equations into `(equation_text, tag)`.
2. Convert LaTeX macros to clean academic typography:
   - `\text{...}` $\to$ plain text
   - `\times` $\to$ `×`
   - `\approx` $\to$ `≈`
   - `\cdot` $\to$ `·`
   - `\frac{A}{B}` $\to$ `(A) / (B)`
3. Construct a **3-column borderless table** matching the active text width (14 cm / 5.51 in):
   - **Column 1 (Left Spacer)**: width `0.8 in`, empty. Balances the right column for mathematical centering.
   - **Column 2 (Center Equation)**: width `3.91 in`, center-aligned, 11.5pt Times New Roman italic.
   - **Column 3 (Right Equation Tag)**: width `0.8 in`, right-aligned, 11.5pt Times New Roman regular `(X.Y)`.
   *Benefit*: The equation is centered, and equation numbers (e.g., `(2.1)`, `(3.1)`) lock to the right margin without wrapping or drifting.

### 3.5 High-DPI Transparent Vector Diagrams
Do NOT use ASCII character boxes (`┌──┐`, `▼`) in Word documents—they break on justified margins, font fallback, and page boundaries.
- Render diagrams as SVG vectors exported to 32-bit RGBA PNG with alpha transparency (`rsvg-convert -d 300 -p 300`).
- **Omit canvas background `<rect>`**: University templates have faint institution watermarks. An opaque white background (`fill="#ffffff"`) creates an ugly rectangular mask over the watermark.
- Keep node interiors filled with solid pastel colors (`#e0f2fe`, `#dcfce7`, `#fef3c7`) so the watermark does not interfere with node text, while keeping outer and inter-node spaces transparent.
- Embed images centered (`width = Inches(5.35)`, `keep_with_next = True`) followed by an italic caption: `Gambar X.Y Judul Gambar` (Times New Roman 11pt).

### 3.6 Code Blocks
When cloning paragraphs for code blocks:
- Set `alignment = WD_ALIGN_PARAGRAPH.LEFT` (override justified template text).
- Set font family to `Consolas`, size `9.0pt`.
- Set `space_before = 0`, `space_after = 0`, and `keep_with_next = True` on all lines except the last.

### 3.7 Section Breaks, Headings & Content Page Watermark Restoration
- **Restore Content Page Watermark ("Cover Halaman Isi")**: University templates frequently have a design bug where `first_page_header` has the institution watermark (`image2.png`), but the `default header` (used for page 2 onwards of a chapter) in Section 8 (Bab III), Section 10 (Bab IV), Section 12 (Bab V), etc., lacks the `<w:pict>` element and `rId1` relationship. When chapter content spans multiple pages, page 2 onwards (e.g., PDF page 41 / physical page 9) reverts to plain white. Always inspect all `doc.sections`, and if `sec.header` lacks `w:pict`, add the `rId1` image relationship and inject the `<w:pict>` run into the header's paragraph so all content pages maintain the official watermark.
- **Preserve section break paragraphs (`w:sectPr`)**: Campus templates attach headers/footers to section break paragraphs (`w:sectPr`). Never delete paragraphs containing `w:sectPr`.
- **Heading 2 numbering**: If Heading 2 has `<w:numPr>` enabled, do not include the chapter prefix (`"Latar Belakang Masalah"`, not `"1.1 Latar Belakang Masalah"`), or Word will double-count it (`"1.1 1.1 Latar Belakang Masalah"`).

---

## 4. Verification & QA Checklist

After generating `.docx`:
1. Convert to PDF using headless LibreOffice:
   `soffice --headless --convert-to pdf --outdir <dir> <file.docx>`
2. Render key pages to high-resolution PNG:
   `pdftoppm -png -r 150 -f <page> -l <page> <file.pdf> <out_prefix>`
3. Inspect visually:
   - [ ] No raw LaTeX syntax (`$$`, `\text{}`, `\approx`, `\times`).
   - [ ] Equations are centered with `(X.Y)` tags aligned at the right margin.
   - [ ] List numbering items are aligned straight vertically.
   - [ ] No raw asterisks leaking from nested bold-italic terms.
   - [ ] Table cells are formatted with bold/italic/monospace without raw markdown asterisks (*, **) or backticks.
   - [ ] Flowchart and architecture diagrams are visual PNGs with transparent canvas.
   - [ ] Watermark behind diagrams is visible in transparent gaps.
   - [ ] Content page watermarks ("cover halaman isi") persist across page 2 onwards of all chapters.
   - [ ] Headings and section breaks match the official university template.
