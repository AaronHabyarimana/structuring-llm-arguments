# Gold-Standard Annotation Guidelines — Attack Relations (Nuclear Energy)

You are labelling, for each of the 201 argument pairs in `gold_template.csv`, whether
an **attack relation** holds and in which direction. Fill only the `label` column
(optionally `note`). Do not change any other column.

These guidelines mirror the attack definition the extraction pipeline is built on
(Pollock 1992; ASPIC+, Modgil & Prakken 2014), so that the pipeline is scored
against the same notion of "attack" it aims to produce.

## The core question

For a pair (A, B), ask: **does accepting one argument give a genuine reason to
reject the other?**

An attack exists when one argument does at least one of the following to the other:

1. **Rebuttal** — asserts a conclusion that is logically incompatible with the
   other's conclusion (they cannot both be true).
2. **Undermining** — attacks a premise the other relies on.
3. **Undercutting** — shows the other's conclusion does not follow, even if its
   premise were true.

You do **not** label which of the three types it is — only whether an attack
exists and its direction. The three types are listed only to help you recognise
an attack.

## What is NOT an attack (label `none`)

- **Mere opposing stance.** Two arguments being on opposite sides (pro vs con) is
  not enough. There must be a genuine conflict between the two *specific* claims.
- **Different sub-topics.** If A is about waste storage and B is about cost, and
  neither's truth bears on the other, there is no attack.
- **Different objects (strict object reading).** Claims are judged for the object
  they name as written. A claim about one subsystem or entity is not a claim
  about the whole system, and vice versa. An attack may rely on a minimal
  natural implicit premise, but it must not additionally require switching the
  object the claims are about. If the conflict only arises after reading one
  claim as being about a different object than it names → `none`.
- **Same-side agreement.** Two pro (or two con) claims that simply coexist.
- **Non-arguments.** If an atom is a bare stance declaration or a procedural/meta
  sentence (e.g. "I will always support X", "For this reason I introduced bill Y"),
  it carries no premise/conclusion and cannot attack or be attacked → `none`.

## Choosing the direction

Once you decide an attack exists, pick the direction. In each row, A = `a_id`,
B = `b_id`.

| Situation | Label |
|---|---|
| No attack | `none` |
| Only A gives a reason to reject B | `a_attacks_b` |
| Only B gives a reason to reject A | `b_attacks_a` |
| Both give a reason to reject the other (mutual, typical of a direct rebuttal) | `both` |

Rule of thumb:
- **Undermining / undercutting** are usually **one-directional** (the attacker
  targets the other's premise or inference, not vice versa).
- A **direct contradiction of conclusions** ("waste is safely stored" vs "waste is
  an unresolved problem") is usually **`both`**, because each conclusion, if true,
  refutes the other.

## Worked examples (real rows from this template)

- Row `pro82__con36` — A = pro82 "storage is safe and secure", B = con36 "nuclear
  waste remains an unresolved problem" → the two conclusions directly contradict,
  each refutes the other → **`both`**.
- Row `pro82__con27` — A = pro82 "storage is safe and secure", B = con27 "uranium
  sources are as finite as other fuels" → storage safety and resource finiteness
  are different sub-topics, both can be true → **`none`**.

> `a_attacks_b` always means `a_id → b_id`. Always read the specific row's
> `a_id`/`b_id` and map the direction accordingly.

## Consistency tips

- Decide **attack yes/no first**, direction second. Do not let stance colour the
  yes/no decision.
- Judge the **claims as written**, not the broader debate. A weak or vague atom
  can still attack if its specific claim conflicts.
- When genuinely unsure, put your reasoning in `note` and pick the most defensible
  label; revisit borderline notes at the end for consistency.
- Aim to be able to justify every `none` as "these two claims can both be true
  without tension."

## Checking your progress

Run at any time:

```
python gold_template.py --validate output/gold/nuclear_energy_seed42/gold_template.csv
```

It reports missing/invalid labels, the label distribution, and the number of
directed gold edges. "OK" means every one of the 201 rows has a valid label.
