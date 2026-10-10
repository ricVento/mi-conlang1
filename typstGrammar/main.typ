#import "config.typ": configuracion_gramatica

// Aplicar reglas de diseño
#show: configuracion_gramatica

// Portada
#align(center)[
  #v(5cm)
  #text(size: 26pt, weight: "bold")[Gramática de la Lengua Aghwar] \
  #v(1cm)
  #text(size: 18pt)[_Ricardo Ventosinos_]
  #align(bottom)[#text(size: 14pt)[Draw: Junio 2026]]
]
#pagebreak()

// Dedicatoria
#v(1fr)
#align(right)[
  #box(width: 60%)[
    #set text(style: "italic", size: 11pt)
    "Debo a la conjunción de un espejo y de una enciclopedia el descubrimiento de Uqbar" \
    #v(0.3cm)
    #text(size: 10pt)[--- Jorge Luis Borges]
  ]
]
#v(2fr)

#pagebreak()

// Tabla de contenidos automática vinculada a las secciones
#set page(numbering: "i")
#counter(page).update(1)
#outline(
  title: "Índice General",
  indent: 1.5em
)
#pagebreak()

// Inclusión modular de tu carpeta de secciones
#set page(numbering: "1") 
#counter(page).update(1) 
#include "secciones/01_intro.typ"
#pagebreak()
#include "secciones/02_fonologia.typ"
#pagebreak()
#include "secciones/03_sustantivos.typ"
