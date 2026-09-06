# Análisis crítico de los resultados de compresión

## 1. Brotli vs gzip

Las pruebas muestran que Brotli logró una mayor reducción de tamaño que gzip principalmente en los archivos de texto grandes.

Por ejemplo, en `app.js`, cuyo tamaño original fue de 558894 bytes, gzip nivel 9 lo redujo a 25294 bytes, mientras Brotli calidad 5 lo redujo a 8704 bytes.

En `estilos.css`, el archivo original tenía 303893 bytes. gzip nivel 9 produjo 12770 bytes, mientras Brotli calidad 5 produjo 4789 bytes.

También se observó una diferencia importante en `datos.json`: de 868896 bytes originales, gzip nivel 9 produjo 27704 bytes y Brotli calidad 11 produjo 10966 bytes.

Por lo tanto, para contenido de texto de tamaño considerable, Brotli presentó mejores ratios de compresión que gzip. En archivos muy pequeños, como `index.html` o `grafico.svg`, la diferencia existe pero su impacto real sobre el ancho de banda es mucho menor.

---

## 2. Niveles de compresión y rendimientos decrecientes

En gzip se observa que aumentar el nivel produce mejoras cada vez menores.

En `app.js`:

- gzip 1: 26604 bytes
- gzip 6: 25725 bytes
- gzip 9: 25294 bytes

La diferencia entre nivel 1 y nivel 6 es mayor que la diferencia entre nivel 6 y nivel 9. Esto demuestra rendimientos decrecientes.

En `estilos.css` ocurrió algo similar:

- gzip 1: 13459 bytes
- gzip 6: 12999 bytes
- gzip 9: 12770 bytes

En Brotli también se evidenció que una calidad más alta no necesariamente representa la mejor opción.

En `app.js`:

- Brotli 5: 8704 bytes y 0.207487 s
- Brotli 11: 8868 bytes y 0.852451 s

En este caso, Brotli 11 tardó mucho más y además produjo un archivo ligeramente más grande.

En `datos.json`, Brotli 11 sí logró una reducción adicional, pasando de 13802 bytes con calidad 5 a 10966 bytes con calidad 11, pero el tiempo aumentó de aproximadamente 0.21 s a 1.41 s.

Esto demuestra que niveles máximos pueden aumentar considerablemente el costo de procesamiento y no siempre justifican la pequeña reducción adicional obtenida.

---

## 3. Archivos que ya están comprimidos

Los resultados de `imagen.png` y `paquete.zip` muestran por qué no es conveniente aplicar nuevamente gzip o Brotli a este tipo de archivos.

Para `imagen.png`:

- Sin compresión: 1483 bytes
- gzip 1: 1483 bytes
- gzip 6: 1483 bytes
- gzip 9: 1483 bytes
- Brotli 5: 1483 bytes
- Brotli 11: 1483 bytes

Para `paquete.zip`:

- Sin compresión: 25869 bytes
- gzip 1: 25869 bytes
- gzip 6: 25869 bytes
- gzip 9: 25869 bytes
- Brotli 5: 25869 bytes
- Brotli 11: 25869 bytes

No existió ninguna reducción porque estos formatos ya utilizan mecanismos de compresión propios. Aplicar nuevamente compresión solo consumiría recursos del servidor sin generar ahorro de ancho de banda.

Por esta razón fueron excluidos de la compresión mediante la configuración de Apache.

---

## 4. Impacto en CPU y ancho de banda

La compresión permite reducir considerablemente el ancho de banda utilizado, especialmente en archivos de texto grandes.

Por ejemplo, `app.js` pasó de 558894 bytes a 8704 bytes con Brotli calidad 5, lo que representa un ahorro superior al 98%.

Sin embargo, una compresión más agresiva también puede aumentar el tiempo de procesamiento.

Esto fue especialmente visible con Brotli calidad 11. En `datos.json`, el tiempo aumentó hasta aproximadamente 1.41 segundos, mientras Brotli calidad 5 tardó aproximadamente 0.21 segundos.

En un servidor con pocas solicitudes este aumento puede ser aceptable, pero con una alta cantidad de usuarios simultáneos puede aumentar el consumo de CPU y reducir la capacidad del servidor para responder rápidamente.

Por lo tanto, se debe buscar un equilibrio entre ahorro de ancho de banda y costo de procesamiento.

---

## 5. Contenido estático vs contenido dinámico y recomendación para producción

Para contenido estático que cambia muy poco, como archivos JavaScript, CSS o recursos grandes, puede ser conveniente realizar una precompresión y almacenar versiones comprimidas en disco. De esta forma el servidor no necesita realizar el proceso de compresión en cada solicitud.

Los niveles máximos, como Brotli 11, podrían ser utilizados durante una precompresión porque el procesamiento se realiza una sola vez y no durante cada petición del usuario.

Para contenido dinámico o generado frecuentemente, resulta más conveniente utilizar compresión al vuelo con niveles intermedios.

Según las mediciones realizadas, una configuración razonable para producción sería utilizar gzip nivel 6 como opción ampliamente compatible y Brotli calidad 5 cuando el cliente lo soporte.

Los resultados muestran que Brotli calidad 5 logró ratios de compresión muy buenos manteniendo tiempos cercanos a la línea base, mientras Brotli calidad 11 aumentó considerablemente el tiempo de procesamiento en archivos grandes.

Los formatos que ya se encuentran comprimidos, como PNG y ZIP, deben mantenerse excluidos.
