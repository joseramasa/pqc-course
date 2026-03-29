# Post-Quantum Cryptography — Course Materials

Course materials for the **Post-Quantum Cryptography** seminar at the [Master of Quantum Science and Technology](https://www.masterquantum.it/it/home-2/), Università degli Studi di Bari Aldo Moro (Italy).

**Instructor:** José R. Martínez Saavedra — [joseramasa.github.io](https://joseramasa.github.io)

## Contents

- `slides.tex` — Beamer presentation (69 frames)
- `notes.tex` — Detailed lecture notes (159 pages)
- `slides.pdf` — Compiled slides
- `notes.pdf` — Compiled notes

## Building

```bash
# Notes (compiles cleanly)
pdflatex notes.tex

# Slides (requires xelatex, some backup slides have known issues)
xelatex -interaction=nonstopmode slides.tex
```

## Topics

1. Classical cryptography foundations
2. The quantum threat (Shor's algorithm, Grover's algorithm)
3. Lattice-based cryptography (LWE, Ring-LWE, Module-LWE)
4. NIST PQC standards (ML-KEM, ML-DSA, SLH-DSA)
5. Migration strategies and hybrid approaches

## License

Course materials by José R. Martínez Saavedra. All rights reserved.
