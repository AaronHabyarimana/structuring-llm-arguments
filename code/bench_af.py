import subprocess, tempfile, time, os, sys, json
from pathlib import Path

SWIPL=r"C:\Program Files\swipl\bin\swipl.exe"
CODE=Path(".").resolve(); PROLOG=str(CODE/"prolog.pl").replace("\\","/")

def run(n, edges, timeout=60):
    pl="\n".join([f"arg(a{i})." for i in range(n)]+[f"att(a{a},a{b})." for a,b in edges])
    f=tempfile.NamedTemporaryFile("w",suffix=".pl",dir=str(CODE),delete=False,encoding="utf-8")
    f.write(pl); f.close(); af=Path(f.name).stem
    init=f"set_prolog_flag(af_source,'{af}'),consult('{PROLOG}'),show_json_full_gf,halt."
    t0=time.time()
    try:
        r=subprocess.run([SWIPL,"-g",init,"-t","halt"],capture_output=True,text=True,cwd=str(CODE),timeout=timeout)
        dt=time.time()-t0; out=[l for l in r.stdout.splitlines() if l.startswith("{")]
        d=json.loads(out[0]) if out else {}
        return dt, len(d.get("preferred") or []), len(d.get("stable") or []), None
    except subprocess.TimeoutExpired:
        return float(timeout), None, None, "TIMEOUT(>%ds)"%timeout
    finally: os.unlink(f.name)

def chain(n): 
    return [(i,i+1) for i in range(n-1)]

def two_cycles(k): 
    return [e for i in range(k) for e in ((2*i,2*i+1),(2*i+1,2*i))]

def mixed(n_wf, k):  # n_wf well-founded chain + k mutual 2-cycles (U=2k)
    base=chain(n_wf); off=n_wf
    cyc=[e for i in range(k) for e in ((off+2*i,off+2*i+1),(off+2*i+1,off+2*i))]
    return n_wf+2*k, base+cyc

def pr(label,n,u,dt,npf,nst,err):
    print(f"{label:24} {n:>3} {('U='+str(u)):>7} {dt:>8.3f} {str(npf):>8} {str(nst):>8}  {err or ''}",flush=True)

print(f"{'case':24} {'n':>3} {'U':>7} {'time_s':>8} {'#pref':>8} {'#stab':>8}",flush=True)
print("# 1) well-founded (U=0): haengt Laufzeit von n ab?",flush=True)
for n in [10,20,30,40,50,60]:
    dt,npf,nst,err=run(n,chain(n)); pr("wellfounded_chain",n,0,dt,npf,nst,err)
print("# 2) k mutuelle 2-Zyklen (= Symmetrisierungs-Effekt), #pref=2^k",flush=True)

for k in [2,4,6,8,10,11,12,13,14,15]:
    dt,npf,nst,err=run(2*k,two_cycles(k)); pr("mutual_2cycles",2*k,2*k,dt,npf,nst,err)
print("# 3) realistisch: 35 Atome, well-founded-Mehrheit + kleiner Zyklus-Kern",flush=True)

for k in [0,2,3,4,5,6,7,8]:
    n,e=mixed(35-2*k,k); dt,npf,nst,err=run(n,e); pr(f"mixed35_{k}cyc",n,2*k,dt,npf,nst,err)
print("DONE",flush=True)
