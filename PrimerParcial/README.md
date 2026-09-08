# Primer Parcial — Servicios Telemáticos
# Sebastian Bustamante - Santiago López - Byron Zapata
## Microproyecto integrador

Implementación de una infraestructura de servicios telemáticos compuesta por:

- DNS maestro/esclavo tolerante a fallos con BIND9.
- Transferencias de zona protegidas mediante TSIG.
- Resolución directa e inversa.
- NOTIFY, AXFR e IXFR.
- Hardening y auditoría DNS.
- Servidor Apache con compresión gzip y Brotli.
- Evaluación experimental de distintos niveles de compresión.
- Publicación temporal del servidor mediante Cloudflare Tunnel.

## Estructura del repositorio

### Parte 1 — DNS

Contiene:

- Configuración del servidor maestro.
- Configuración del servidor esclavo.
- Zona directa empresa.local.
- Zona inversa.
- Ejemplo de configuración TSIG sin publicar la clave secreta real.
- Comandos utilizados para validación y sustentación.

### Parte 2 — Apache y compresión

Contiene:

- Configuración de mod_deflate.
- Configuración de gzip niveles 1, 6 y 9.
- Configuración de mod_brotli.
- Configuración de Brotli calidades 5 y 11.
- VirtualHost de Apache.
- Sitio y archivos utilizados para las pruebas.
- Script automático de mediciones.
- Script para generación de tablas.
- Resultados en CSV y Markdown.
- Análisis crítico de los resultados.
- Comandos utilizados para las pruebas.

### Parte 3 — Cloudflare Tunnel

Contiene:

- Página personalizada del despliegue.
- Comandos para iniciar y comprobar Cloudflare Tunnel.
- Análisis de seguridad y medidas de mitigación.

## Infraestructura

- DNS maestro: 192.168.50.3
- DNS esclavo: 192.168.50.2
- Dominio DNS: empresa.local
- Sitio web: parcial.empresa.local

## Seguridad

La transferencia de zonas DNS se restringe mediante autenticación TSIG.

Por seguridad, la clave TSIG real utilizada durante la práctica no se publica en este repositorio. Se incluye un archivo de ejemplo con el valor del secreto oculto.

Los archivos binarios ya comprimidos, como PNG y ZIP, se excluyen de la compresión HTTP.

El túnel público se utiliza únicamente durante las pruebas y debe cerrarse al finalizar.

## Resultados

Las mediciones completas se encuentran en:

parte2-apache/resultados/

Se evaluaron:

- Sin compresión.
- gzip nivel 1.
- gzip nivel 6.
- gzip nivel 9.
- Brotli calidad 5.
- Brotli calidad 11.

Los resultados incluyen tamaño transferido, ratio de compresión, porcentaje de ahorro y tiempo de respuesta.

## Uso de herramientas de IA

Durante el desarrollo nos ayudamos de ChatGPT como herramienta de apoyo para la revisión de comandos, explicación y organización de los entregables.

Todas las configuraciones fueron ejecutadas y verificadas en el entorno virtual. Además, toda la información propuesta por la IA fue revisada por los integrantes del grupo.
