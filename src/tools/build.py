#!/usr/bin/env python3
"""Bouwt index.html (webversie) en apk/assets/index.html uit src/spanje.html."""
import re, os, subprocess, sys
R = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
src = open(f'{R}/src/spanje.html').read()
yml = open(f'{R}/src/apk/apktool.yml').read()
vn = re.search(r"versionName: '([^']+)'", yml).group(1)
lib_path = '/tmp/sbjs/package/dist/umd/supabase.js'
if not os.path.exists(lib_path):
    os.makedirs('/tmp/sbjs', exist_ok=True)
    subprocess.run('cd /tmp/sbjs && npm pack @supabase/supabase-js@2.45.4 --silent && tar xzf supabase-supabase-js-2.45.4.tgz', shell=True, check=True)
lib = open(lib_path).read().replace('</script', '<\\/script')
s = src.replace('__APP_VN__', vn)
i = s.index('<script>\n/* ---------- helpers')
s = s[:i] + '<script>' + lib + '</script>\n' + s[i:]
csp = ('<meta http-equiv="Content-Security-Policy" content="default-src \'none\'; script-src \'self\' \'unsafe-inline\'; '
       'style-src \'unsafe-inline\' https://fonts.googleapis.com; font-src https://fonts.gstatic.com; img-src data: blob:; '
       'connect-src https://wnircustmcvwjlkvtyur.supabase.co wss://wnircustmcvwjlkvtyur.supabase.co https://raw.githubusercontent.com; '
       'form-action \'none\'; base-uri \'none\'">')
s = s.replace('<meta charset="utf-8">', '<meta charset="utf-8">\n' + csp, 1)
os.makedirs(f'{R}/src/apk/assets', exist_ok=True)
open(f'{R}/src/apk/assets/index.html', 'w').write(s)
open(f'{R}/index.html', 'w').write(s)
print('built', vn, len(s))
