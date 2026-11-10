// Importar el paquete oficial eggs para lingüística
#import "@preview/eggs:0.10.0": *
#import abbreviations as abb

#let _aor = abbreviation("aor", "aoristo")
#let _prs = abbreviation("prs", "presente")
#let _pf = abbreviation("pf", "perfecto")
#let _ppf = abbreviation("ppf", "pluperfecto")
#let _impf = abbreviation("impf", "imperfecto")

#let _abs = abbreviation("abs", "absolutivo")
#let _part = abbreviation("part", "partitivo")
#let _ad = abbreviation("ad", "orientacion AD")
#let _ante = abbreviation("ante", "orientacion ANTE")
#let _apud = abbreviation("apud", "orientacion APUD")
#let _in = abbreviation("in", "orientacion IN")
#let _post = abbreviation("post", "orientacion POST")
#let _sub = abbreviation("sub", "orientacion SUB")
#let _super = abbreviation("super", "orientacion SUPER")

#let _i = abbreviation("i", "clase nominal 1")
#let _ii = abbreviation("ii", "clase nominal 2")
#let _iii = abbreviation("iii", "clase nominal 3")
#let _iv = abbreviation("iv", "clase nominal 4")
#let _v = abbreviation("v", "clase nominal 5")

#let _x = "Aghvar"

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
    header: context {
      let i_pag = here().page()
      
      let cap_actual = query(heading.where(level: 1))
        .find(h => h.location().page() == i_pag)
        
      let cap = none
      
      if cap_actual != none {
        cap = cap_actual
      } else {
        let caps_atras = query(heading.where(level: 1).before(here()))
        if caps_atras.len() > 0 {
          cap = caps_atras.last()
        }
      }
      
      if cap != none {
        if cap.body == [Índice General] or cap.body == [Table of Contents] {
          return none
        }
        
        let num = counter(heading).at(cap.location()).first()
        
        set align(left)
        text(size: 9pt, fill: black)[
          #num #cap.body
        ]
      }
    }
  )
  
  set text(
    font: "Charis",
	size: 11pt,
    lang: "es"
  )
  
  set heading(numbering: "1.1")
  
  set enum(indent: 10pt, full: true)

  set figure.caption(position: top)

  show figure.caption: set align(left)
  
  show regex("\b0([a-zA-Z1-9]+)\b"): coincidencia => {
	// regexp anterior "\b0\p{L}+\b"
    let texto = coincidencia.text
    let texto-limpio = texto.slice(1) // Eliminamos el primer carácter (el "~")
    smallcaps(all: true)[#texto-limpio]
  }
  
 show ref: it => {
   let el = it.element
   if el != none and el.func() == heading {
     [§#counter(heading).at(el.location()).first()]
   } else {
     it
   }
 }  

  show:eggs.with()
  
  doc
}