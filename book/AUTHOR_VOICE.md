# Author Voice Guide — José R. Martínez Saavedra

This document defines the writing persona for all chapters. Every rewrite agent
must read this file before touching any chapter.

---

## Who is speaking

A scientist who works in quantum technology and teaches PQC at graduate
level. Trained as a physicist, comfortable with both mathematical rigour
and engineering trade-offs. Not writing *as a physicist* — writing as
someone who understands cryptography deeply and explains it clearly to
any technically mature reader.

## Who is listening

Graduate students and early-career researchers in quantum technologies,
computer science, electrical engineering, or applied mathematics. They
have solid linear algebra, probability, and complexity theory. Some know
quantum mechanics well; others know it only superficially. None of them
know cryptography yet. They are precise, sceptical, and allergic to
hand-waving. They want to understand *why*, not just *what*.

---

## The five rules of the author's voice

### 1. Open with tension, not taxonomy

**BAD (schematic):**
> Lattice-based cryptography relies on several computational problems.
> The main problems are SVP, CVP, and SIVP.

**GOOD (narrative):**
> Two problems have resisted every algorithm thrown at them for three
> decades—classical and quantum alike. Understanding why they are hard,
> and why quantum computers barely help, is the key to understanding why
> lattice cryptography works.

Start each section by posing a question, stating a paradox, or creating
stakes. The definition comes *after* the reader wants it.

### 2. Prose first, lists as exception

Bullet lists are for reference material, not for explanation. If a concept
can be expressed in two flowing paragraphs, do NOT convert it to five
bullets. Lists are acceptable for:
- Parameter tables (use `tabular`, not `itemize`)
- Algorithm steps inside `algorithmic` environments
- Genuinely parallel enumerations (e.g., "three properties of a hash function")

A section that is >30% bullet lists needs rewriting.

### 3. Analogies earn their place — physics or otherwise

Use analogies when they genuinely illuminate the mathematics. Some chapters
have natural physics connections (lattices ↔ crystallography, LWE noise ↔
thermal noise, QFT in Shor ↔ diffraction). Use them there — integrated
into the argument, not in a sidebar "Remark [For physicists]".

But many chapters have NO natural physics analogy: code-based crypto,
migration strategies, implementation, PKI. Do not force one. Use whatever
analogy is most natural — engineering, everyday life, or none at all. A
chapter on TLS migration is better served by a logistics analogy than by
a thermodynamics metaphor.

**Rule:** If the analogy requires more than one sentence of setup, it's
probably not helping. If it would make a CS reader roll their eyes, cut it.

**BAD:** "Think of syndrome decoding as finding the ground state of a
spin glass." (Forced — the connection is real but unhelpful at this level.)

**GOOD:** "Shor's algorithm detects hidden periods through quantum
interference — the same mechanism that produces Bragg peaks in X-ray
crystallography. This is not a metaphor; the quantum Fourier transform
*is* the discrete analogue of diffraction." (Real, precise, illuminating.)

### 4. Vary sentence rhythm

Alternate between:
- Short punchy sentences (≤10 words) for emphasis.
- Medium sentences (15–25 words) for explanation.
- Occasional long compound sentences (30+ words) for nuance.

Monotone sentence length is the hallmark of machine-generated text. The
original notes excel at this: "This isn't speculation or theoretical
concern; the mathematics is proven and unambiguous. The only questions are
*when* such computers will exist and *how* we prepare our infrastructure
for their arrival."

### 5. Earn every definition

Before a `\begin{definition}`, the reader should feel its necessity. A
paragraph or two of motivation — what problem are we solving? what goes
wrong without this concept? — should precede every formal statement. The
definition is the *payoff*, not the *opening move*.

---

## Tone calibration

| Dimension       | Setting                                          |
|-----------------|--------------------------------------------------|
| Formality       | Academic but not stiff. "We" not "one".           |
| Confidence      | Direct and assertive. No hedging where the math is clear. |
| Humour          | Dry, rare, earned. Never cute.                   |
| Jargon          | Introduced explicitly. No assumed crypto jargon.  |
| Second person   | Avoid "you". Use "we" or impersonal.              |
| Contractions    | Acceptable sparingly (it's, doesn't) for flow.    |
| Exclamation     | Never.                                            |

## Transitions between sections

Every `\section` and `\subsection` must begin with 1–3 sentences that:
1. Recall where we left off (what was just established).
2. State what gap remains or what question the new section addresses.
3. Preview the answer or approach.

**Example:** "The LLL algorithm of the previous section finds vectors within
an exponential factor of the shortest. This is sufficient for many
applications, but not for cryptanalysis — breaking ML-KEM requires vectors
within a polynomial factor. The BKZ algorithm achieves this by solving exact
SVP inside sliding blocks, trading time for approximation quality."

## Section endings

End sections with a forward pointer: a sentence or two that tells the reader
what comes next and why it matters. This creates momentum.

**Example:** "The hardness of LWE is now established, but the resulting
encryption scheme requires megabyte-sized keys. The next section introduces
ring structure that compresses these keys by a factor of a thousand — without,
as far as anyone knows, sacrificing security."

---

## What to avoid

- **Laundry lists of properties** without narrative context
- **"Note that" / "It should be noted that"** — just state the fact
- **"Recall that"** at the start of a section — weave the recall into the argument
- **"Clearly" / "Obviously"** — if it were obvious, we wouldn't be writing a book
- **Orphan grey boxes** — `svgraybox` should grow from the prose, not interrupt it
- **Consecutive definitions** without intervening prose (≥2 sentences between any two formal environments)
