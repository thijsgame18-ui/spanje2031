/* ---------- app-slot ---------- */
let LOCK=(()=>{try{return JSON.parse(localStorage.getItem('sp-lock')||'null')||{mode:'off',timeout:60}}catch(e){return{mode:'off',timeout:60}}})();
let locked=false,pinBuf='',lastHidden=0,lockSetup=null,pinFails=0;
function saveLock(){try{localStorage.setItem('sp-lock',JSON.stringify(LOCK))}catch(e){}}
function lockNow(){if(LOCK.mode==='off'||!isApp())return;locked=true;pinBuf='';$('lock').classList.add('on');renderLock();if(LOCK.mode==='device')setTimeout(()=>{try{Android.deviceAuth()}catch(e){}},300)}
function unlock(){locked=false;pinFails=0;$('lock').classList.remove('on')}
function renderLock(msg){const L=$('lock');if(LOCK.mode==='device'){L.innerHTML=`<div class="lockbox"><h2>Spanje 2031</h2><p>De app is vergrendeld</p><button class="btn" style="background:#fff;color:#0b2a66;margin-top:12px" data-act="devauth">Ontgrendelen</button><div class="err" style="color:#ffd0cc">${esc(msg||'')}</div></div>`;return}
  L.innerHTML=`<div class="lockbox"><h2>Pincode</h2><div class="pins">${Array.from({length:LOCK.len||4},(_,i)=>`<i class="${i<pinBuf.length?'on':''}"></i>`).join('')}</div><div class="err" style="color:#ffd0cc">${esc(msg||'')}</div><div class="pad">${[1,2,3,4,5,6,7,8,9,'',0,'⌫'].map(k=>k===''?'<span></span>':`<button data-act="pin" data-id="${k}" aria-label="${k==='⌫'?'Wissen':k}">${k}</button>`).join('')}</div><button class="btn sm ghost" style="color:#fff;border-color:#fff6;margin-top:16px" data-act="pinforgot">Pincode vergeten?</button></div>`}
function pinKey(k){if(k==='⌫'){pinBuf=pinBuf.slice(0,-1);renderLock();return}const n=LOCK.len||4;if(pinBuf.length>=n)return;pinBuf+=k;
  if(pinBuf.length===n){let ok=false;try{ok=Android.hash(pinBuf,LOCK.salt)===LOCK.hash}catch(e){}pinBuf='';if(ok){unlock();return}pinFails++;if(pinFails>=10){LOCK={mode:'off',timeout:60};saveLock();unlock();doLogout();return}renderLock('Onjuiste pincode'+(pinFails>=5?` (nog ${10-pinFails} pogingen)`:''));return}renderLock()}
window.onDeviceAuth=ok=>{if(lockSetup==='device'){lockSetup=null;if(ok){LOCK.mode='device';saveLock();try{Android.setSecure(true)}catch(e){}toast('Vergrendeling staat aan');render()}else toast('Niet gelukt');return}if(ok)unlock();else renderLock('Niet ontgrendeld, probeer opnieuw.')};
window.appPause=()=>{lastHidden=Date.now()};
function setLock(m){if(m==='off'){LOCK.mode='off';saveLock();try{Android.setSecure(false)}catch(e){}render();toast('Vergrendeling uit');return}
  if(m==='device'){let ok=false;try{ok=Android.deviceSecure()}catch(e){}if(!ok){toast('Stel eerst een schermvergrendeling in op je telefoon');return}lockSetup='device';try{Android.deviceAuth()}catch(e){lockSetup=null}return}
  openSheet(`<h3>Pincode instellen</h3><div class="f" style="margin-top:10px"><label>Kies een pincode (4–6 cijfers)</label><input type="password" inputmode="numeric" id="pn1" maxlength="6"></div><div class="f" style="margin-top:10px"><label>Herhaal</label><input type="password" inputmode="numeric" id="pn2" maxlength="6"></div><div class="err" id="pnErr"></div><div class="actions"><button class="btn ghost" data-act="close">Annuleren</button><button class="btn" data-act="savepin">Opslaan</button></div>`)}
function savePin(){const a=val('pn1'),b=val('pn2');if(!/^\d{4,6}$/.test(a)){$('pnErr').textContent='Gebruik 4 tot 6 cijfers.';return}if(a!==b){$('pnErr').textContent='De pincodes zijn niet gelijk.';return}
  LOCK.salt=Android.randomSalt();LOCK.hash=Android.hash(a,LOCK.salt);LOCK.len=a.length;LOCK.mode='pin';saveLock();try{Android.setSecure(true)}catch(e){}closeSheet();render();toast('Pincode ingesteld')}

