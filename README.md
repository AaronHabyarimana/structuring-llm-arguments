# Structuring LLM Arguments: A Logic of Argumentation Based Approach

Bachelor thesis, Johannes Gutenberg University Mainz.

The pipeline combines a large language model with formal argumentation: the LLM extracts and atomizes arguments from debate texts and classifies pairwise attack relations, a Dung-style abstract argumentation framework is then solved with SWI-Prolog (grounded, preferred and stable semantics), and the LLM explains the result in natural language.

## How it works

1. **Argument extraction and atomization.** The LLM reads the sentences of a debate topic and turns them into short, self-contained arguments.
2. **Attack classification.** For every pair of arguments the LLM decides whether one attacks the other (rebuttal, undermining or undercutting, reduced to a binary attack relation).
3. **Formal evaluation.** The arguments and attacks form a Dung-style abstract argumentation framework, which is solved with SWI-Prolog under grounded, preferred and stable semantics.
4. **Explanation.** The LLM translates the solver output (accepted and rejected arguments) back into a natural language summary.

Every stage writes its artifacts to `code/output/runs/<run_id>/`, so each run is fully traceable from raw sentences to the final explanation.

## Repository layout

| Path | Content |
|---|---|
| `code/` | Pipeline, experiment scripts and evaluation |
| `code/output/` | Experiment runs, aggregates, gold evaluation and thesis tables |
| `BachelorThesis/` | LaTeX sources of the thesis, compiled PDF at `BachelorThesis/my-thesis.pdf` |
| `paper/` | Accompanying paper |
| `UKP_sentential_argument_mining/` | Place the UKP corpus here (not included, see below) |

## Requirements

- Python 3.12
- [SWI-Prolog](https://www.swi-prolog.org/) (`swipl` on the PATH, or set the `SWIPL` environment variable to the binary)
- Access to the JGU Mainz KI-Chat API (model: GPT OSS 120B)

Install the Python dependencies:

```
pip install -r code/requirements.txt
```

Set the API key, either as an environment variable or in a `.env` file in `code/`:

```
KI_API_KEY=<your key>
```

An API key can be created at [ki-chat.uni-mainz.de](https://ki-chat.uni-mainz.de) under Settings, Account, create new key.

## Dataset

The experiments use the UKP Sentential Argument Mining Corpus (Stab et al., 2018). For copyright reasons the corpus is **not** distributed with this repository. It can be requested from the UKP Lab at TU Darmstadt. After obtaining it, place the topic files (e.g. `nuclear_energy.tsv`, `abortion.tsv`, ...) in:

```
UKP_sentential_argument_mining/data/
```

The run logs under `code/output/` contain the small per-topic samples of sentences drawn for the experiments, as part of the experimental record. The stance annotations included there are released by the corpus authors under a [CC BY-NC](https://creativecommons.org/licenses/by-nc/4.0/) license (Stab et al., 2018).

## Usage

All scripts are run from the `code/` directory.

Interactive chat (choose a topic, run the pipeline, ask follow-up questions):

```
python chat.py
```

Batch experiments over all eight UKP topics (or a subset):

```
python batch_run.py
python batch_run.py nuclear_energy abortion
```

Each run writes a folder `output/runs/<run_id>/` with the full experimental record:

- `report_<topic>.md` is the human readable summary of the run, this is the file to open first
- `arguments.jsonl` holds the extracted and atomized arguments, `pair_decisions.jsonl` and `attacks.jsonl` hold the attack decision for every argument pair
- the generated `.pl` file is the argumentation framework in Prolog syntax, `results.json` holds the solver output under all three semantics and `graph_stats.json` the graph statistics
- `run_config.json`, `calls.jsonl` and `runtime.json` record the exact parameters, every single LLM call and the timing, so each run is fully traceable

### All runnable scripts

`chat.py`, `batch_run.py` and `ablation_typed_binary.py` call the LLM and therefore need the API key. All other scripts only read existing run folders under `code/output/` and work without a key, so the included results can be inspected and re-evaluated immediately.

| Script | Purpose | Output |
|---|---|---|
| `chat.py` | Interactive pipeline run with follow-up questions | `output/runs/<run_id>/` |
| `batch_run.py [topics]` | Pipeline over all eight UKP topics or a subset | one `output/runs/<run_id>/` per topic |
| `ablation_typed_binary.py` | Ablation: typed vs. binary attack prompts on a shared atomization | `output/ablation/<ts>_<topic>_seed<seed>/` |
| `aggregate.py` | Cross-topic table over the latest run per topic | `output/aggregate.csv`, `output/aggregate_report.md` |
| `eval_gold.py --run <run_dir>` | Precision, recall and F1 of a run against the manual gold standard, plus error lists | console and `<run_dir>/gold_eval.txt` |
| `make_thesis_tables.py` | Recomputes every evaluation table of the thesis from the canonical runs | `output/thesis_tables.md`, `output/thesis_tables/tab-*.tex` |
| `gold_template.py` | Creates or validates the annotation template for the gold standard | `output/gold/<sample>/gold_template.csv` |
| `bench_af.py`, `bench_gf.py` | Solver runtime benchmarks on synthetic frameworks, no LLM involved | console |

Each script also carries a docstring at the top of the file with details and further call variants.

## Reproducing the thesis results

The numbers reported in the thesis are produced by running the scripts in this order from `code/`:

1. `python batch_run.py` runs the full pipeline over all eight UKP topics.
2. `python aggregate.py` builds the cross-topic aggregate table over all runs.
3. `python eval_gold.py --run output/ablation/2026-07-05_r3_nuclear_energy_seed42` evaluates the canonical gold run against the manual gold standard. This is the run behind the gold table in the thesis, the same directory is hard-wired in `make_thesis_tables.py`.
4. `python make_thesis_tables.py` turns the results into the LaTeX tables used in the thesis.

`python ablation_typed_binary.py` additionally reproduces the ablation comparing typed and binary attack prompts. The compiled thesis is included at `BachelorThesis/my-thesis.pdf`.

### Note on the gold standard

The manually annotated gold standard is included at `code/output/gold/nuclear_energy_seed42/` and covers the nuclear energy topic. Its labels refer to the frozen argument set first produced by the run in `output/ablation/2026-07-02_1037_nuclear_energy_seed42` and reused by the canonical gold run `2026-07-05_r3_nuclear_energy_seed42`, so `eval_gold.py` is only meaningful for runs built on exactly that argument set. It prints a clear warning when the evaluated edges fall outside the gold pair set. Evaluating a newly generated run against gold therefore requires a new annotation round: create a template with `gold_template.py --args <run>/arguments.json`, fill in the labels by hand and pass the file via `--gold`.
