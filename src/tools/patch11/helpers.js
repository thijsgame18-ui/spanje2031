let S=defaults();
try{const l=JSON.parse(localStorage.getItem('sp-state')||'null');if(l&&l.v)S=Object.assign(defaults(),l)}catch(e){}
let BASE=(()=>{try{return JSON.parse(localStorage.getItem('sp-base2')||'null')}catch(e){return null}})();
function saveLocal(){try{localStorage.setItem('sp-state',JSON.stringify(S))}catch(e){}}
function setBase(d){BASE=d?clone(d):null;try{if(d)localStorage.setItem('sp-base2',JSON.stringify(BASE));else localStorage.removeItem('sp-base2')}catch(e){}}
const isObj=x=>!!x&&typeof x==='object'&&!Array.isArray(x);
const eq=(a,b)=>JSON.stringify(a===undefined?null:a)===JSON.stringify(b===undefined?null:b);
const cl=x=>x===undefined?undefined:clone(x);
/* 3-weg samenvoegen: wat alleen aan één kant veranderd is blijft bewaard; bij een echt conflict wint dit apparaat */
function m3(L,R,B){if(eq(L,R))return cl(L);if(eq(L,B))return cl(R);if(eq(R,B))return cl(L);
  if(Array.isArray(L)&&Array.isArray(R)){const b=Array.isArray(B)?B:[];const idy=a=>a.every(x=>isObj(x)&&x.id);
    if(idy(L)&&idy(R)&&(L.length||R.length)){const bm=new Map(b.filter(isObj).map(x=>[x.id,x])),rm=new Map(R.map(x=>[x.id,x])),lm=new Map(L.map(x=>[x.id,x])),out=[];
      L.forEach(l=>{const r=rm.get(l.id),bb=bm.get(l.id);if(r)out.push(m3(l,r,bb));else if(!bb||!eq(l,bb))out.push(cl(l))});
      R.forEach(r=>{if(lm.has(r.id))return;const bb=bm.get(r.id);if(!bb||!eq(r,bb))out.push(cl(r))});return out}
    if(L.every(x=>typeof x!=='object')&&R.every(x=>typeof x!=='object'))return [...new Set([...L,...R])].filter(x=>!(b.includes(x)&&(!L.includes(x)||!R.includes(x))));
    if(L.length===R.length)return L.map((x,i)=>m3(x,R[i],b[i]));return cl(L)}
  if(isObj(L)&&isObj(R)){const bo=isObj(B)?B:{},out={};new Set([...Object.keys(L),...Object.keys(R)]).forEach(k=>{
    if(!(k in L)){if(k in bo&&eq(R[k],bo[k]))return;out[k]=cl(R[k]);return}
    if(!(k in R)){if(k in bo&&eq(L[k],bo[k]))return;out[k]=cl(L[k]);return}
    out[k]=m3(L[k],R[k],bo[k])});return out}
  return cl(L)}
