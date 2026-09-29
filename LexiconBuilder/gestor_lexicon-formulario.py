import ast
import json
import os
import re
import tkinter as tk
from tkinter import messagebox, ttk

# Ruta dinámica basada en la ubicación del script
DIRECTORIO_SCRIPT = os.path.dirname(os.path.abspath(__file__))
ARCHIVO_JS = os.path.join(DIRECTORIO_SCRIPT, "lexicon-data.js")


def normalizar_lexicon(lexicon):
  """Asegura que las keys 'alomorfos' y 'significados' sean listas de cadenas."""
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
  """Lee el archivo lexicon-data.js extrayendo y parseando el arreglo[cite: 1]."""
  if not os.path.exists(ARCHIVO_JS):
    return []

  try:
    with open(ARCHIVO_JS, "r", encoding="utf-8") as f:
      contenido = f.read()

    match = re.search(r"const\s+lexiconData\s*=\s*(\[.*\]);?", contenido, re.DOTALL)
    if not match:
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
    return []


def guardar_lexicon(lexicon):
  """Guarda la lista actualizada en formato de script JS para la interfaz web[cite: 1]."""
  lexicon = normalizar_lexicon(lexicon)
  json_str = json.dumps(lexicon, indent=2, ensure_ascii=False)
  contenido_js = f"const lexiconData = {json_str};\n"

  with open(ARCHIVO_JS, "w", encoding="utf-8") as f:
    f.write(contenido_js)


def verificar_duplicados_completos(lexicon, palabra, alomorfos):
  """Verifica duplicados en palabra y alomorfos[cite: 1]."""
  palabra_ingresada = palabra.strip()

  lista_alomorfos = []
  if isinstance(alomorfos, list):
    lista_alomorfos = [str(a).strip() for a in alomorfos if str(a).strip()]
  elif isinstance(alomorfos, str):
    lista_alomorfos = [a.strip() for a in alomorfos.split(",") if a.strip()]

  # 1. Duplicados internos en alomorfos
  vistos_alos = set()
  for a in lista_alomorfos:
    if a in vistos_alos:
      return (
          True,
          f"⚠️ El alomorfo '{a}' está duplicado dentro de los alomorfos"
          " ingresados.",
      )
    vistos_alos.add(a)

  # 2. Coincidencia palabra-alomorfo
  if palabra_ingresada in lista_alomorfos:
    return (
        True,
        f"⚠️ La palabra '{palabra_ingresada}' no puede coincidir con sus propios"
        " alomorfos.",
    )

  # 3. Validación contra léxico existente
  for item in lexicon:
    p_actual = str(item.get("palabra", "")).strip()

    if palabra_ingresada == p_actual:
      return (
          True,
          f"⚠️ La palabra '{palabra_ingresada}' ya existe como entrada"
          " principal.",
      )

    alomorfos_actuales = [
        str(a).strip() for a in item.get("alomorfos", []) if str(a).strip()
    ]
    if palabra_ingresada in alomorfos_actuales:
      return (
          True,
          f"⚠️ La palabra '{palabra_ingresada}' ya existe en los alomorfos de"
          f" '{p_actual}'.",
      )

    for a_nuevo in lista_alomorfos:
      if a_nuevo == p_actual:
        return (
            True,
            f"⚠️ El alomorfo '{a_nuevo}' ya existe como entrada principal en"
            f" '{p_actual}'.",
        )
      if a_nuevo in alomorfos_actuales:
        return (
            True,
            f"⚠️ El alomorfo '{a_nuevo}' ya existe en los alomorfos de"
            f" '{p_actual}'.",
        )

  return False, ""


class GestorLexiconApp:

  def __init__(self, root):
    self.root = root
    self.root.title("Gestor de Léxico Conlang")
    self.root.geometry("520x620")

    frame = ttk.Frame(root, padding=15)
    frame.pack(fill=tk.BOTH, expand=True)

    # Campos principales definidos en el script original[cite: 1]
    self.campos = [
        "palabra",
        "ipa",
        "alomorfos",
        "significados",
        "gramatica",
        "ejemplo",
        "traduccion",
    ]
    self.entries = {}

    for i, campo in enumerate(self.campos):
      lbl = ttk.Label(
          frame,
          text=f"{campo.capitalize()}:",
          font=("Arial", 10, "bold"),
      )
      lbl.grid(row=i, column=0, sticky=tk.W, pady=4)

      ent = ttk.Entry(frame, width=40, font=("Arial", 10))
      ent.grid(row=i, column=1, sticky=(tk.W, tk.E), pady=4)
      self.entries[campo] = ent

    # Botón de guardar registro
    btn_guardar = ttk.Button(
        frame, text="Guardar en el Léxico", command=self.guardar_registro
    )
    btn_guardar.grid(
        row=len(self.campos), column=0, columnspan=2, pady=15, sticky="ew"
    )

    # Consola de avisos integrada
    lbl_estado = ttk.Label(
        frame, text="Registro de Actividad:", font=("Arial", 9, "bold")
    )
    lbl_estado.grid(
        row=len(self.campos) + 1, column=0, sticky=tk.W, pady=(5, 2)
    )

    self.txt_estado = tk.Text(
        frame, height=8, width=50, font=("Consolas", 9), state=tk.DISABLED
    )
    self.txt_estado.grid(
        row=len(self.campos) + 2, column=0, columnspan=2, sticky="nsew"
    )

    frame.columnconfigure(1, weight=1)
    frame.rowconfigure(len(self.campos) + 2, weight=1)

  def log(self, mensaje):
    self.txt_estado.config(state=tk.NORMAL)
    self.txt_estado.insert(tk.END, mensaje + "\n")
    self.txt_estado.see(tk.END)
    self.txt_estado.config(state=tk.DISABLED)

  def guardar_registro(self):
    lexicon = cargar_lexicon()
    nuevo_registro = {}

    for campo, ent in self.entries.items():
      val = ent.get().strip()
      if val:
        if campo in ["alomorfos", "significados", "gramatica"]:
          nuevo_registro[campo] = [v.strip() for v in val.split(",") if v.strip()]
        else:
          nuevo_registro[campo] = val

    palabra_input = nuevo_registro.get("palabra", "")
    if not palabra_input:
      messagebox.showerror("Error", "El campo 'palabra' es obligatorio.")
      return

    # Validar duplicados[cite: 1]
    existe, mensaje = verificar_duplicados_completos(
        lexicon, palabra_input, nuevo_registro.get("alomorfos", [])
    )
    if existe:
      confirmar = messagebox.askyesno(
          "Advertencia de Duplicado",
          f"{mensaje}\n\n¿Deseas agregarla de todos modos?",
      )
      if not confirmar:
        self.log(
            f"❌ Operación cancelada para '{palabra_input}' por duplicidad."
        )
        return

    lexicon.append(nuevo_registro)
    guardar_lexicon(lexicon)
    self.log(f"✨ ¡Palabra '{palabra_input}' añadida con éxito!")

    # Limpiar campos tras guardar
    for ent in self.entries.values():
      ent.delete(0, tk.END)


if __name__ == "__main__":
  root = tk.Tk()
  app = GestorLexiconApp(root)
  root.mainloop()