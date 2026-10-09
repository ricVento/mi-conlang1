// Importar el paquete oficial eggs para lingüística
#import "@preview/eggs:0.9.0": *
#import abbreviations: pl, ins
#show: eggs

// Configuración estética de la gramática
#let configuracion_gramatica(doc) = {
  set page(
    paper: "a4",
    margin: (x: 3cm, y: 2.5cm),
  )
  set text(
    font: "Linux Libertine", // Ideal para caracteres especiales e IPA
    size: 11pt,
    lang: "es"
  )
  set heading(numbering: "1.1")

  //show regex("\b[A-Z0-9]{2,}\b"): sc => smallcaps(all: true)[#sc]

  show regex("(/)?(\b[A-Z0-9]{2,}\b)"): coincidencia => {
  let texto = coincidencia.text
  if texto.starts-with("/") {
    // Es una sigla protegida (ej: /ONU). Quitamos el punto y la dejamos intacta.
    texto.slice(1)
  } else {
    // Es un morfema normal (ej: 3PL). Lo convertimos a versalitas.
    smallcaps(all: true)[#texto]
  }
}

  show:eggs.with()
  
  doc
}