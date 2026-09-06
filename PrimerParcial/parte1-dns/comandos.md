# Parte 1 — DNS Maestro/Esclavo

## Validación de configuración

### Maestro

sudo named-checkconf /etc/bind/named.conf
sudo named-checkzone empresa.local /etc/bind/db.empresa.local
sudo named-checkzone 50.168.192.in-addr.arpa /etc/bind/db.192.168.50
sudo systemctl restart bind9
sudo systemctl status bind9 --no-pager

### Resolución DNS

### Registro A

dig @192.168.50.3 www.empresa.local A +short
dig @192.168.50.2 www.empresa.local A +short

### Registro AAAA

dig @192.168.50.3 www.empresa.local AAAA +short
dig @192.168.50.2 www.empresa.local AAAA +short

### CNAME

dig @192.168.50.3 ftp.empresa.local CNAME +short

### MX 

dig @192.168.50.3 empresa.local MX +short

### Resolución inversa PTR

dig @192.168.50.3 -x 192.168.50.3 +short
dig @192.168.50.2 -x 192.168.50.3 +short

### Trasnferencia segura de zona con TSIG

### AXFR autenticado

dig @192.168.50.3 empresa.local AXFR \
-k /etc/bind/keys/esclavo.key

### AXFR sin clave 

dig @192.168.50.3 empresa.local AXFR


### Verificación de sincronización 

### Consultar serial en el maestro 

dig @192.168.50.3 empresa.local SOA +short

### Consultar serial en el esclavo 

dig @192.168.50.2 empresa.local SOA +short

### Prueba IXFR 

sudo named-checkzone empresa.local /etc/bind/db.empresa.local
sudo rndc reload empresa.local

dig @192.168.50.2 ixfrtest.empresa.local A +short
dig @192.168.50.2 empresa.local SOA +short

### Recursión desactivada 

dig @192.168.50.2 google.com

### Auditoría y logs

sudo tail -n 30 /var/log/named/queries.log
sudo tail -n 30 /var/log/named/transfers.log
sudo tail -n 30 /var/log/named/security.log

### Continuidad del servicio 

## Detener temporalmente el DNS maestro

sudo systemctl stop bind9

### Desde el esclavo comprobar resolución 

dig @192.168.50.2 www.empresa.local A +short
dig @192.168.50.2 -x 192.168.50.3 +short

### Volver a iniciar el maestro 

sudo systemctl start bind9
sudo systemctl status bind9 --no-pager

### Journal de IXFR

sudo ls -lh /var/cache/bind/db.empresa.local.jnl
sudo named-journalprint /var/cache/bind/db.empresa.local.jnl

