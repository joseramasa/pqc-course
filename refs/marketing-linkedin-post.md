LinkedIn Post (short — fits in feed without “see more” truncation)

Two new papers published this week have changed the expected timeline for quantum cryptanalysis.

Cain et al. (with Preskill, Caltech/Oratomic) show Shor’s algorithm can run with as few as 10,000 neutral-atom qubits. This is about 100,000 times fewer than estimates from five years ago. Their setups: break ECC-256 in 10 days using about 26,000 qubits, and break RSA-2048 in 97 days with about 102,000 qubits.

Babbush et al. (Google Quantum AI, Ethereum Foundation, Stanford, with Gidney and Boneh) take it further: they show ECC-256 can be broken in minutes with fewer than 500,000 physical qubits on superconducting hardware. They also highlight a clear difference between 'fast-clock' architectures, such as superconducting and photonic systems that operate in minutes, and 'slow-clock' architectures, such as neutral atoms and ion traps, which operate over days. Each type has its own attack profile.

The impact on blockchain is immediate. About 1.7 million BTC are always exposed via pay-to-public-key (P2PK) scripts, and this number rises to 6.9 million BTC when address reuse is included. In P2PK scripts, the public key is recorded on the blockchain as soon as coins are spent, so a quantum attacker could extract the private key and seize any remaining funds. Ethereum is even more at risk than Bitcoin because its account-based system permanently links public keys to addresses, making all assets tied to those addresses vulnerable if quantum computers become practical. Also, Ethereum’s proof-of-stake (PoS) validator key setup means validator funds are always at risk, since validator public keys are always visible. By 2030, real-world asset tokenization on these platforms could exceed $16 trillion.

This is not a sudden breakthrough, but steady and credible progress. Now, the gap between current hardware and quantum computers relevant to cryptography is measured in engineering generations, not physics breakthroughs. At the current pace, experts estimate that quantum computers capable of breaking today’s cryptography may arrive within a decade. The window to prepare is closing.

Act now—quantum threats are accelerating. Immediately inventory your cryptographic assets, evaluate post-quantum libraries, and establish a dedicated migration task force. Every month counts: early action drastically reduces your risk and paves the way for a seamless transition.

Full analysis with references and implications for the entropy (randomness, a key input for cryptographic security) requirements of deploying post-quantum cryptography (PQC): [SEE OTHER ARTICLE]

Papers:

* Cain et al.: https://arxiv.org/abs/2603.28627
* Babbush et al.: https://quantumai.google/static/site-assets/downloads/cryptocurrency-whitepaper.pdf

#PostQuantumCryptography #QuantumComputing #Cybersecurity #Blockchain #PQC

