# LLM-Based Argument Mining with Formal Argumentation

Bachelor thesis, Johannes Gutenberg University Mainz.

The pipeline combines a large language model with formal argumentation: the LLM extracts and atomizes arguments from debate texts and classifies pairwise attack relations, a Dung-style abstract argumentation framework is then solved with SWI-Prolog (grounded, preferred and stable semantics), and the LLM explains the result in natural language.

## Repository layout

| Path | Content |
|---|---|
| `code/` | Pipeline, experiment scripts and evaluation |
| `code/output/` | Experiment runs, aggregates, gold evaluation and thesis tables |
| `Bachelorthesis/` | LaTeX sources of the thesis |
| `paper/` | Accompanying paper |
| `UKP_sentential_argument_mining/` | Place the UKP corpus here (not included, see below) |

## Requirements

- Python 3.12
- [SWI-Prolog](https://www.swi-prolog.org/) (the path to `swipl.exe` is set in `code/af_tool.py`)
- Access to the JGU Mainz KI-Chat API (model: GPT OSS 120B)

Install the Python dependencies:

```
pip install -r code/requirements.txt
```

Set the API key, either as an environment variable or in a `.env` file in `code/`:

```
KI_API_KEY=<your key>
```

## Dataset

The experiments use the UKP Sentential Argument Mining Corpus (Stab et al., 2018). For copyright reasons the corpus is **not** distributed with this repository. It can be requested from the UKP Lab at TU Darmstadt. After obtaining it, place the topic files (e.g. `nuclear_energy.tsv`, `abortion.tsv`, ...) in:

```
UKP_sentential_argument_mining/data/
```

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

Each run writes a folder `output/runs/<run_id>/` containing the run config, extracted arguments, attack decisions, the generated Prolog AF, solver results, graph statistics and a report.

Further scripts:

| Script | Purpose |
|---|---|
| `aggregate.py` | Cross-topic aggregate table over all runs |
| `eval_gold.py --run <run_dir>` | Evaluation against the manual gold standard |
| `ablation_typed_binary.py` | Ablation: typed vs. binary attack prompts |
| `make_thesis_tables.py` | Generates the LaTeX tables used in the thesis |
| `gold_template.py` | Creates annotation templates for the gold standard |