function merge3(L,R){if(!BASE)return Object.assign(defaults(),L);return Object.assign(defaults(),m3(L,R,BASE))}
const LINK={d4:'nie',d5:'vert',d7:'zorg',e2:'padron',e3:'resi',e4:'bank'};
const tasks=()=>TASKS.map(([id,t,f,tile])=>({id,t,f,tile})).concat(S.custom.map(c=>({...c,c:true})));
const isDone=id=>LINK[id]?!!S.docs[LINK[id]]:S.done.includes(id);
function setDone(id,on){if(LINK[id]){S.docs[LINK[id]]=on;return}S.done=on?[...new Set(S.done.concat(id))]:S.done.filter(x=>x!==id)}
const total=()=>(+S.acc.ing||0)+(+S.acc.degiro||0)+(+S.acc.pokemon||0);
const overwaarde=()=>(+S.house.v2031||0)-(+S.house.hyp||0);
const vertrek=()=>new Date(S.vertrek+'T12:00:00');
const daysLeft=()=>Math.max(0,Math.ceil((vertrek()-new Date())/864e5));
const monthsLeft=()=>Math.max(1,Math.round(daysLeft()/30.44));
function faseP(f){const t=tasks().filter(x=>x.f===f);return pct(t.filter(x=>isDone(x.id)).length,t.length)}
function allP(){const t=tasks();return pct(t.filter(x=>isDone(x.id)).length,t.length)}
const FIN_IDS={koop:1,itp:1,nota:1,advo:1,verb:1};
function fincaCost(){const f=S.finca,k=+f.prijs||0;return{koop:k,itp:k*(+f.itp||0)/100,bij:k*(+f.bij||0)/100,verb:+f.verb||0,huisjes:(+S.huisjes.aantal||0)*(+S.huisjes.kosten||0)}}
function costTot(){let e=0,m=0;for(const[id,,f]of ALLC){if(FIN_IDS[id])continue;const v=+S.costs[id]||0;if(f==='e')e+=v;else if(f==='m')m+=v;else m+=v/12}return{e,m}}
function needCalc(){const fc=fincaCost(),ct=costTot(),buffer=ct.m*(+S.bufferM||0);
  const rows=[['Aankoop finca',fc.koop],['Overdrachtsbelasting ('+(+S.finca.itp||0)+'%)',fc.itp],['Notaris, register, advocaat ('+(+S.finca.bij||0)+'%)',fc.bij],['Verbouwing',fc.verb],['Extra gastenhuisjes ('+(+S.huisjes.aantal||0)+'×)',fc.huisjes],['Overige eenmalige kosten',ct.e],['Buffer: '+(+S.bufferM||0)+' mnd vaste lasten',buffer]];
  return{rows,total:rows.reduce((a,r)=>a+r[1],0)}}
function lening(){const h=S.hypo;return h.use?(+S.finca.prijs||0)*(+h.ltv||0)/100:0}
function haveCalc(){const p=projection(0),ow=S.inclHouse?overwaarde():0,l=lening();return{rows:[['Spaargeld + beleggingen bij vertrek (prognose)',p.total],['Overwaarde huis NL',ow],['Spaanse hypotheek',l]],total:p.total+ow+l}}
function feas(){const n=needCalc().total;return n?Math.min(100,Math.round(haveCalc().total/n*100)):100}
function annuity(P,r,n){r=(+r||0)/100/12;n=Math.max(1,(+n||1)*12);return r?P*r/(1-Math.pow(1+r,-n)):P/n}
const divNet=()=>(+S.divi||0)*(1-(+S.divtax||0)/100);
function taxScale(b,sc){let t=0,prev=0;for(const[lim,r]of sc){if(b>prev)t+=(Math.min(b,lim)-prev)*r;prev=lim}return t}
const GEN=[[12450,.19],[20200,.24],[35200,.30],[60000,.37],[300000,.45],[1e12,.47]],SAV=[[6000,.19],[50000,.21],[200000,.23],[300000,.27],[1e12,.30]];
function taxCalc(){const s=bnbSeason(),n=Math.max(1,+S.tax.personen||1),winst=s.omzet*(1-S.bnb.kost/100),aut=(+S.tax.autonomo||0)*12;
  const base=Math.max(0,winst/n-aut),gen=Math.max(0,taxScale(base,GEN)-taxScale(Math.min(base,5550),GEN)),sav=taxScale((+S.divi||0)*12/n,SAV),tot=(gen+sav)*n;
  return{winst,aut:aut*n,gen:gen*n,sav:sav*n,tot,netPm:(winst-aut*n+(+S.divi||0)*12-tot)/12}}
function projYears(){const w=S.whatif;let dg=+S.acc.degiro||0;const r=(+w.rend||0)/100/12,d=new Date();d.setDate(1);const end=vertrek(),rows=[];
  while(d<end){d.setMonth(d.getMonth()+1);dg=dg*(1+r)+(+S.inleg.degiro||0);if(w.bonus&&d.getMonth()===11)dg+=2000;if(d.getMonth()===11&&d<end)rows.push(['Eind '+d.getFullYear(),dg])}
  rows.push(['Bij vertrek',dg]);return rows.map(([l,v])=>[l,v,v*((+w.yld||0)/100)/12])}
