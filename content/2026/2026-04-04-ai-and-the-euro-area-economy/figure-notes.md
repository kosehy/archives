# Figure Notes — AI and the euro area economy

This archive was upgraded to a figure-aware archive in a second pass.

## Recovery status

Recovered figure assets:
- `figures/figure-01.png` through `figures/figure-36.png`
- `figures/figure-37.svg`

## Interpretation notes

- The ECB page exposes a sequence of article-specific image assets under `sp260323_1/`.
- These assets were recovered directly from ECB-hosted URLs and stored as-is.
- The article text references charts 1 through 22. The recovered figure asset count is larger because the page appears to include additional image fragments, subpanels, or layout-specific rendered assets.
- For that reason, the file numbering here preserves recovery order from the page assets, not a manually asserted one-to-one semantic mapping to chart numbers.
- The original text archive already preserves chart titles and notes in text, which should be used together with these image assets during later review.

## Recovery structure observed so far

The recovered assets fall into several size groups, which strongly suggests mixed asset types rather than a clean one-file-per-chart export.

### Wide charts
- `figure-01.png` `(1181×538)`
- `figure-02.png` `(1182×532)`
- `figure-03.png` `(1181×538)`
- `figure-20.png` `(1181×532)`
- `figure-21.png` `(1181×532)`
- `figure-22.png` `(1181×532)`

### Narrow / single-panel style charts
- `figure-07.png` through `figure-14.png`
- `figure-16.png` through `figure-19.png`
- `figure-23.png` through `figure-36.png`

Most of these are around `590×532`, which likely indicates repeated single-panel chart renders.

### Small or special-layout assets
- `figure-04.png` `(472×540)`
- `figure-05.png` `(470×525)`
- `figure-06.png` `(472×520)`
- `figure-15.png` `(1233×555)`
- `figure-37.svg` `viewBox 0 0 483 208`

### One directly identified asset
- `figure-37.svg` contains visible labels such as `2024`, `2025`, `2026`, `Term structure-based (range)`, `Semi-structural (range)`, `Survey-based (median)`, and `NAWM-r*`.
- Based on the original text, this almost certainly corresponds to **Chart 22: Nominal equilibrium rates in the euro area**.

## Current mapping confidence

### Confirmed mapping
- **High confidence:** `figure-37.svg` ↔ **Chart 22 — Nominal equilibrium rates in the euro area**

### Needs human review
The following groups are organised for manual review, but are **not** asserted as confirmed mappings yet.

#### Group A — wide landscape assets
- `figure-01.png` `(1181×538)`
- `figure-02.png` `(1182×532)`
- `figure-03.png` `(1181×538)`
- `figure-20.png` `(1181×532)`
- `figure-21.png` `(1181×532)`
- `figure-22.png` `(1181×532)`

Likely candidates: multi-panel or full-width charts such as Charts 4, 5, 6, 11, 15, 19.

#### Group B — small/special-layout assets
- `figure-04.png` `(472×540)`
- `figure-05.png` `(470×525)`
- `figure-06.png` `(472×520)`
- `figure-15.png` `(1233×555)`

Likely candidates: unusually formatted charts or mixed-layout panel charts.

#### Group C — repeated single-panel style assets
- `figure-07.png` through `figure-14.png`
- `figure-16.png` through `figure-19.png`
- `figure-23.png` through `figure-36.png`

Most of these are around `590×532`, suggesting a repeated single-chart export pattern.

Likely candidates: the many single-panel charts referenced in the text, including Charts 7, 8, 9, 10, 12, 13, 14, 16, 17, 18, 20, 21.

### Practical review order
If a human wants to confirm mappings quickly, check in this order:
1. `figure-37.svg` against Chart 22 (already effectively confirmed)
2. wide charts in Group A
3. special-layout Group B
4. repeated single-panel Group C

This means the archive is now figure-aware and materially improved, but still not fully semantically indexed chart by chart.

## Review recommendation

If precise chart-to-asset mapping becomes important later, compare:
1. `original.en.md`
2. the recovered `figures/`
3. the live ECB page structure

and then annotate exact matches chart by chart.
