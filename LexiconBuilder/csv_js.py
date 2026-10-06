import csv
import json
import os

# ESTO DETECTA AUTOMÁTICAMENTE LA CARPETA REAL DEL SCRIPT
CARPETA_ORIGEN = os.path.dirname(os.path.abspath(__file__))

# Si la prueba del paso 1 no funcionó, déjalo como "lexicon.csv"
ARCHIVO_CSV = os.path.join(CARPETA_ORIGEN, "lexicon.csv") 
ARCHIVO_JS = os.path.join(CARPETA_ORIGEN, "lexiconData.js")

# ... (El resto del código se queda exactamente igual)
COLUMNAS = ["palabra", "ipa", "alomorfos", "significados", "gramatica", "ejemplo", "traduccion"]
COLUMNAS_ARREGLO = {"alomorfos", "significados", "gramatica"}

lista_objetos = []

try:
    # 1. Verificar si el archivo CSV realmente existe en la ruta
    if not os.path.exists(ARCHIVO_CSV):
        raise FileNotFoundError(f"No se encontró el archivo '{ARCHIVO_CSV}' en esta carpeta. Verifica el nombre.")

    # 2. Leer y procesar el archivo CSV
    with open(ARCHIVO_CSV, mode="r", encoding="utf-8") as archivo:
        lector = csv.reader(archivo, delimiter=";")
        
        for fila in lector:
            if not fila:
                continue
                
            objeto = {}
            for clave, valor in zip(COLUMNAS, fila):
                valor_limpio = valor.strip()
                
                if clave in COLUMNAS_ARREGLO:
                    objeto[clave] = [item.strip() for item in valor_limpio.split(",")] if valor_limpio else []
                else:
                    objeto[clave] = valor_limpio
                    
            lista_objetos.append(objeto)

    # 3. Generar el formato JS limpio y compatible con HTML tradicional
    json_formateado = json.dumps(lista_objetos, indent=2, ensure_ascii=False)
    contenido_js = f"const lexiconData = {json_formateado};\n"

    # 4. Guardar el resultado
    with open(ARCHIVO_JS, mode="w", encoding="utf-8") as archivo_salida:
        archivo_salida.write(contenido_js)

    print("\n==============================================")
    print(f"¡CONVERSIÓN EXITOSA! Archivo creado en: {ARCHIVO_JS}")
    print("==============================================\n")

except Exception as e:
    print("\n==============================================")
    print("OCURRIÓ UN ERROR DURANTE LA EJECUCIÓN:")
    print(e)
    print("==============================================\n")

# Esto evita que la ventana de Windows se cierre sola
input("Presiona ENTER para cerrar esta ventana...")
