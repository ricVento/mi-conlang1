import os
import re

# DETECTA AUTOMÁTICAMENTE LA CARPETA REAL DEL SCRIPT
CARPETA_ORIGEN = os.path.dirname(os.path.abspath(__file__))

archivo_entrada = os.path.join(CARPETA_ORIGEN, "sentences.txt")
archivo_salida = os.path.join(CARPETA_ORIGEN, "wordlist.txt")

try:
    # 1. Leer el archivo original con codificación UTF-8
    with open(archivo_entrada, "r", encoding="utf-8") as f:
        contenido = f.read()

    # 2. Reemplazar puntuación por saltos de línea (evita que "perro,amigo" se fusione)
    contenido_modificado = re.sub(r"[^\w\s]", "\n", contenido)

    # 3. Convertir todos los espacios y tabulaciones restantes en saltos de línea
    contenido_modificado = re.sub(r"[ \t]+", "\n", contenido_modificado)

    # Separar en líneas individuales
    lineas_crudas = contenido_modificado.split("\n")

    palabras_limpias = []
    for palabra in lineas_crudas:
        palabra_filtrada = palabra.strip()
        if palabra_filtrada:
            palabras_limpias.append(palabra_filtrada)

    # 4. Eliminar duplicados manteniendo el orden y distinguiendo mayúsculas/minúsculas
    palabras_unicas = list(dict.fromkeys(palabras_limpias))
    
    # Ordenar la lista alfabéticamente
    palabras_unicas.sort()    

    # 5. Crear y guardar el archivo 'wordlist.txt'
    with open(archivo_salida, "w", encoding="utf-8") as f:
        f.write("\n".join(palabras_unicas) + "\n")

    print(
        f"Proceso completado con éxito.\nSe ha creado '{archivo_salida}' con {len(palabras_unicas)} palabras únicas.\n"
    )

except FileNotFoundError:
    print(
        f"ERROR: El archivo 'sentences.txt' NO existe.\nAsegúrate de que el archivo de texto esté guardado exactamente en:\n{archivo_entrada}\n"
    )
except Exception as e:
    print(f"Ocurrió un error inesperado:\n{e}\n")

# ESTA LÍNEA AHORA ESTÁ FUERA DE TODO PARA GARANTIZAR QUE LA VENTANA SE QUEDE ABIERTA
input("Presiona ENTER para cerrar esta ventana...")
