import ast
import json
import os
import re

# Ruta dinámica basada en la ubicación del script
DIRECTORIO_SCRIPT = os.path.dirname(os.path.abspath(__file__))
ARCHIVO_JS = os.path.join(DIRECTORIO_SCRIPT, "lexicon-data.js")


def normalizar_lexicon(lexicon):
  """Asegura que las keys 'alomorfos' y 'significados' sean siempre listas (arrays) de cadenas."""
  for item in lexicon:
    for key in ["alomorfos", "significados"]:
      if key in item:
        val = item[key]
        if isinstance(val, str):
          if "," in val:
            item[key] = [v.strip() for v in val.split(",") if v.strip()]
          else:
            item[key] = [val.strip()] if val.strip() else []
        elif isinstance(val, list):
          item[key] = [str(v).strip() for v in val if str(v).strip()]
  return lexicon


def cargar_lexicon():
  """Lee el archivo lexicon-data.js extrayendo el arreglo y parseándolo de forma segura."""
  if not os.path.exists(ARCHIVO_JS):
    print(
        f"⚠️ No se encontró '{ARCHIVO_JS}'. Se creará uno nuevo automáticamente"
        " al guardar."
    )
    return []

  try:
    with open(ARCHIVO_JS, "r", encoding="utf-8") as f:
      contenido = f.read()

    match = re.search(r"const\s+lexiconData\s*=\s*(\[.*\]);?", contenido, re.DOTALL)
    if not match:
      print("⚠️ No se encontró la estructura de lexiconData en el archivo.")
      return []

    bloque_datos = match.group(1)
    bloque_py = (
        bloque_datos.replace("true", "True")
        .replace("false", "False")
        .replace("null", "None")
    )

    lexicon = ast.literal_eval(bloque_py)
    return normalizar_lexicon(lexicon)

  except Exception as e:
    print(f"❌ Error al leer el archivo JS: {e}")
    return []


def guardar_lexicon(lexicon):
  """Guarda la lista actualizada en formato de script JS para la interfaz web."""
  lexicon = normalizar_lexicon(lexicon)
  json_str = json.dumps(lexicon, indent=2, ensure_ascii=False)
  contenido_js = f"const lexiconData = {json_str};\n"

  with open(ARCHIVO_JS, "w", encoding="utf-8") as f:
    f.write(contenido_js)
  print(f"✅ Archivo '{ARCHIVO_JS}' actualizado con éxito para la interfaz web.")


def verificar_existencia(lexicon, palabra_nueva):
  """Compara respetando estrictamente mayúsculas, minúsculas y diacríticos."""
  palabra_ingresada = palabra_nueva.strip()

  for item in lexicon:
    palabra_actual = str(item.get("palabra", "")).strip()
    if palabra_actual == palabra_ingresada:
      return (
          True,
          f"⚠️ [AVISO] La palabra '{palabra_nueva}' ya existe exactamente"
          f" igual como entrada principal.",
      )

    alomorfos = item.get("alomorfos", [])
    lista_alomorfos = []
    if isinstance(alomorfos, list):
      lista_alomorfos = [str(a).strip() for a in alomorfos]
    elif isinstance(alomorfos, str):
      lista_alomorfos = [
          a.strip() for a in alomorfos.split(",") if a.strip()
      ]

    if palabra_ingresada in lista_alomorfos:
      return (
          True,
          f"⚠️ [AVISO] La palabra '{palabra_nueva}' ya existe dentro de los"
          f" alomorfos de la entrada '{item.get('palabra')}'.",
      )

  return False, ""


def principal():
  print("=== GESTOR DE LÉXICO CONLANG (PYTHON) ===")
  print("💡 Consejo: Presiona Enter sin escribir nada para salir del programa.\n")

  while True:
    # Cargar el léxico en cada ciclo para asegurar que lea los cambios previos
    lexicon = cargar_lexicon()

    palabra_input = input(
        "--------------------------------------------------\nIntroduce la"
        " palabra a comprobar/añadir: "
    ).strip()

    if not palabra_input:
      print("👋 Saliendo del gestor. ¡Buen trabajo con tu conlang!")
      break

    existe, mensaje = verificar_existencia(lexicon, palabra_input)
    if existe:
      print(mensaje)
      opcion = (
          input("¿Deseas agregarla de todos modos a la lista? (s/n): ")
          .strip()
          .lower()
      )
      if opcion != "s":
        print("Operación cancelada para esta palabra.")
        continue  # Salta al inicio del bucle para pedir otra palabra

    print(
        "\n--- Introduce los datos para el nuevo registro (deja en blanco si"
        " no aplica) ---"
    )
    nuevo_registro = {"palabra": palabra_input}

    keys_sugeridas = (
        list(lexicon[0].keys())
        if lexicon
        else [
            "ipa",
            "alomorfos",
            "significados",
            "gramatica",
            "ejemplo",
            "traduccion",
        ]
    )
    if "palabra" in keys_sugeridas:
      keys_sugeridas.remove("palabra")

    for key in keys_sugeridas:
      val = input(f"[{key}]: ").strip()
      if val:
        if key in ["alomorfos", "significados"]:
          nuevo_registro[key] = [v.strip() for v in val.split(",") if v.strip()]
        elif "," in val and key in ["gramatica"]:
          nuevo_registro[key] = [v.strip() for v in val.split(",") if v.strip()]
        else:
          nuevo_registro[key] = val

    while True:
      extra_key = input(
          "¿Añadir otra propiedad personalizada? (Nombre de la key o presiona"
          " Enter para terminar): "
      ).strip()
      if not extra_key:
        break
      extra_val = input(f"Valor para [{extra_key}]: ").strip()
      if extra_key in ["alomorfos", "significados"]:
        nuevo_registro[extra_key] = [
            v.strip() for v in extra_val.split(",") if v.strip()
        ]
      elif "," in extra_val:
        nuevo_registro[extra_key] = [
            v.strip() for v in extra_val.split(",") if v.strip()
        ]
      else:
        nuevo_registro[extra_key] = extra_val

    lexicon.append(nuevo_registro)
    guardar_lexicon(lexicon)
    print("✨ ¡Palabra añadida y archivo JS actualizado con éxito!\n")


if __name__ == "__main__":
  principal()