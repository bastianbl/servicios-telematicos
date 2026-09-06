# Justificación de parámetros SOA

La zona DNS utiliza los siguientes parámetros:

- Refresh: 3600 segundos. El servidor esclavo consulta aproximadamente cada hora si existen cambios en la zona.
- Retry: 900 segundos. Si el esclavo no logra comunicarse con el maestro, vuelve a intentarlo después de 15 minutos.
- Expiry: 604800 segundos. El esclavo puede conservar la zona durante siete días sin contactar al maestro antes de considerarla expirada.
- Minimum: 86400 segundos. Se utiliza un valor de 24 horas como referencia de TTL negativo para respuestas de nombres inexistentes.

El serial utiliza el formato AAAAMMDDNN. Durante las pruebas de sincronización, NOTIFY e IXFR se incrementó hasta 2026090504.
