#!/bin/bash
# gebruik: src/tools/release.sh "notitie 1" "notitie 2" ...
# Verhoog eerst versionCode/versionName in src/apk/apktool.yml.
# Nodig: /tmp/tools/apktool.jar, /tmp/tools/signer.jar en de sleutel in $SP_KEY (standaard /home/claude/spanje-key).
set -e
R=$(cd "$(dirname "$0")/../.." && pwd); K=${SP_KEY:-/home/claude/spanje-key}
python3 $R/src/tools/build.py
node -e "const s=require('fs').readFileSync('$R/index.html','utf8');const m=[...s.matchAll(/<script>([\s\S]*?)<\/script>/g)].pop()[1];new Function(m)" || { echo 'Release afgebroken: scriptfout'; exit 1; }
rm -rf /tmp/spout && java -jar /tmp/tools/apktool.jar b $R/src/apk -o /tmp/spout/unsigned.apk >/dev/null
(cd /tmp/spout && java -jar /tmp/tools/signer.jar -a unsigned.apk --ks $K/spanje.jks --ksAlias spanje --ksPass "$(cat $K/pass.txt)" --ksKeyPass "$(cat $K/pass.txt)" -o signed >/tmp/sp-sign.log 2>&1) || { cat /tmp/sp-sign.log; exit 1; }
cp /tmp/spout/signed/*.apk $R/Spanje2031.apk
VC=$(grep -o "versionCode: [0-9]*" $R/src/apk/apktool.yml | grep -o "[0-9]*")
VN=$(grep -o "versionName: '[^']*'" $R/src/apk/apktool.yml | cut -d"'" -f2)
python3 - "$R" "$VC" "$VN" "$@" <<'PY'
import json,sys
r,vc,vn,*notes=sys.argv[1:]
json.dump({"versionCode":int(vc),"versionName":vn,"notes":notes,"apk":f"https://raw.githubusercontent.com/thijsgame18-ui/spanje2031/main/Spanje2031.apk?v={vc}"},open(f'{r}/version.json','w'),ensure_ascii=False,indent=1)
PY
rm -rf $R/src/apk/assets/index.html
echo "built $VN ($VC) — commit en push nu"
