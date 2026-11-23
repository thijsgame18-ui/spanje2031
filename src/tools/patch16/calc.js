/* ---------- scenario's ---------- */
let SCN=null;
const SCEN_DEF={somber:{bez:-15,prijs:-10,rend:3,fin:15,hypo:false,infl:3},goed:{bez:10,prijs:10,rend:8,fin:-10,hypo:true,infl:1.5}};
const SCN_L={somber:'Somber',normaal:'Normaal',goed:'Goed'};
function scKey(){return SCN||(S.scen&&S.scen.cur)||'normaal'}
function sc(){const k=scKey();if(k==='normaal')return{bez:0,prijs:0,rend:+S.whatif.rend||0,fin:0,hypo:!!S.hypo.use,infl:+(S.finca.infl??2)||0};const d=Object.assign({},SCEN_DEF[k],(S.scen||{})[k]||{});return{bez:+d.bez||0,prijs:+d.prijs||0,rend:+d.rend||0,fin:+d.fin||0,hypo:!!d.hypo,infl:+d.infl||0}}
function withScen(k,fn){const o=SCN;SCN=k;try{return fn()}finally{SCN=o}}
const inflF=()=>Math.pow(1+sc().infl/100,Math.max(0,(vertrek()-new Date())/(365.25*864e5)));
function bnbSeason(){const dim=[31,28,31,30,31,30,31,31,30,31,30,31],p=sc();const m=S.season.map((s,i)=>s.open?S.bnb.kamers*(+s.prijs||0)*(1+p.prijs/100)*(Math.max(0,Math.min(100,(+s.bez||0)+p.bez))/100)*dim[i]:0);const omzet=m.reduce((a,b)=>a+b,0);return{m,omzet,pm:omzet*(1-S.bnb.kost/100)/12}}
function projection(extra){const w=S.whatif,dr=S.derisk||{};let ing=+S.acc.ing||0,dg=+S.acc.degiro||0,safe=0;const r=sc().rend/100/12,rs=(+dr.rente||0)/100/12,d=new Date();d.setDate(1);const end=vertrek();
  while(d<end){d.setMonth(d.getMonth()+1);ing+=+S.inleg.ing||0;safe*=1+rs;dg=dg*(1+r)+(+S.inleg.degiro||0)+(+extra||0);if(w.bonus&&d.getMonth()===11)dg+=2000;
    if(dr.on&&d.getMonth()===0&&d.getFullYear()>=(+dr.start||2029)){const mv=dg*(+dr.pct||0)/100;dg-=mv;safe+=mv}}
  return{ing,dg,safe,total:ing+dg+safe,div:dg*((+w.yld||0)/100)/12}}
function projYears(){const w=S.whatif,dr=S.derisk||{};let dg=+S.acc.degiro||0,safe=0;const r=sc().rend/100/12,rs=(+dr.rente||0)/100/12,d=new Date();d.setDate(1);const end=vertrek(),rows=[];
  while(d<end){d.setMonth(d.getMonth()+1);safe*=1+rs;dg=dg*(1+r)+(+S.inleg.degiro||0);if(w.bonus&&d.getMonth()===11)dg+=2000;if(dr.on&&d.getMonth()===0&&d.getFullYear()>=(+dr.start||2029)){const mv=dg*(+dr.pct||0)/100;dg-=mv;safe+=mv}if(d.getMonth()===11&&d<end)rows.push(['Eind '+d.getFullYear(),dg,safe])}
  rows.push(['Bij vertrek',dg,safe]);return rows.map(([l,v,sf])=>[l,v,v*((+w.yld||0)/100)/12,sf])}
function fincaCost(){const f=S.finca,F=1+sc().fin/100,k=(+f.prijs||0)*F;return{koop:k,itp:k*(+f.itp||0)/100,bij:k*(+f.bij||0)/100,verb:(+f.verb||0)*F,huisjes:(+S.huisjes.aantal||0)*(+S.huisjes.kosten||0)}}
function lening(){const h=S.hypo;return sc().hypo?fincaCost().koop*(+h.ltv||0)/100:0}
const housePlan=()=>S.house.plan||'verkopen';
function huurNet(){const h=S.house;return (+(h.huur??1800)||0)*(1-(+(h.huurKost??25)||0)/100)-(+(h.hypoLast??1500)||0)}
function haveCalc(){const p=projection(0),ow=S.inclHouse&&housePlan()==='verkopen'?overwaarde():0,l=lening(),keep=+((S.cf||{}).dgKeep)||0;
  const rows=[['Spaargeld + beleggingen bij vertrek (prognose)',p.total],['Overwaarde huis NL',ow],['Spaanse hypotheek',l]];if(keep)rows.push(['Blijft belegd voor dividend',-keep]);
  return{rows,total:p.total+ow+l-keep}}
function maxFinca(){const keep=S.finca.prijs;let lo=0,hi=3e6;for(let i=0;i<40;i++){const mid=(lo+hi)/2;S.finca.prijs=mid;if(haveCalc().total>=needCalc().total)lo=mid;else hi=mid}S.finca.prijs=keep;return lo/(1+sc().fin/100)}
/* ---------- spaartempo ---------- */
function pace(){const h=S.hist.slice().sort((a,b)=>a.d<b.d?-1:1),f=h[0];const tot=total(),ml=monthsLeft();
  const needExtra=Math.max(0,needCalc().total-haveCalc().total)/ml,goalExtra=Math.max(0,goalT()-projection(0).total)/ml;
  let plan=null;if(f){const t0=new Date(f.d).getTime(),t1=vertrek().getTime(),k=Math.max(0,Math.min(1,(Date.now()-t0)/(t1-t0)));plan=f.t+(goalT()-f.t)*k}
  return{needExtra,goalExtra,plan,diff:plan==null?0:tot-plan,inleg:(+S.inleg.ing||0)+(+S.inleg.degiro||0)}}
/* ---------- kasstroom ---------- */
function cashflow(){const cf=Object.assign({ramp:[30,60,90,100,100],extra:0,dgKeep:0},S.cf||{}),nd=needCalc(),hv=haveCalc(),ct=costTot(),tx=taxCalc(),bs=bnbSeason();
  const bufRow=nd.rows.find(r=>r[0].startsWith('Buffer')),purchase=nd.total-(bufRow?bufRow[1]:0);let cash=hv.total-purchase;
  const bnbNet=bs.omzet*(1-S.bnb.kost/100),effTax=bnbNet?tx.gen/Math.max(1,bnbNet):0,loan=lening(),hypoY=loan?annuity(loan,S.hypo.rente,S.hypo.jaren)*12:0;
  const divY=(+cf.dgKeep||0)*((+S.whatif.yld||0)/100)*(1-(+S.divtax||0)/100),huurY=housePlan()==='verhuren'?huurNet()*12:0,autY=tx.aut,startY=vertrek().getFullYear(),rows=[];let broke=null;
  for(let i=0;i<5;i++){const r=(+cf.ramp[i]||0)/100,bnb=bnbNet*r*(1-effTax),inc=bnb+divY+huurY+(+cf.extra||0)*12,out=ct.m*12+hypoY+autY,start=cash;cash=cash+inc-out;rows.push({y:startY+i,start,bnb,div:divY,huur:huurY,extra:(+cf.extra||0)*12,inc,out,end:cash});if(cash<0&&broke==null)broke=startY+i}
  const burn=ct.m+hypoY/12+autY/12;return{rows,broke,start:hv.total-purchase,burn,runway:burn?Math.max(0,(hv.total-purchase)/burn):Infinity}}
