# Figure Notes

## figures/feedshare.jpg

- Source: LinkedIn JSON-LD `image.url`
- Local path: `figures/feedshare.jpg`
- File type: JPEG image, 681x727
- Size: 74861 bytes
- SHA-256: `d6413cc091358484eb41c3b2b216ffde85e7fe61889ab4df6584b9ded1d7ca15`

## Visual/OCR description

The image is a screenshot of the `turbovec` README page. It contains a dark banner with the text:

- “turbovec”
- “Google's TurboQuant for vector search”
- badge row: license MIT, PyPI v0.7.0, crates.io v0.8.0, paper arXiv

The main visible claim says:

> A 10 million document corpus takes 31 GB of RAM as float32. turbovec fits it in 4 GB - and searches it faster than FAISS.

Visible bullets describe:

- Online ingest: add vectors without a train step, parameter tuning, or rebuilds as the corpus grows.
- Faster than FAISS: NEON on ARM and AVX-512BW on x86 kernels reportedly beat or match FAISS IndexPQFastScan.
- Filter at search time: allowlist/slot bitmask filtering inside `search()`.
- Pure local: no managed service and no data leaving the user's machine or VPC.

## Evidentiary role

The figure is useful because it visually confirms that the LinkedIn post is discussing the public `turbovec` README claims. It is not independent evidence that the benchmark numbers reproduce in production.
