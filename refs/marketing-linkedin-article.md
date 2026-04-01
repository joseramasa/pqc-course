Recent advancements in quantum computing have accelerated the urgency for adopting post-quantum cryptography.

Summary: Two recent papers sharply reduce the estimated quantum resources required for cryptanalysis. Elliptic Curve Cryptography (ECC-256) can now be broken in minutes using under 500,000 physical qubits (Google/Stanford/Ethereum Foundation), or in about 10 days with roughly 26,000 neutral-atom qubits (Caltech/Oratomic, with Preskill). The gap between today's hardware and a cryptographically relevant quantum computer has narrowed from four to two orders of magnitude. Immediate migration to post-quantum cryptography is critical. Organizations should set concrete timelines, assign responsibility, and allocate resources for migration planning to maintain security.

---

Before (2021)

Gidney and Ekerå’s 2021 benchmark estimated that breaking RSA-2048 would need about 20 million physical qubits and eight hours, assuming surface-code error correction on superconducting chips. At that time, the top processors had around 130 qubits, leaving a gap of over five orders of magnitude, which was considered manageable.

After (March 2026)

Two independent research groups have significantly reduced this gap.

Cain, Xu, King et al. — from Oratomic and Caltech, with John Preskill — show that high-rate quantum LDPC codes on reconfigurable neutral-atom devices can execute Shor’s algorithm with as few as 10,000 atomic qubits. Their most efficient setup requires:

* ECC-256: ~26,000 physical qubits, ~10 days
* RSA-2048: ~102,000 physical qubits, ~97 days

In two decades, the number of required qubits for cryptanalysis dropped by about 5 orders of magnitude, from 10⁹ to 10⁴. Cain et al. show the most recent advance.

Babbush, Zalcman, Gidney et al., representing Google Quantum AI, the Ethereum Foundation, UC Berkeley, and Stanford, extend these findings. They show that breaking 256-bit elliptic curve cryptography behind Bitcoin, Ethereum, and TLS requires: ≤1,200 logical qubits and ≤90 million Toffoli gates, or

* ≤1,450 logical qubits and ≤70 million Toffoli gates

Superconducting chips with 10⁻³ physical error rates and planar layout can run this approach in minutes using under 500,000 physical qubits—a twentyfold advance. The team demonstrates these claims via a zero-knowledge proof, allowing independent verification without revealing attack details.

Why this matters

These aren’t isolated breakthroughs but continue a trend: quantum resources for cryptanalysis consistently drop by around an order of magnitude every few years. The latest estimates matter because now the gap between current hardware and a cryptographically relevant quantum computer involves engineering progress, not fundamental physics.

The Babbush et al. paper introduces a critical architectural distinction:

“Fast-clock” quantum hardware (superconducting, photonic) can run Shor’s algorithm at nanosecond gate speeds, enabling “on-spend” attacks: intercepting, solving, and forging blockchain transactions before confirmation.

“Slow-clock” architectures—such as neutral-atom and ion-trap architectures—currently limit runtimes to “at-rest” attacks on exposed public keys. This limit reflects today’s resource estimates, not an inherent architectural barrier.

Implications for cryptocurrencies

The implications for cryptocurrencies are substantial:

1.7 million BTC (~$170 billion at current prices) are locked in Pay-to-Public-Key (P2PK) scripts with permanently exposed public keys — vulnerable to at-rest attack the moment any CRQC exists. The total may reach 6.9 million BTC when address reuse and all other vulnerable script types are included.

Ethereum is more exposed than Bitcoin due to its account model (public keys are visible at rest), smart contract governance risks, Proof-of-Stake validator attestations, and Data Availability Sampling—all of which depend on ECDSA.

Projected blockchain-based real-world asset tokenization may exceed $16 trillion by 2030, posing systemic risk.

The Google/Ethereum paper concludes that while there remains time to migrate to post-quantum cryptography, the margin for error is rapidly diminishing. Organizations and asset holders should develop detailed migration plans, allocate necessary resources, and begin implementation immediately to ensure preparedness before quantum threats emerge.

The entropy dimension

The following inference, supported by both papers, extends beyond their explicit analyses.

A key issue often missed in post-quantum cryptography migration is the quality of randomness underpinning implementations—verified entropy.

Every NIST PQC standard depends critically on its random inputs:

ML-KEM (FIPS 203) derives secret polynomials and encryption noise from random seeds. Predictable seeds mean predictable keys — the mathematical hardness of Module-LWE is irrelevant if the seed space is small.

ML-DSA (FIPS 204) in hedged mode — the recommended configuration for hardware — mixes fresh randomness with the message hash before signing. Without it, the signer produces identical intermediate values across executions, enabling differential power analysis. The FIPS specification explicitly warns against deterministic-only deployment on platforms lacking side-channel countermeasures.

SLH-DSA (FIPS 205) eliminates state management by randomizing the message index. If the entropy source is biased, the randomized index may collide, increasing the risk of one-time signature leaf reuse — opening a multi-step path toward forgery.

Classical pseudorandom generators (DRBGs) rely on the quality of their seed entropy. While NIST requires DRBG compliance, entropy source evaluation is left to SP 800-90B and hardware, making it a critical dependency outside algorithm standards.

Verified entropy, continuously monitored using a physical stochastic model as specified by AIS 20/31 and NIST SP 800-90B, addresses this. The physical entropy source is irreplaceable via firmware and must be engineered from the start.

---

Papers:

* Cain et al. (2026): arxiv.org/abs/2603.28627
* Babbush et al. (2026): quantumai.google/…cryptocurrency-whitepaper.pdf
* Gidney & Ekerå (2021): doi.org/10.22331/q-2021-04-15-433

NIST Standards:

* FIPS 203 (ML-KEM)
* FIPS 204 (ML-DSA)
* FIPS 205 (SLH-DSA)