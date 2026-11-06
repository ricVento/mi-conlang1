// Importar el paquete oficial eggs para lingüística
#import "@preview/eggs:0.10.0": *
#import abbreviations: m, f, sg, pl, erg, abs, dat, gen, abl, ins, voc, nom, acc, dur, obl, loc, pst, fut, det

#let _aor = abbreviation("aor", "aorist")
#let _part = abbreviation("part", "partitive")
#let _i = abbreviation("i", "nominal class 1")
#let _ii = abbreviation("ii", "nominal class 2")
#let _iii = abbreviation("iii", "nominal class 3")
#let _iv = abbreviation("iv", "nominal class 4")
#let _ad = abbreviation("ad", "orientation AD")
#let _ante = abbreviation("ante", "orientation ANTE")
#let _apud = abbreviation("apud", "orientation APUD")
#let _in = abbreviation("in", "orientation IN")
#let _post = abbreviation("post", "orientation POST")
#let _sub = abbreviation("sub", "orientation SUB")
#let _super = abbreviation("super", "orientation SUPER")


#let _xxx = "Aghvar"

#let asterismo = {
  v(1em)
  align(center)[\* \* \*]
  v(1em)
}

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
  
  show regex("\b0([a-zA-Z1-9]+)\b"): coincidencia => {
	// regexp anterior "\b0\p{L}+\b"
    let texto = coincidencia.text
    let texto-limpio = texto.slice(1) // Eliminamos el primer carácter (el "~")
    smallcaps(all: true)[#texto-limpio]
  }

  set enum(indent: 10pt, full: true)

  show:eggs.with()
  
  doc
}