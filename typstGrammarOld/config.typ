// Importar el paquete oficial eggs para lingüística
#import "@preview/eggs:0.10.0": *
#import abbreviations: m, f, sg, pl, erg, abs, nom, acc, dat, gen, abl, ins, voc, dur, loc, pst, fut, det

#let aor = abbreviation("aor", "aorist")
#let part = abbreviation("part", "partitive")

#let xxx = "Aghvar"

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

  show regex("\b0\p{L}+\b"): coincidencia => {
    let texto = coincidencia.text
    let texto-limpio = texto.slice(1) // Eliminamos el primer carácter (el "0")
    smallcaps(all: true)[#texto-limpio]
  }
  
  set enum(indent: 10pt, full: true)

  show:eggs.with()
  
  doc
}