# The quantum clock just accelerated — and so did the case for post-quantum cryptography

**Two papers published in the last 48 hours fundamentally change the resource estimates for breaking today's cryptography with quantum computers.**

---

## Before (2021)

The benchmark was Gidney and Ekerå's 2021 estimate [1]: breaking RSA-2048 requires roughly **20 million noisy physical qubits** and about 8 hours of computation, using surface-code error correction on a superconducting architecture. With the largest quantum processors at ~1,000 qubits, the gap was four orders of magnitude in qubit count alone. Comfortable.

## After (March 2026)

Two independent groups have compressed that gap dramatically.

**Cain, Xu, King et al.** [2] — with John Preskill at Caltech — show that by leveraging high-rate quantum error-correcting codes (qLDPC) on reconfigurable neutral-atom architectures, Shor's algorithm can execute at cryptographically relevant scales with as few as **10,000 atomic qubits**. Their most time-efficient configurations require:

- **ECC-256: ~26,000 physical qubits, ~10 days**
- **RSA-2048: ~102,000 physical qubits, ~97 days**

That is a **five-order-of-magnitude reduction** in qubit requirements over 20 years — from 10⁹ to 10⁴ [2, Fig. 1b].

**Babbush, Zalcman, Gidney et al.** [3] — from Google Quantum AI, the Ethereum Foundation, UC Berkeley, and Stanford — go further. They demonstrate that breaking 256-bit elliptic curve cryptography (the backbone of Bitcoin, Ethereum, and TLS) requires:

- **≤1,200 logical qubits and ≤90 million Toffoli gates**, or
- **≤1,450 logical qubits and ≤70 million Toffoli gates**

On a superconducting architecture with 10⁻³ physical error rates and planar connectivity, this translates to **execution in minutes using fewer than 500,000 physical qubits** — a 20× reduction from prior estimates [3, §II.B]. The resource claims are substantiated with a zero-knowledge proof to prevent misuse of the specific circuit details [3, Appendix A].

## Why this matters

This is not a sudden breakthrough. It is the continuation of a consistent, credible trend: quantum resources for cryptanalysis shrink by roughly an order of magnitude every few years [2, Fig. 1b]. What changed this week is that the estimates have crossed a threshold where the gap between existing hardware and a cryptographically relevant quantum computer (CRQC) can be measured in **engineering generations, not physics breakthroughs**.

The Babbush et al. paper [3] introduces a critical architectural distinction. **"Fast-clock" quantum computers** — superconducting and photonic platforms with gate times in the nanosecond range — can execute Shor's algorithm fast enough to enable **"on-spend" attacks** on blockchain transactions: intercepting a transaction, solving the discrete logarithm, and submitting a forged transaction before the original is confirmed [3, §II.A]. **"Slow-clock" architectures** — neutral atoms and ion traps — are limited to **"at-rest" attacks** on long-exposed public keys, but are viable with far fewer qubits [2].

For cryptocurrencies, the implications are severe:

- **1.7 million BTC** (~$170 billion at current prices) are locked in Pay-to-Public-Key (P2PK) scripts with permanently exposed public keys — vulnerable to at-rest attack the moment any CRQC exists [3, §III.A]. The total may reach 2.3 million BTC when address reuse is included [3, §III.C].
- **Ethereum** is more exposed than Bitcoin due to its account model (public keys visible at rest), smart contract governance risks, Proof-of-Stake validator attestations, and Data Availability Sampling — all ECDSA-dependent [3, §V].
- **Real-world asset tokenization** on blockchain is projected to exceed **$16 trillion by 2030** [3, §VI.D], approaching systemic "too big to fail" economic thresholds.

The Google/Ethereum paper concludes: *there is time to migrate to post-quantum cryptography, but the margin for error is increasingly narrow* [3, §IX].

## The entropy dimension

One aspect that both papers implicitly reinforce — and that is often overlooked in the migration debate — is the role of **verified entropy** in post-quantum cryptographic deployments.

Every NIST PQC standard depends critically on the quality of its random inputs:

