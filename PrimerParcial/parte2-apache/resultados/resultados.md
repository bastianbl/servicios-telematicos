# Resultados de compresión Apache

Comparación experimental de contenido sin compresión, gzip niveles 1, 6 y 9, y Brotli calidades 5 y 11.

## index.html

**Tamaño original:** 283 bytes

| Algoritmo | Nivel | Tamaño (B) | Ratio | Ahorro (%) | Tiempo (s) |
|---|---:|---:|---:|---:|---:|
| identity | 0 | 283 | 1.0000 | 0.00 | 0.207274 |
| gzip | 1 | 206 | 0.7279 | 27.21 | 0.203755 |
| gzip | 6 | 204 | 0.7208 | 27.92 | 0.204407 |
| gzip | 9 | 204 | 0.7208 | 27.92 | 0.202846 |
| brotli | 5 | 154 | 0.5442 | 45.58 | 0.205373 |
| brotli | 11 | 156 | 0.5512 | 44.88 | 0.207589 |

## estilos.css

**Tamaño original:** 303893 bytes

| Algoritmo | Nivel | Tamaño (B) | Ratio | Ahorro (%) | Tiempo (s) |
|---|---:|---:|---:|---:|---:|
| identity | 0 | 303893 | 1.0000 | 0.00 | 0.203641 |
| gzip | 1 | 13459 | 0.0443 | 95.57 | 0.207445 |
| gzip | 6 | 12999 | 0.0428 | 95.72 | 0.205817 |
| gzip | 9 | 12770 | 0.0420 | 95.80 | 0.205257 |
| brotli | 5 | 4789 | 0.0158 | 98.42 | 0.205673 |
| brotli | 11 | 5704 | 0.0188 | 98.12 | 0.560083 |

## estilos.min.css

**Tamaño original:** 258893 bytes

| Algoritmo | Nivel | Tamaño (B) | Ratio | Ahorro (%) | Tiempo (s) |
|---|---:|---:|---:|---:|---:|
| identity | 0 | 258893 | 1.0000 | 0.00 | 0.202530 |
| gzip | 1 | 13797 | 0.0533 | 94.67 | 0.205335 |
| gzip | 6 | 13445 | 0.0519 | 94.81 | 0.207662 |
| gzip | 9 | 13185 | 0.0509 | 94.91 | 0.206137 |
| brotli | 5 | 5686 | 0.0220 | 97.80 | 0.206393 |
| brotli | 11 | 5694 | 0.0220 | 97.80 | 0.465298 |

## app.js

**Tamaño original:** 558894 bytes

| Algoritmo | Nivel | Tamaño (B) | Ratio | Ahorro (%) | Tiempo (s) |
|---|---:|---:|---:|---:|---:|
| identity | 0 | 558894 | 1.0000 | 0.00 | 0.206828 |
| gzip | 1 | 26604 | 0.0476 | 95.24 | 0.204277 |
| gzip | 6 | 25725 | 0.0460 | 95.40 | 0.208988 |
| gzip | 9 | 25294 | 0.0453 | 95.47 | 0.211020 |
| brotli | 5 | 8704 | 0.0156 | 98.44 | 0.205963 |
| brotli | 11 | 8868 | 0.0159 | 98.41 | 0.872240 |

## datos.json

**Tamaño original:** 868896 bytes

| Algoritmo | Nivel | Tamaño (B) | Ratio | Ahorro (%) | Tiempo (s) |
|---|---:|---:|---:|---:|---:|
| identity | 0 | 868896 | 1.0000 | 0.00 | 0.205475 |
| gzip | 1 | 29520 | 0.0340 | 96.60 | 0.207944 |
| gzip | 6 | 28249 | 0.0325 | 96.75 | 0.206943 |
| gzip | 9 | 27704 | 0.0319 | 96.81 | 0.211402 |
| brotli | 5 | 13802 | 0.0159 | 98.41 | 0.208026 |
| brotli | 11 | 10966 | 0.0126 | 98.74 | 1.434141 |

## grafico.svg

**Tamaño original:** 222 bytes

| Algoritmo | Nivel | Tamaño (B) | Ratio | Ahorro (%) | Tiempo (s) |
|---|---:|---:|---:|---:|---:|
| identity | 0 | 222 | 1.0000 | 0.00 | 0.202930 |
| gzip | 1 | 173 | 0.7793 | 22.07 | 0.207851 |
| gzip | 6 | 172 | 0.7748 | 22.52 | 0.205439 |
| gzip | 9 | 172 | 0.7748 | 22.52 | 0.204881 |
| brotli | 5 | 144 | 0.6486 | 35.14 | 0.202544 |
| brotli | 11 | 146 | 0.6577 | 34.23 | 0.210230 |

## lorem.txt

**Tamaño original:** 8500000 bytes

| Algoritmo | Nivel | Tamaño (B) | Ratio | Ahorro (%) | Tiempo (s) |
|---|---:|---:|---:|---:|---:|
| identity | 0 | 8500000 | 1.0000 | 0.00 | 0.228326 |
| gzip | 1 | 61920 | 0.0073 | 99.27 | 0.227224 |
| gzip | 6 | 28950 | 0.0034 | 99.66 | 0.233195 |
| gzip | 9 | 28950 | 0.0034 | 99.66 | 0.233842 |
| brotli | 5 | 185 | 0.0000 | 100.00 | 0.212292 |
| brotli | 11 | 95 | 0.0000 | 100.00 | 0.328224 |

## imagen.png

**Tamaño original:** 1483 bytes

| Algoritmo | Nivel | Tamaño (B) | Ratio | Ahorro (%) | Tiempo (s) |
|---|---:|---:|---:|---:|---:|
| identity | 0 | 1483 | 1.0000 | 0.00 | 0.202586 |
| gzip | 1 | 1483 | 1.0000 | 0.00 | 0.210705 |
| gzip | 6 | 1483 | 1.0000 | 0.00 | 0.202214 |
| gzip | 9 | 1483 | 1.0000 | 0.00 | 0.210609 |
| brotli | 5 | 1483 | 1.0000 | 0.00 | 0.203727 |
| brotli | 11 | 1483 | 1.0000 | 0.00 | 0.203017 |

## paquete.zip

**Tamaño original:** 25869 bytes

| Algoritmo | Nivel | Tamaño (B) | Ratio | Ahorro (%) | Tiempo (s) |
|---|---:|---:|---:|---:|---:|
| identity | 0 | 25869 | 1.0000 | 0.00 | 0.205156 |
| gzip | 1 | 25869 | 1.0000 | 0.00 | 0.207558 |
| gzip | 6 | 25869 | 1.0000 | 0.00 | 0.204358 |
| gzip | 9 | 25869 | 1.0000 | 0.00 | 0.203519 |
| brotli | 5 | 25869 | 1.0000 | 0.00 | 0.203609 |
| brotli | 11 | 25869 | 1.0000 | 0.00 | 0.202275 |

