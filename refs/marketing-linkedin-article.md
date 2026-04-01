# The quantum clock just accelerated — and so did the case for post-quantum cryptography

*Dr. José Ramón Martínez Saavedra — April 2026*

**TL;DR:** Two papers published this week reduce quantum cryptanalysis resource estimates by orders of magnitude. ECC-256 can now be broken in minutes with <500K physical qubits (Google/Stanford/Ethereum Foundation) or in 10 days with ~26K neutral-atom qubits (Caltech/Oratomic, with Preskill). The gap between current hardware and a cryptographically relevant quantum computer has shrunk from ~4 to ~2 orders of magnitude. Migration to post-quantum cryptography is urgent.

---

## Before (2021)

The benchmark was Gidney and Ekerå's 2021 estimate: breaking RSA-2048 requires roughly **20 million noisy physical qubits** and about 8 hours of computation, using surface-code error correction on a superconducting architecture. With the largest quantum processors at ~130 physical qubits, the gap was over five orders of magnitude in qubit count alone. Comfortable.

## After (March 2026)

Two independent groups have compressed that gap dramatically.

**Cain, Xu, King et al.** — from Oratomic and Caltech, with John Preskill among the senior authors — show that by leveraging high-rate quantum error-correcting codes (qLDPC) on reconfigurable neutral-atom architectures, Shor's algorithm can execute at cryptographically relevant scales with as few as **10,000 atomic qubits**. Their most time-efficient configurations require:

- **ECC-256: ~26,000 physical qubits, ~10 days**
- **RSA-2048: ~102,000 physical qubits, ~97 days**

Over the past two decades, qubit requirements for cryptanalysis have fallen by roughly **five orders of magnitude** — from ~10⁹ physical qubits in early estimates to ~10⁴ today. The Cain et al. result represents the latest — and steepest — step in that trend.

**Babbush, Zalcman, Gidney et al.** — from Google Quantum AI, the Ethereum Foundation, UC Berkeley, and Stanford — go further. They demonstrate that breaking 256-bit elliptic curve cryptography (the backbone of Bitcoin, Ethereum, and TLS) requires:

- **≤1,200 logical qubits and ≤90 million Toffoli gates**, or
- **≤1,450 logical qubits and ≤70 million Toffoli gates**

On a superconducting architecture with 10⁻³ physical error rates and planar connectivity, this translates to **execution in minutes using fewer than 500,000 physical qubits** — a 20× reduction from prior estimates. The resource claims are validated through a zero-knowledge proof that allows independent verification without disclosing attack implementation details.

## Why this matters

This is not a sudden breakthrough. It is the continuation of a consistent, credible trend: quantum resources for cryptanalysis shrink by roughly an order of magnitude every few years. What changed this week is that the estimates have crossed a threshold where the gap between existing hardware and a cryptographically relevant quantum computer (CRQC) can be measured in **engineering generations, not physics breakthroughs**.

The Babbush et al. paper introduces a critical architectural distinction:

**"Fast-clock" quantum computers** — superconducting and photonic platforms with gate times in the nanosecond range — can execute Shor's algorithm fast enough to enable **"on-spend" attacks** on blockchain transactions: intercepting a transaction, solving the discrete logarithm, and submitting a forged transaction before the original is confirmed.

**"Slow-clock" architectures** — neutral atoms and ion traps — currently yield runtimes that restrict them to **"at-rest" attacks** on long-exposed public keys, though this limitation reflects the present state of resource estimates rather than a fundamental architectural constraint.

## Implications for cryptocurrencies

For cryptocurrencies, the implications are severe:

**1.7 million BTC** (~$170 billion at current prices) are locked in Pay-to-Public-Key (P2PK) scripts with permanently exposed public keys — vulnerable to at-rest attack the moment any CRQC exists. The total may reach **6.9 million BTC** when address reuse and all other vulnerable script types are included.

**Ethereum** is more exposed than Bitcoin due to its account model (public keys visible at rest), smart contract governance risks, Proof-of-Stake validator attestations, and Data Availability Sampling — all ECDSA-dependent.

**Real-world asset tokenization** on blockchain is projected to exceed **$16 trillion by 2030**, approaching systemic "too big to fail" economic thresholds.

The Google/Ethereum paper concludes: *there is time to migrate to post-quantum cryptography, but the margin for error is increasingly narrow.*

## The entropy dimension

*The analysis above is based on the two published papers. What follows is an inference that both papers implicitly reinforce.*

One aspect often overlooked in the PQC migration debate is the role of **verified entropy** — the quality of randomness feeding post-quantum cryptographic implementations.

Every NIST PQC standard depends critically on its random inputs:

**ML-KEM** (FIPS 203) derives secret polynomials and encryption noise from random seeds. Predictable seeds mean predictable keys — the mathematical hardness of Module-LWE is irrelevant if the seed space is small.

**ML-DSA** (FIPS 204) in hedged mode — the recommended configuration for hardware — mixes fresh randomness with the message hash before signing. Without it, the signer produces identical intermediate values across executions, enabling differential power analysis. The FIPS specification explicitly warns against deterministic-only deployment on platforms lacking side-channel countermeasures.

**SLH-DSA** (FIPS 205) eliminates state management by randomising the message index. If the entropy source is biased, the randomised index may collide, increasing the risk of one-time signature leaf reuse — opening a multi-step path toward forgery.

Classical pseudorandom generators (DRBGs) are only as strong as their seed entropy. The NIST standards mandate DRBG compliance but defer entropy source quality to SP 800-90B and the physical hardware. This creates a critical dependency: **the entire PQC stack rests on an entropy foundation that is outside the scope of the algorithm standards themselves.**

Verified entropy — continuously monitored against a physical stochastic model, as required by AIS 20/31 and NIST SP 800-90B — closes this gap. The physical entropy source is the one component that cannot be patched with a firmware update. It must be engineered correctly from the start.

---

**Papers:**
- Cain et al. (2026): [arxiv.org/abs/2603.28627](https://arxiv.org/abs/2603.28627)
- Babbush et al. (2026): (link pending publication)
- Gidney & Ekerå (2021): [doi.org/10.22331/q-2021-04-15-433](https://doi.org/10.22331/q-2021-04-15-433)

**NIST Standards:**
- [FIPS 203 (ML-KEM)](https://doi.org/10.6028/NIST.FIPS.203)
- [FIPS 204 (ML-DSA)](https://doi.org/10.6028/NIST.FIPS.204)
- [FIPS 205 (SLH-DSA)](https://doi.org/10.6028/NIST.FIPS.205)
