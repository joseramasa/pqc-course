# LinkedIn Post (short — fits in feed without "see more" truncation)

Two papers dropped this week that shift the quantum cryptanalysis timeline significantly.

Cain et al. (with Preskill, Caltech/Oratomic) show Shor's algorithm can run on as few as 10,000 neutral-atom qubits — five orders of magnitude fewer than estimates from just five years ago. Their most time-efficient configurations: ECC-256 in 10 days with ~26K qubits, RSA-2048 in 97 days with ~102K qubits.

Babbush et al. (Google Quantum AI, Ethereum Foundation, Stanford — with Gidney and Boneh) go further: ECC-256 broken in minutes with <500K physical qubits on superconducting hardware. They introduce a sharp distinction between "fast-clock" architectures (superconducting, photonic — minutes) and "slow-clock" (neutral atoms, ion traps — days), with different attack profiles for each.

The blockchain implications are immediate: 1.7M BTC in P2PK scripts are permanently exposed, up to 6.9M BTC total when address reuse is included. Ethereum is more exposed than Bitcoin due to its account model and PoS validator key structure. Real-world asset tokenization is projected to exceed $16T by 2030 on these platforms.

This isn't a sudden breakthrough — it's steady, credible progress. The gap between current hardware and a cryptographically relevant quantum computer is now measured in engineering generations, not physics breakthroughs.

There is time to migrate. The margin for error is narrowing.

Full analysis with references and implications for PQC deployment entropy requirements: [LINK TO ARTICLE]

Papers:
- Cain et al.: https://arxiv.org/abs/2603.28627
- Babbush et al.: https://arxiv.org/abs/XXXX.XXXXX

#PostQuantumCryptography #QuantumComputing #Cybersecurity #Blockchain #PQC