/* ---------- maandherinnering ---------- */
function scheduleMonthly(){if(!isApp()||!Android.schedule)return;let on=true;try{on=localStorage.getItem('sp-remind')!=='0'}catch(e){}
  for(let i=0;i<3;i++){const id=9100+i;try{Android.cancel(id)}catch(e){}if(!on)continue;const d=new Date();d.setDate(25);d.setHours(19,0,0,0);d.setMonth(d.getMonth()+i);if(d<=new Date())d.setMonth(d.getMonth()+3);
    try{Android.schedule(id,d.getTime(),'Spanje 2031','Tijd om de spaarbedragen bij te werken')}catch(e){}}}

/* ---------- back-up ---------- */
function exportData(){const name='spanje2031-backup-'+today()+'.json',txt=JSON.stringify({app:'spanje2031',date:new Date().toISOString(),S},null,1);
  if(isApp()&&Android.saveFile){window.onFileSaved=ok=>toast(ok?'Back-up opgeslagen':'Niet opgeslagen');try{Android.saveFile(name,txt);return}catch(e){}}
  const a=document.createElement('a');a.href=URL.createObjectURL(new Blob([txt],{type:'application/json'}));a.download=name;document.body.appendChild(a);a.click();a.remove()}
let BK=null;
function importData(){const i=document.createElement('input');i.type='file';i.accept='.json,application/json,text/plain';i.onchange=async()=>{try{const d=JSON.parse(await i.files[0].text());if(!d||d.app!=='spanje2031'||!d.S)throw 0;BK=d.S;
  openSheet(`<h3>Back-up terugzetten?</h3><p>Back-up van ${esc(new Date(d.date).toLocaleString('nl-NL'))}. Dit vervangt de huidige gegevens${SB.hid?', ook op de telefoon van je partner':''}.</p><div class="actions"><button class="btn ghost" data-act="close">Annuleren</button><button class="btn" data-act="restore">Terugzetten</button></div>`)}catch(e){toast('Dit is geen geldige back-up')}};i.click()}

/* ---------- bezichtigingschecklist ---------- */
const CHECKS=[['water','Water: aansluiting of eigen put, en is er genoeg?'],['stroom','Stroom: netaansluiting of zonnepanelen'],['weg','Toegangsweg: verhard en het hele jaar bereikbaar'],['legaal','Woning legaal: escritura en kadaster (catastro) kloppen met wat er staat'],['nota','Nota simple: geen schulden of beslag op de woning'],['bouw','Mogen we extra huisjes bouwen (bestemming / vergunning)?'],['staat','Bouwkundige staat: dak, vocht, fundering'],['inet','Internet en mobiel bereik'],['dorp','Afstand tot dorp, supermarkt en dokter'],['toer','Toeristische vergunning mogelijk in deze gemeente?']];
function editFinca(id){const x=id?S.fincas.find(f=>f.id===id):{};draft={id:x.id||'f'+uid(),foto:x.foto||null,nw:!id};const ck=x.check||{};
  openSheet(`<h3>${id?'Finca':'Finca toevoegen'}</h3>${['naam:Naam / omschrijving','regio:Regio of plaats','url:Link (Idealista, Kyero…)'].map(s=>{const[k,l]=s.split(':');return `<div class="f" style="margin-top:10px"><label>${l}</label><input type="text" id="fi_${k}" value="${esc(x[k]||'')}"></div>`}).join('')}
  <div class="row" style="margin-top:10px"><div class="f"><label>Prijs (€)</label><input type="number" id="fi_prijs" value="${x.prijs||''}"></div><div class="f"><label>Grond (m²)</label><input type="number" id="fi_grond" value="${x.grond||''}"></div><div class="f"><label>Status</label><select id="fi_status">${['Interessant','Bezichtigd','Favoriet','Afgevallen'].map(s=>`<option ${x.status===s?'selected':''}>${s}</option>`).join('')}</select></div></div>
  <div class="f" style="margin-top:10px"><label>Notities</label><textarea id="fi_note">${esc(x.note||'')}</textarea></div>${x.url?`<p><a href="${esc(x.url)}">Advertentie openen</a></p>`:''}
  <h3 style="margin-top:16px">Bezichtigingschecklist</h3><ul class="list">${CHECKS.map(([k,l])=>`<li><input type="checkbox" id="ck_${k}" ${ck[k]?'checked':''}><label for="ck_${k}" style="flex:1">${l}</label></li>`).join('')}</ul>
  <div id="fiFoto">${x.foto?`<img data-img="${x.foto}" class="ph" style="width:120px" alt="">`:''}</div><button class="btn ghost" style="margin-top:8px" data-act="fincafoto">Foto kiezen</button>
  ${id&&x.prijs?`<button class="btn ghost" style="margin-top:8px" data-act="usefinca" data-id="${id}">Gebruik deze prijs in het budget</button>`:''}
  <div class="actions">${id?`<button class="btn red" data-act="delfinca" data-id="${id}">Verwijderen</button>`:''}<button class="btn ghost" data-act="close">Annuleren</button><button class="btn" data-act="savefinca">Opslaan</button></div>`);loadImgs()}
