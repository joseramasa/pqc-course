# Recent advancements in quantum computing have accelerated the urgency for adopting post-quantum cryptography.

**TL;DR:** Two recent papers have significantly reduced the estimated quantum resources required for cryptanalysis. Elliptic Curve Cryptography (ECC-256) can now be compromised in minutes using fewer than 500,000 physical qubits (Google/Stanford/Ethereum Foundation), or in approximately 10 days with about 26,000 neutral-atom qubits (Caltech/Oratomic, with Preskill). The gap between current hardware and a cryptographically relevant quantum computer has narrowed from four to two orders of magnitude. Immediate migration to post-quantum cryptography is essential. Organizations are advised to establish concrete timelines, assign clear responsibilities, and allocate sufficient resources for migration planning to maintain security.

---

## Before (2021)

Gidney and Ekerå's 2021 benchmark estimated that breaking RSA-2048 would need about **20 million physical qubits** and eight hours, assuming surface-code error correction on superconducting chips. At that time, the top processors had around 130 qubits, leaving a gap of over five orders of magnitude, which was considered manageable.

## After (March 2026)

Two independent research groups have significantly reduced this gap.

**Cain, Xu, King et al.** (Oratomic, Caltech, Preskill) show that quantum LDPC codes on neutral-atom devices can execute Shor's algorithm with as few as **10,000 atomic qubits**. Their most efficient configuration requires:

- **ECC-256: ~26,000 physical qubits, ~10 days**
- **RSA-2048: ~102,000 physical qubits, ~97 days**

Over the past twenty years, the number of qubits required for cryptanalysis has decreased by approximately **five orders of magnitude**, from 10⁹ to 10⁴. Cain et al. present the most recent advancement in this area.

**Babbush, Zalcman, Gidney et al.** (Google Quantum AI, Ethereum Foundation, UC Berkeley, Stanford) extend these findings. Breaking 256-bit elliptic curve cryptography behind Bitcoin, Ethereum, and TLS now requires:

- **≤1,200 logical qubits and ≤90 million Toffoli gates**, or
- **≤1,450 logical qubits and ≤70 million Toffoli gates**

Superconducting chips with 10⁻³ physical error rates and planar layouts can execute this approach in **minutes using fewer than 500,000 physical qubits**, representing a twentyfold improvement. The research team substantiates these claims with a zero-knowledge proof, enabling independent verification without disclosing specific attack details.

## Why this matters

These developments are part of a broader trend in which the quantum resources required for cryptanalysis decrease by approximately an order of magnitude every few years. The remaining gap between current hardware and a cryptographically relevant quantum computer is now primarily an **engineering challenge rather than a fundamental physics limitation**.

The Babbush et al. paper introduces a critical architectural distinction:

**"Fast-clock" quantum hardware** (superconducting, photonic) runs Shor's algorithm at nanosecond gate speeds, enabling **"on-spend" attacks** — intercepting and forging blockchain transactions before confirmation.

**"Slow-clock" architectures**, such as neutral-atom and ion-trap architectures, currently limit attacks to **"at-rest" scenarios** involving exposed public keys. This reflects current resource estimates, not architectural constraints.

## Implications for cryptocurrencies

The implications for cryptocurrencies are significant. Approximately **1.7 million BTC** (valued at around $170 billion at current prices) are stored in Pay-to-Public-Key (P2PK) scripts with permanently exposed public keys, rendering them susceptible to at-rest attacks as soon as any cryptographically relevant quantum computer (CRQC) becomes available. This figure could increase to **6.9 million BTC** when accounting for address reuse and other vulnerable script types.

**Ethereum** faces even greater exposure than Bitcoin due to its account model, in which public keys are visible at rest, as well as risks associated with smart contract governance, Proof-of-Stake validator attestations, and Data Availability Sampling, all of which rely on ECDSA.

Projected blockchain-based **real-world asset tokenization may surpass $16 trillion by 2030**, introducing systemic risk.

The Google/Ethereum paper concludes that although there is still time to transition to post-quantum cryptography, **the margin for error is rapidly decreasing**. Organizations and asset holders are urged to develop comprehensive migration plans, allocate the necessary resources, and initiate implementation immediately to ensure preparedness before quantum threats materialize.

## The entropy dimension

*The following inference, supported by both papers, extends beyond the explicit analyses presented in their findings.*

A key issue often missed in post-quantum cryptography migration is the quality of randomness underpinning implementations: **verified entropy**. Every NIST PQC standard depends critically on its random inputs:

**ML-KEM** (FIPS 203) derives secret polynomials and encryption noise from random seeds. Predictable seeds mean predictable keys: the mathematical hardness of Module-LWE is irrelevant if the seed space is small.

**ML-DSA** (FIPS 204) in hedged mode (the recommended configuration for hardware) mixes fresh randomness with the message hash before signing. Without it, the signer produces identical intermediate values across executions, enabling differential power analysis. The FIPS specification explicitly warns against deterministic-only deployment on platforms lacking side-channel countermeasures.

**SLH-DSA** (FIPS 205) eliminates state management by randomizing the message index. If the entropy source is biased, the randomized index may collide, increasing the risk of one-time signature leaf reuse — opening a multi-step path toward forgery.

Classical pseudorandom generators (DRBGs) rely on the quality of their seed entropy. While NIST requires DRBG compliance, entropy source evaluation is left to SP 800-90B and hardware, making it a critical dependency outside algorithm standards.

**Verified entropy** — continuously monitored using a physical stochastic model as specified by AIS 20/31 and NIST SP 800-90B — addresses this. The physical entropy source is irreplaceable via firmware and must be engineered from the start.

---

**Papers:**
- Cain et al. (2026): [arxiv.org/abs/2603.28627](https://arxiv.org/abs/2603.28627)
- Babbush et al. (2026): [quantumai.google/...cryptocurrency-whitepaper.pdf](https://quantumai.google/static/site-assets/downloads/cryptocurrency-whitepaper.pdf)
- Gidney & Ekerå (2021): [doi.org/10.22331/q-2021-04-15-433](https://doi.org/10.22331/q-2021-04-15-433)

**NIST Standards:**
- [FIPS 203 (ML-KEM)](https://doi.org/10.6028/NIST.FIPS.203)
- [FIPS 204 (ML-DSA)](https://doi.org/10.6028/NIST.FIPS.204)
- [FIPS 205 (SLH-DSA)](https://doi.org/10.6028/NIST.FIPS.205)
