import pandas as pd
import os
from collections import defaultdict

# 1. Detectar automáticamente la carpeta real donde está este script
CARPETA_ORIGEN = os.path.dirname(os.path.abspath(__file__))

# 2. Definir la ruta completa del archivo CSV de forma segura
ARCHIVO_CSV = os.path.join(CARPETA_ORIGEN, 'lexicon.csv') 

def detectar_duplicados_columna4(nombre_archivo):
    try:
        # Leer el CSV especificando que las columnas están separadas por punto y coma (;)
        df = pd.read_csv(nombre_archivo, header=None, sep=';', engine='python')
    except Exception as e:
        print(f"Error al leer el archivo '{nombre_archivo}': {e}")
        return

    # Verificar que el archivo tenga al menos 4 columnas
    if df.shape[1] < 4:
        print("El archivo CSV tiene menos de 4 columnas.")
        return

    # Diccionario para almacenar: palabra -> lista de números de fila
    palabras_filas = defaultdict(list)

    # Recorrer cada fila del DataFrame
    for index, row in df.iterrows():
        numero_fila = index + 1  # Número de fila basado en 1 para mayor claridad
        contenido_col4 = str(row[3])  # 4ta columna (índice 3 en Python)
        
        # Separar los elementos internos por comas y limpiar espacios en blanco
        palabras = [p.strip() for p in contenido_col4.split(',') if p.strip()]
        
        for palabra in palabras:
            palabras_filas[palabra].append(numero_fila)

    # Filtrar aquellas palabras que aparecen más de una vez en total
    duplicados = {palabra: filas for palabra, filas in palabras_filas.items() if len(filas) > 1}

    # Mostrar resultados
    if not duplicados:
        print("No se encontraron palabras duplicadas en la 4ta columna.")
    else:
        print("\n--- PALABRAS DUPLICADAS DETECTADAS EN LA 4TA COLUMNA ---")
        for palabra, filas in duplicados.items():
            print(f"* La palabra duplicada '{palabra}' se encuentra en las filas: {filas}")

if __name__ == "__main__":
    detectar_duplicados_columna4(ARCHIVO_CSV)
    
    # Pausa la consola para evitar que se cierre sola al terminar
    input("\nPresiona Enter para salir...")