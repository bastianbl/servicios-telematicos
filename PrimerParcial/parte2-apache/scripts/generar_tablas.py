import csv
from collections import defaultdict

entrada = "/vagrant/entrega-parcial/parte2-apache/resultados/resultados.csv"
salida_csv = "/vagrant/entrega-parcial/parte2-apache/resultados/resultados_completos.csv"
salida_md = "/vagrant/entrega-parcial/parte2-apache/resultados/resultados.md"

filas = []

with open(entrada, newline="", encoding="utf-8") as f:
    lector = csv.DictReader(f)
    filas = list(lector)

# Tamaño original de cada archivo
originales = {}

for fila in filas:
    if fila["algoritmo"] == "identity":
        originales[fila["archivo"]] = int(fila["tamano_bytes"])

# Calcular ratio y ahorro
for fila in filas:
    original = originales[fila["archivo"]]
    tamano = int(fila["tamano_bytes"])

    ratio = tamano / original
    ahorro = (1 - ratio) * 100

    fila["ratio"] = f"{ratio:.4f}"
    fila["ahorro_porcentaje"] = f"{ahorro:.2f}"

# CSV completo
campos = [
    "archivo",
    "algoritmo",
    "nivel",
    "tamano_bytes",
    "ratio",
    "ahorro_porcentaje",
    "tiempo_segundos"
]

with open(salida_csv, "w", newline="", encoding="utf-8") as f:
    escritor = csv.DictWriter(f, fieldnames=campos)
    escritor.writeheader()

    for fila in filas:
        escritor.writerow({campo: fila[campo] for campo in campos})

# Agrupar para Markdown
grupos = defaultdict(list)

for fila in filas:
    grupos[fila["archivo"]].append(fila)

with open(salida_md, "w", encoding="utf-8") as f:
    f.write("# Resultados de compresión Apache\n\n")
    f.write(
        "Comparación experimental de contenido sin compresión, "
        "gzip niveles 1, 6 y 9, y Brotli calidades 5 y 11.\n\n"
    )

    for archivo, datos in grupos.items():
        original = originales[archivo]

        f.write(f"## {archivo}\n\n")
        f.write(f"**Tamaño original:** {original} bytes\n\n")

        f.write(
            "| Algoritmo | Nivel | Tamaño (B) | Ratio | "
            "Ahorro (%) | Tiempo (s) |\n"
        )
        f.write(
            "|---|---:|---:|---:|---:|---:|\n"
        )

        for fila in datos:
            f.write(
                f"| {fila['algoritmo']} "
                f"| {fila['nivel']} "
                f"| {fila['tamano_bytes']} "
                f"| {fila['ratio']} "
                f"| {fila['ahorro_porcentaje']} "
                f"| {fila['tiempo_segundos']} |\n"
            )

        f.write("\n")

print("Archivos generados:")
print(salida_csv)
print(salida_md)
