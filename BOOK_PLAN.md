# Post-Quantum Cryptography: From Physics to Practice

**Series target:** Springer Graduate Texts in Information Security (or Texts in Computer Science)
**Estimated length:** 350–420 pages (17 chapters + appendices)
**Working title:** *Post-Quantum Cryptography: Mathematical Foundations for the Quantum Age*
**Subtitle option:** *A Physicist's Path to Quantum-Resistant Security*

---

## Differentiator

No existing Springer title bridges physics and PQC at textbook depth. Current options are either survey collections (e.g., Bernstein & Lange) or pure CS treatments that assume no quantum mechanics background. This book targets the growing population of quantum technology students and physicists entering cybersecurity — a market that will expand as PQC migration becomes mandatory.

---

## Structure

### Part I — Foundations (Chapters 1–4, ~90 pages)

#### Chapter 1: The Quantum Threat to Modern Cryptography (~20 pp)
- The cryptographic infrastructure of the digital age
- Harvest now, decrypt later: why the threat is already active
- Timeline: from Shor (1994) to NIST standards (2024) to full migration (~2035)
- Scope and goals of this book

| Source | Notes |
|--------|-------|
| §1 (Introduction) | ~70% reusable. Remove lecture framing ("three-hour", "you will learn"). Expand historical context. |

#### Chapter 2: Mathematical Preliminaries (~30 pp)
- Groups, rings, fields, and polynomial rings
- Modular arithmetic and the Chinese Remainder Theorem
- Probability distributions and statistical distance
- Computational complexity: P, NP, reductions, average-case vs worst-case hardness
- Notation conventions used throughout the book

| Source | Notes |
|--------|-------|
| Appendix A (Mathematical Background) | ~30% reusable. Currently 3 short subsections (~150 lines). Needs substantial expansion: CRT, statistical distance, polynomial rings over Z_q, formal reduction definitions. This is the chapter that anchors the rigor of the rest of the book. |

#### Chapter 3: Classical Cryptographic Systems (~25 pp)
- Symmetric cryptography: block ciphers, modes, AES
- Public-key cryptography: RSA, Diffie-Hellman, elliptic curves
- Digital signatures: RSA-PSS, ECDSA
- Public key infrastructure and the TLS handshake
- Security notions: IND-CPA, IND-CCA2, EUF-CMA

| Source | Notes |
|--------|-------|
| §2 (Classical Cryptography in Practice) | ~80% reusable. Strong existing content. Remove `\begin{frame}` artifacts. Add formal security definitions (IND-CPA, IND-CCA2, EUF-CMA) — currently missing entirely. Tighten the TLS case study. |

#### Chapter 4: Quantum Algorithms and Cryptanalysis (~25 pp)
- Quantum computing model: qubits, gates, measurement
- Shor's algorithm: period finding, quantum Fourier transform, factoring and discrete log
- Grover's algorithm: unstructured search, amplitude amplification
- Quantum resource estimates for breaking RSA-2048 and ECC
- What quantum computers *cannot* do efficiently

| Source | Notes |
|--------|-------|
| §3.1 (Quantum Algorithms Breaking Classical Crypto) | ~70% reusable. Good coverage of Shor and Grover. Add: formal circuit descriptions, explicit resource estimates table (logical qubits, T-gates, time), brief quantum RAM discussion. |

---

### Part II — Post-Quantum Cryptographic Primitives (Chapters 5–11, ~180 pages)

#### Chapter 5: The Post-Quantum Landscape (~20 pp)
- Algorithm families at a glance: lattices, codes, hashes, multivariate, isogenies
- The NIST standardization process: rounds, criteria, outcomes
- PQC vs QKD: complementary not competing
- Hybrid classical/post-quantum approaches
- How to evaluate a PQC candidate

| Source | Notes |
|--------|-------|
| §3.2 (PQC vs QKD), §3.3 (PQC families overview), §4.4.1 (NIST process) | ~60% reusable. Merge and reorganize. The NIST process narration is currently split across sections — consolidate into a coherent timeline with tables. Add 4th-round candidates (HQC, BIKE). |