- **ML-KEM** (FIPS 203 [4]) derives its secret polynomial and encryption noise from random seeds passed through SHAKE-128. Predictable seeds mean predictable keys — the mathematical hardness of Module-LWE is irrelevant if the seed space is small [5, §4.1].
- **ML-DSA** (FIPS 204 [6]) in hedged mode — the recommended configuration for hardware implementations [6, §3.6.1] — mixes a fresh random value with the message hash before signing. Without this hedging randomness, the signer produces identical intermediate values across executions, enabling differential power analysis (DPA) with unlimited averaged traces [7]. The FIPS specification explicitly warns against deterministic-only deployment on platforms lacking side-channel countermeasures [6, §3.6.1, Note].
- **SLH-DSA** (FIPS 205 [8]) eliminates state management by randomising the message index through a random value `opt_rand`. The security proof assumes this value is uniformly random [8, §10.3]. If the entropy source is biased, the randomised index may collide, causing WOTS+ leaf reuse — a direct path to forgery [9].

Classical pseudorandom generators (DRBGs, per NIST SP 800-90A [10]) are only as strong as their seed entropy. The NIST post-quantum standards mandate compliance with SP 800-90A for random number generation, but the standard itself defers the question of entropy source quality to SP 800-90B [11] and the physical hardware.

This creates a critical dependency: **the entire PQC stack — algorithms, protocols, implementations — rests on an entropy foundation that is outside the scope of the algorithm standards themselves.** If the entropy source is weak, biased, or manipulable, every layer above it collapses, regardless of how quantum-resistant the mathematics may be.

Verified entropy — entropy whose statistical properties are continuously monitored against a physical stochastic model, as required by AIS 31 PTG.2/PTG.3 [12] and NIST SP 800-90B [11] — closes this gap. It is the one component in the PQC migration that cannot be patched with a firmware update or a parameter change. It must be engineered correctly from the start.

---

## References

[1] C. Gidney and M. Ekerå, "How to factor 2048 bit RSA integers in 8 hours using 20 million noisy qubits," *Quantum*, vol. 5, p. 433, 2021. doi:10.22331/q-2021-04-15-433

[2] M. Cain, Q. Xu, R. King, L.R.B. Picard, H. Levine, M. Endres, J. Preskill, H.-Y. Huang, D. Bluvstein, "Shor's algorithm is possible with as few as 10,000 reconfigurable atomic qubits," arXiv:2603.28627, March 2026.

[3] R. Babbush, A. Zalcman, C. Gidney, M. Broughton, T. Khattar, H. Neven, T. Bergamaschi, J. Drake, D. Boneh, "Securing Elliptic Curve Cryptocurrencies against Quantum Vulnerabilities: Resource Estimates and Mitigations," March 2026.

[4] NIST, "Module-Lattice-Based Key-Encapsulation Mechanism Standard," FIPS 203, August 2024.

[5] S. Ravi, M.P. Roy, A. Chattopadhyay, S. Bhasin, "On exploiting message leakage in (few) NIST PQC candidates for practical message recovery and key recovery attacks," *TCHES* 2022(1), pp. 138–168.

[6] NIST, "Module-Lattice-Based Digital Signature Standard," FIPS 204, August 2024.

[7] A. Primas, R. Pessl, S. Mangard, "Single-trace side-channel attacks on masked lattice-based encryption," *CHES 2017*, LNCS 10529, pp. 513–533, Springer.

[8] NIST, "Stateless Hash-Based Digital Signature Standard," FIPS 205, August 2024.

[9] A. Hülsing, "W-OTS+ – Shorter Signatures for Hash-Based Signature Schemes," *AFRICACRYPT 2013*, LNCS 7918, pp. 173–191.

[10] NIST, "Recommendation for Random Number Generation Using Deterministic Random Bit Generators," SP 800-90A Rev. 1, June 2015.

[11] NIST, "Recommendation for the Entropy Sources Used for Random Bit Generation," SP 800-90B, January 2018.

[12] BSI, "A proposal for: Functionality classes for random number generators," AIS 31, Version 2.0, 2011.

---

*Dr. José Ramón Martínez Saavedra — Quside Technologies*
*April 2026*
