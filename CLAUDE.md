# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Vietnamese-language academic thesis report (báo cáo đồ án) for PTIT university. Subject: building a smart sales embedded system (ShopNexus) using ESP32-CAM + AI services. Written entirely in Vietnamese using custom `thesis.cls` based on the `memoir` class.

## Build

No local Makefile. Build with:
```bash
latexmk -pdf main.tex
```
CI uses `xu-cheng/latex-action@v3` on push to `main` and `iot` branches. Output deploys to GitHub Pages.

Clean build artifacts:
```bash
latexmk -C
```

## Architecture

- `main.tex` — Entry point. Defines metadata (title, supervisor, students), loads packages, includes all chapters.
- `thesis.cls` — Custom document class. Handles Vietnamese localization (T5 encoding, babel), page geometry (A4, 3/2/2/2 cm margins), cover page generation (`\coverpage`), chapter/section styling with `headerblue` color, and the `preface` environment for front matter.
- `chapters/front/` — Declaration, acknowledgments, abstract (use `preface` environment).
- `chapters/main/` — 6 chapters: introduction, theory, analysis-design, implementation, results, conclusion.
- `chapters/back/` — Appendices (test-suite, design-docs) — currently placeholders.
- `refs/example.bib` — BibTeX bibliography.
- `graphics/` — Images (currently only `ptit.png` logo).

**Note:** Old chapter files (`overview.tex`, `methodology.tex`, `sys-design.tex`, `eval.tex`) still exist in `chapters/main/` but are no longer included in `main.tex`.

## Key Conventions

### Unicode
T5 font encoding does NOT support Unicode symbols. Always use LaTeX math commands:
- `→` must be `$\rightarrow$`
- `↔` must be `$\leftrightarrow$`
- `≈` must be `$\approx$`
- `×` must be `$\times$`

Vietnamese diacritics (ă, ơ, ư, etc.) work fine — they're handled by `vntex`.

### Tables
Use `booktabs` style (`\toprule`, `\midrule`, `\bottomrule`). Header rows use:
```latex
\rowcolor{headerblue} \textcolor{white}{\textbf{Column}} & ...
```
Alternating rows use `\rowcolor{rowgray}`.

### Cross-references
Use `cleveref` (`\cref`, `\Cref`) — it must load after `hyperref` (already handled in `thesis.cls`).

### Citations
`natbib` with superscript square brackets. Use `\cite{}`. All bib entries auto-included via `\nocite{*}`.

### Chapter titles
Automatically uppercased and centered with blue rules. Use `\chapter{Title}` — don't manually uppercase.

### Front matter sections
Use the `preface` environment:
```latex
\begin{preface}{Section Title}
Content here...
\end{preface}
```