#### Chapter 6: Lattice Theory (~30 pp)
- Lattices: definitions, bases, determinant, dual lattice
- The connection to crystallography (the physics bridge)
- Fundamental problems: SVP, CVP, SIVP, GapSVP
- Lattice basis reduction: LLL algorithm, BKZ
- Computational complexity of lattice problems
- Worst-case to average-case reductions (Ajtai's theorem)

| Source | Notes |
|--------|-------|
| §4.1 (Mathematical Foundations), §4.2 (Computational Complexity) | ~60% reusable. Good physics analogies. Needs: formal LLL description with correctness proof sketch, BKZ overview, Ajtai's reduction statement and proof intuition, concrete hardness estimates (root Hermite factor). |

#### Chapter 7: Learning With Errors and Lattice-Based Encryption (~30 pp)
- The LWE problem: definition, hardness, quantum reductions
- Ring-LWE: polynomial rings, efficiency, security tradeoffs
- Module-LWE: the middle ground
- Regev's encryption scheme
- The Fujisaki-Okamoto transform: CPA to CCA2
- ML-KEM (CRYSTALS-Kyber): construction, parameters, security levels

| Source | Notes |
|--------|-------|
| §4.2 (LWE), §4.3 (Ring-LWE and Module-LWE), §4.4.2 (Kyber) | ~55% reusable. LWE definition and intuition are solid. Needs: Regev's reduction (LWE → GapSVP) with proof sketch, formal FO transform description, complete ML-KEM specification with NTT discussion, parameter selection rationale. |

#### Chapter 8: Lattice-Based Digital Signatures (~25 pp)
- The Fiat-Shamir framework and "hash-and-sign" paradigm
- ML-DSA (CRYSTALS-Dilithium): construction, rejection sampling, parameters
- Falcon: NTRU lattices, GPV framework, fast Fourier sampling
- Comparison: ML-DSA vs Falcon tradeoffs
- Security proofs in the (quantum) random oracle model

| Source | Notes |
|--------|-------|
| §4.4.3 (Dilithium), §4.4.4 (Falcon) | ~35% reusable. Current coverage is overview-level (~100 lines each). Needs significant expansion: Fiat-Shamir with aborts, rejection sampling analysis, NTRU lattice theory for Falcon, concrete parameter tables, QROM security discussion. **Largest expansion needed in Part II.** |

#### Chapter 9: Code-Based Cryptography (~25 pp)
- Error-correcting codes: linear codes, Goppa codes, decoding
- The syndrome decoding problem and its hardness
- McEliece cryptosystem: construction, 45 years of security, key size challenge
- Classic McEliece: the NIST candidate
- HQC and BIKE: structured codes for smaller keys
- The physics connection: quantum error correction, channel capacity

| Source | Notes |
|--------|-------|
| §3.4.2 (Code-Based Cryptography) | ~20% reusable. Currently one subsection (~290 lines) with good overview but no depth. Needs: Goppa code construction, McEliece encryption/decryption algorithms, ISD attack analysis, HQC and BIKE descriptions, parameter tables. **New chapter, mostly from scratch.** |

#### Chapter 10: Hash-Based Signatures (~25 pp)
- One-time signatures: Lamport, Winternitz (WOTS+)
- Merkle trees and few-time signatures
- Stateful schemes: XMSS, LMS
- Stateless schemes: SPHINCS+ / SLH-DSA
- FORS: few-time signatures from random subsets
- Security analysis: minimal assumptions, concrete bounds
- The state management problem and why it matters

| Source | Notes |
|--------|-------|
| §3.4.3 (Hash-Based Signatures) | ~20% reusable. Currently one subsection (~290 lines) with Lamport and Merkle tree. Needs: WOTS+ chain construction, hypertree structure of SPHINCS+, FORS description, stateful vs stateless tradeoff analysis, concrete parameter tables. **New chapter, mostly from scratch.** |

#### Chapter 11: Multivariate, Isogeny-Based, and Other Approaches (~20 pp)
- Multivariate quadratic systems: MQ problem, Oil-Vinegar, Rainbow's fall
- Isogeny-based cryptography: the SIDH/SIKE story and its spectacular break (2022)
- Lessons learned: what makes a cryptographic assumption trustworthy?
- Emerging directions: group actions (CSIDH), lattice isogenies
- Comparative security analysis across all families

| Source | Notes |
|--------|-------|
| §3.4.4 (Other Approaches) | ~40% reusable. Good narrative on multivariate failures and SIKE collapse. Needs: formal MQ problem treatment, isogeny mathematics (supersingular curves, endomorphism rings), Castryck-Decru attack explanation, CSIDH overview. The pedagogical value is in the "autopsy" — why things break. |

---

### Part III — Practice and Future (Chapters 12–17, ~100 pages)

#### Chapter 12: Implementation and Side-Channel Resistance (~20 pp)
- Constant-time programming: why and how
- Side channels in lattice cryptography: timing, power, EM
- Random number generation for PQC
- Key and ciphertext sizes: bandwidth and storage implications
- Testing and validation: known-answer tests, formal verification

| Source | Notes |
|--------|-------|
| §5.1 (Implementation Challenges) | ~60% reusable. Good code examples (Barrett reduction timing attack). Add: masking countermeasures for NTT, fault injection attacks on lattice schemes, NIST validation program (CMVP) for PQC. |

#### Chapter 13: Hardware Security (~15 pp)
- FPGA and ASIC implementations for PQC
- Hardware random number generators (QRNG)
- Trusted Platform Modules and PQC
- Side-channel resistance in hardware
- Performance benchmarks: hardware vs software

| Source | Notes |
|--------|-------|
| New chapter. | Complements Chapter 12 by focusing on hardware-specific concerns: FPGA/ASIC acceleration for NTT and polynomial arithmetic, QRNG integration, TPM 2.0 PQC extensions. |

#### Chapter 14: Migration Strategies (~20 pp)
- Hybrid modes: composite keys, dual signatures
- TLS 1.3 with post-quantum key exchange (RFC 9180+)
- Code signing and software supply chain
- Certificate infrastructure migration
- Blockchain and cryptocurrency implications
- Organizational roadmap: inventory, prioritize, migrate, verify

| Source | Notes |
|--------|-------|
| §5.2 (Migration Strategies), §5.3 (Case Studies) | ~50% reusable. Good case studies on TLS migration and blockchain. Add: CNSA 2.0 timeline, EU/ANSSI guidance, concrete hybrid TLS handshake diagrams, certificate transparency with PQC. |

#### Chapter 15: Standards and Regulatory Landscape (~15 pp)
- NIST FIPS 203/204/205 and beyond
- International regulatory postures: CNSA 2.0, EU CRA, ANSSI, BSI
- Certification and compliance requirements
- Jurisdictional comparison and global migration coordination

| Source | Notes |
|--------|-------|
| New chapter. | Consolidates the regulatory and standards material that cross-cuts migration and implementation. Covers NIST final standards, EU Cyber Resilience Act, national agency guidance. |

#### Chapter 16: Advanced Cryptographic Primitives (~15 pp)
- Fully homomorphic encryption: from Gentry to TFHE
- Zero-knowledge proofs: lattice-based ZK, post-quantum SNARKs
- Secure multiparty computation
- The noise–depth tradeoff and bootstrapping
- Applications: private ML inference, confidential computing

| Source | Notes |
|--------|-------|
| §6.2 (Beyond Current Standards) | ~40% reusable. Good FHE and ZKP overviews with physics analogies. Add: TFHE scheme overview, practical FHE parameter selection, lattice-based commitment schemes, Dilithium-based ring signatures. Keep this chapter focused — it's a gateway, not a treatise. |

#### Chapter 17: Open Problems and Research Directions (~15 pp)
- Quantum cryptanalysis of lattice problems
- Physical side-channel research opportunities
- Hardware acceleration: FPGA/ASIC for NTT and sampling
- Cryptographic agility as a design principle
- The 50-year horizon: what comes after PQC?
- Where physicists can contribute

| Source | Notes |
|--------|-------|
| §6.1 (Research Opportunities), §6.3 (Long-Term Perspectives) | ~50% reusable. Good framing of physicist contributions. Add: concrete open problems as numbered items (useful for PhD students), recent developments in quantum algorithms for lattices (2024-2025), post-quantum TLS performance benchmarks. |

---

### Back Matter

#### Appendix A: Notation and Symbols (~5 pp)
- Complete symbol table
- Convention reference

| Source: New |

#### Appendix B: Proof Supplements (~15 pp)
- Full proofs deferred from main text
- Ajtai's reduction, LWE hardness, FO transform correctness

| Source: New |

#### Appendix C: Reference Implementations (~10 pp)
- Python examples using liboqs
- Performance benchmarking scripts
- Recommended libraries and tools

| Source | Notes |
|--------|-------|
| Appendix B (Example Code) | ~40% reusable. Clean up, update API calls, add ML-DSA and SLH-DSA examples. |

#### Appendix D: Solutions to Selected Exercises (~10 pp)

| Source: New |

#### Bibliography (~10 pp, 250–300 entries)

| Source: `references.bib` exists with ~110 entries covering all 17 chapters. Expand to target range. |

---

## Content Mapping Summary

| Chapter | Source sections | Reuse % | New pages needed |
|---------|---------------|---------|-----------------|
| 1. Quantum Threat | §1 | 70% | ~6 |
| 2. Math Prelim | App. A | 30% | ~21 |
| 3. Classical Crypto | §2 | 80% | ~5 |
| 4. Quantum Algorithms | §3.1 | 70% | ~8 |
| 5. PQC Landscape | §3.2–3.3, §4.4.1 | 60% | ~8 |
| 6. Lattice Theory | §4.1 | 60% | ~12 |
| 7. LWE & Encryption | §4.2–4.3, §4.4.2 | 55% | ~14 |
| 8. Lattice Signatures | §4.4.3–4.4.4 | 35% | ~16 |
| 9. Code-Based | §3.4.2 | 20% | ~20 |
| 10. Hash-Based | §3.4.3 | 20% | ~20 |
| 11. Other Approaches | §3.4.4 | 40% | ~12 |
| 12. Implementation | §5.1 | 60% | ~8 |
| 13. Hardware Security | New | 0% | ~15 |
| 14. Migration | §5.2–5.3 | 50% | ~10 |
| 15. Standards & Regulatory | New | 0% | ~15 |
| 16. Advanced Primitives | §6.2 | 40% | ~9 |
| 17. Open Problems | §6.1, §6.3 | 50% | ~8 |
| Appendices | App. A–B, new | 20% | ~32 |
| **Total** | | | **~239 new pp** |

**Estimated total:** ~370 pages (159 existing reworked + ~239 new)

---

## Exercises Strategy

Each chapter ends with 10–15 exercises in three tiers:

- **Conceptual** (3–5): Test understanding, can be answered in 1–2 paragraphs
- **Computational** (3–5): Require calculation or small proofs
- **Programming** (2–3): Implement or analyze with code (Python + liboqs)
- **Research** (1–2): Open-ended, suitable for seminar discussion or project work

Target: ~180 exercises total, solutions for ~60 in Appendix D.

---

## Bibliography Strategy

Start a BibTeX file immediately. Priority references by chapter:

1. **Foundational:** Shor (1994), Grover (1996), Diffie-Hellman (1976), RSA (1978)
2. **Lattices:** Ajtai (1996), Regev (2005/2009), Lyubashevsky-Peikert-Regev (2010/2013)
3. **NIST standards:** FIPS 203 (ML-KEM), FIPS 204 (ML-DSA), FIPS 205 (SLH-DSA)
4. **Breaks:** Castryck-Decru (2022, SIKE), Beullens (2022, Rainbow)
5. **Surveys:** Bernstein-Lange, Peikert's lattice survey (2016), Micciancio-Regev
6. **Implementation:** liboqs, pqcrypto.org, NIST PQC project reports

---

## Transformation Checklist

Global changes needed across all reused content:

- [ ] Remove all lecture framing ("I will assume", "three-hour", "as physicists, you")
- [ ] Replace second person ("you") with impersonal or first-person plural ("we")
- [ ] Remove `\begin{frame}` artifacts (at least one found in §2)
- [ ] Add `\cite{}` references throughout (~5–10 per page average)
- [ ] Convert from `article` class to Springer `svmono` class
- [ ] Add `\index{}` entries for all key terms
- [ ] Number theorems, definitions, examples per chapter (Springer convention)
- [ ] Add chapter-end exercises
- [ ] Replace FAQ section with properly integrated content
- [ ] Add cross-references between chapters

---

## Suggested Timeline

| Phase | Scope | Duration |
|-------|-------|----------|
| 1. Setup | Springer `svmono` scaffold, BibTeX file, chapter stubs | 1 week |
| 2. Part I | Chapters 1–4 (highest reuse, establishes tone) | 4–6 weeks |
| 3. Part II core | Chapters 6–8 (lattices — your strongest material) | 4–6 weeks |
| 4. Part II expansion | Chapters 9–11 (most new content) | 6–8 weeks |
| 5. Chapter 5 | Landscape chapter (depends on Parts I & II being solid) | 2 weeks |
| 6. Part III | Chapters 12–15 | 4–6 weeks |
| 7. Exercises | All chapters | 3–4 weeks |
| 8. Back matter | Appendices, bibliography completion, index | 2–3 weeks |
| 9. Review | Full read-through, consistency, proof supplements | 3–4 weeks |

**Total: ~7–9 months** of focused work (assuming this is not full-time).

---

## Next Steps

1. **Now:** Set up the Springer `svmono` LaTeX scaffold with all 17 chapter files
2. **Now:** Initialize `references.bib` with the ~30 most critical entries
3. **First chapter to write:** Chapter 6 (Lattice Theory) — it's the heart of the book and your strongest material. Starting here sets the mathematical tone for everything else.
