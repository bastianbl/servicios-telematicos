# Parte 3 — Publicación mediante Cloudflare Tunnel

## Verificar Apache

sudo systemctl status apache2 --no-pager

## Verificar página personalizada localmente

curl http://parcial.empresa.local/pagina_personalizada.html

## Iniciar Cloudflare Tunnel

cloudflared tunnel --url http://localhost:80

El comando genera una URL pública temporal similar a:

https://xxxxxxxx.trycloudflare.com

## Acceso remoto

Desde un dispositivo conectado a otra red, por ejemplo datos móviles, abrir:

https://URL_PUBLICA/pagina_personalizada.html

## Verificar compresión a través del túnel

curl -s -H 'Accept-Encoding: br,gzip' -I \
https://URL_PUBLICA/app.js | grep -i content-encoding

La respuesta debe mostrar:

Content-Encoding: br

o:

Content-Encoding: gzip

## Finalizar el túnel

Presionar:

Ctrl + C
