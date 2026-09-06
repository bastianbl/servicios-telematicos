# Parte 2 — Apache y compresión

## Verificar Apache

sudo systemctl status apache2 --no-pager

## Verificar resolución DNS

dig @192.168.50.3 parcial.empresa.local A +short

## Probar sitio web

curl http://parcial.empresa.local

## Verificar módulos

apache2ctl -M | grep -E 'deflate|brotli|filter'

## Línea base sin compresión

curl -s -H 'Accept-Encoding: identity' -o /dev/null \
-w 'sin=%{size_download}B t=%{time_total}s\n' \
http://parcial.empresa.local/app.js

## gzip

curl -s -H 'Accept-Encoding: gzip' -o /dev/null \
-w 'gzip=%{size_download}B t=%{time_total}s\n' \
http://parcial.empresa.local/app.js

## Brotli

curl -s -H 'Accept-Encoding: br' -o /dev/null \
-w 'brotli=%{size_download}B t=%{time_total}s\n' \
http://parcial.empresa.local/app.js

## Verificar Content-Encoding

curl -s -H 'Accept-Encoding: br,gzip' -I \
http://parcial.empresa.local/app.js | grep -i content-encoding

## Ejecutar todas las mediciones

/vagrant/entrega-parcial/parte2-apache/scripts/mediciones.sh

## Generar tablas

python3 /vagrant/entrega-parcial/parte2-apache/scripts/generar_tablas.py

## Evidencia en navegador

Abrir:
http://parcial.empresa.local

Luego:
F12 -> Network -> seleccionar recurso -> Response Headers -> Content-Encoding

## Evidencia Wireshark

Capturar sobre la interfaz del host 192.168.50.1.

Filtro:
http && ip.addr == 192.168.50.3

Generar tráfico desde Windows:

curl.exe -H "Accept-Encoding: gzip" http://parcial.empresa.local/app.js -o NUL

En la respuesta HTTP verificar:

Content-Encoding: gzip
