#!/bin/bash

URL="http://parcial.empresa.local"

DEF="/etc/apache2/mods-available/deflate.conf"
BRO="/etc/apache2/mods-available/brotli.conf"

OUT="/vagrant/entrega-parcial/parte2-apache/resultados/resultados.csv"

ARCHIVOS=(
"index.html"
"estilos.css"
"estilos.min.css"
"app.js"
"datos.json"
"grafico.svg"
"lorem.txt"
"imagen.png"
"paquete.zip"
)

echo "archivo,algoritmo,nivel,tamano_bytes,tiempo_segundos" > "$OUT"

medir() {
    archivo="$1"
    encoding="$2"
    algoritmo="$3"
    nivel="$4"

    resultado=$(curl -s \
        -H "Accept-Encoding: $encoding" \
        -o /dev/null \
        -w "%{size_download},%{time_total}" \
        "$URL/$archivo")

    echo "$archivo,$algoritmo,$nivel,$resultado" >> "$OUT"
}

echo "=== LINEA BASE ==="

for archivo in "${ARCHIVOS[@]}"; do
    medir "$archivo" "identity" "identity" "0"
done

echo "=== GZIP NIVEL 1 ==="

sudo sed -i -E 's/DeflateCompressionLevel [0-9]+/DeflateCompressionLevel 1/' "$DEF"
sudo systemctl reload apache2
sleep 1

for archivo in "${ARCHIVOS[@]}"; do
    medir "$archivo" "gzip" "gzip" "1"
done

echo "=== GZIP NIVEL 6 ==="

sudo sed -i -E 's/DeflateCompressionLevel [0-9]+/DeflateCompressionLevel 6/' "$DEF"
sudo systemctl reload apache2
sleep 1

for archivo in "${ARCHIVOS[@]}"; do
    medir "$archivo" "gzip" "gzip" "6"
done

echo "=== GZIP NIVEL 9 ==="

sudo sed -i -E 's/DeflateCompressionLevel [0-9]+/DeflateCompressionLevel 9/' "$DEF"
sudo systemctl reload apache2
sleep 1

for archivo in "${ARCHIVOS[@]}"; do
    medir "$archivo" "gzip" "gzip" "9"
done

echo "=== BROTLI CALIDAD 5 ==="

sudo sed -i -E 's/BrotliCompressionQuality [0-9]+/BrotliCompressionQuality 5/' "$BRO"
sudo systemctl reload apache2
sleep 1

for archivo in "${ARCHIVOS[@]}"; do
    medir "$archivo" "br" "brotli" "5"
done

echo "=== BROTLI CALIDAD 11 ==="

sudo sed -i -E 's/BrotliCompressionQuality [0-9]+/BrotliCompressionQuality 11/' "$BRO"
sudo systemctl reload apache2
sleep 1

for archivo in "${ARCHIVOS[@]}"; do
    medir "$archivo" "br" "brotli" "11"
done

echo ""
echo "Mediciones terminadas."
echo "Resultados:"
echo "$OUT"
