"""
bench_gf.py — Benchmark: naive volle Enumeration vs. grounded-first-Strategie.

Vergleicht die beiden Solver-Einstiege show_json_full (naiv) und
show_json_full_gf (grounded-first) auf denselben synthetischen AFs wie
bench_af.py: einmal Kette + 4 mutuelle 2-Zyklen (fester Konfliktkern U=8)
ueber wachsendes n, einmal reine well-founded Kette (U=0) als Kontrast.

Kein LLM beteiligt, es wird nur SWI-Prolog aufgerufen. Die swipl-Binary wird
wie in af_tool.py aufgeloest: Env-Variable SWIPL > PATH > Windows-Standardpfad.

Aufruf (aus code/):
    python bench_gf.py

Output: Vergleichstabelle auf der Konsole (Zeit naiv vs. grounded-first).
"""
import subprocess, tempfile, time, os, json
from pathlib import Path
from af_tool import SWIPL
CODE=Path(".").resolve(); PROLOG=str(CODE/"prolog.pl").replace("\\","/")
def run(n, edges, goal, timeout=60):
    pl="\n".join([f"arg(a{i})." for i in range(n)]+[f"att(a{a},a{b})." for a,b in edges])
    f=tempfile.NamedTemporaryFile("w",suffix=".pl",dir=str(CODE),delete=False,encoding="utf-8"); f.write(pl); f.close(); af=Path(f.name).stem
    init=f"set_prolog_flag(af_source,'{af}'),consult('{PROLOG}'),{goal},halt."
    t0=time.time()
    try:
        r=subprocess.run([SWIPL,"-g",init,"-t","halt"],capture_output=True,text=True,cwd=str(CODE),timeout=timeout)
        return time.time()-t0, None
    except subprocess.TimeoutExpired: return float(timeout),"TIMEOUT"
    finally: os.unlink(f.name)
def mixed(n_total, k):  # (n_total - 2k) well-founded chain + k mutual 2-cycles -> U=2k
    n_wf=n_total-2*k; base=[(i,i+1) for i in range(n_wf-1)]; off=n_wf
    cyc=[e for i in range(k) for e in ((off+2*i,off+2*i+1),(off+2*i+1,off+2*i))]
    return base+cyc
print(f"{'n':>3} {'U':>3} {'naiv(full)':>12} {'grounded-first':>15}",flush=True)
for n in [10,15,20,25,30,35]:
    e=mixed(n,4)  # U=8 fest
    tn,en=run(n,e,"show_json_full"); tg,eg=run(n,e,"show_json_full_gf")
    print(f"{n:>3} {8:>3} {tn:>10.3f}{' '+en if en else '':>2} {tg:>13.3f}{' '+eg if eg else '':>2}",flush=True)
print("# Kontrast: well-founded U=0, wie skaliert NAIV mit reiner Groesse?",flush=True)
for n in [15,20,25,30]:
    e=[(i,i+1) for i in range(n-1)]
    tn,en=run(n,e,"show_json_full"); tg,eg=run(n,e,"show_json_full_gf")
    print(f"{n:>3} {0:>3} {tn:>10.3f}{' '+en if en else '':>2} {tg:>13.3f}{' '+eg if eg else '':>2}",flush=True)
print("DONE",flush=True)
