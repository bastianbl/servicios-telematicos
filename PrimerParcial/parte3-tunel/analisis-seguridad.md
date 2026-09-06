# Análisis de seguridad del túnel público

Al utilizar Cloudflare Tunnel, el servidor web local queda accesible desde Internet mediante una URL pública. Esto facilita el acceso remoto sin abrir directamente puertos del router, pero también aumenta la superficie de exposición del servicio.

Uno de los principales riesgos es que cualquier persona que conozca la URL pública podría intentar acceder al sitio si no existe autenticación. Además, mantener un túnel activo innecesariamente aumenta el tiempo durante el cual el servicio está expuesto.

Como medidas de mitigación se pueden aplicar:

1. Utilizar autenticación para impedir el acceso de usuarios no autorizados.
2. Restringir el acceso únicamente a direcciones IP o usuarios autorizados cuando sea posible.
3. Apagar el túnel inmediatamente después de terminar las pruebas.
4. No publicar mediante el túnel información sensible ni servicios que no sean necesarios.

Durante esta práctica el túnel se utiliza únicamente de forma temporal para demostrar el acceso remoto y se cierra al terminar la prueba.

## Limitaciones del servicio

También existe dependencia de las condiciones y limitaciones del servicio gratuito utilizado para crear el túnel. La disponibilidad, duración de las sesiones y características del servicio pueden variar, por lo que este tipo de túnel se utiliza únicamente para pruebas y no como reemplazo de una solución permanente de publicación.
