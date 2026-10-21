// Importar el paquete oficial eggs para lingüística
#import "@preview/eggs:0.9.0": *
#import abbreviations: pl, ins

// Configuración estética de la gramática
#let configuracion_gramatica(doc) = {
  set page(
    paper: "a4",
    margin: (x: 3cm, y: 2.5cm),
  )
  
  set text(
    font: "Charis",
	size: 11pt,
    lang: "es"
  )
  
  set heading(numbering: "1.1")

  show regex("/[A-Z0-9]{2,}\b|\b[A-Z0-9]{2,}\b"): coincidencia => {
   let texto = coincidencia.text
   if texto.starts-with("/") {
     // Es una sigla protegida (ej: /ONU) > Quitamos la barra y lo dejamos intacto.
     texto.slice(1)
   } else {
     // Es un morfema normal (ej: 3PL) > Lo convertimos a versalitas.
     smallcaps(all: true)[#texto]
   }
  }
  
  set enum(indent: 10pt, full: true)

  show:eggs.with()
  
  doc
}