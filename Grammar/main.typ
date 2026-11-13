// Importar todo desde config
#import "config.typ": *

// Aplicar reglas de diseño
#show: configuracion_gramatica

// PORTADA
#page(margin: 1cm)[
  #block(
    width: 100%,
    height: 100%,
    fill: rgb("#B7410E"),
    inset: 1.5cm,
  )[
    #set text(fill: white)
    #set par(justify: false)

    #align(top + left)[
      #text(
	    size: 50pt,
		font: ("Arial", "Liberation Sans", "DejaVu Sans"),
		fill: rgb("#FFF8F5")		
		)[Gramática de la Lengua #_x]
    ]

    #align(top + left)[
      #text(size: 28pt,
	  fill: rgb("#FFF8F5")
	  )[Ricardo Ventosinos]
    ]
	
	#align(bottom + right)[
      #text(size: 18pt,
	  fill: rgb("#FFF8F5")
	  )[2026]
    ]
  ]
]

// DEDICATORIA
#v(1fr)
#align(right)[
  #box(width: 60%)[
    #set text(style: "italic", size: 12pt)
    'Debo a la conjunción de un espejo y de una enciclopedia el descubrimiento de Uqbar'
    #v(0.3cm)
    #text(size: 10pt)[--- Jorge Luis Borges]
  ]
]
#v(2fr)
#pagebreak()

#set page(numbering: "i")
#counter(page).update(1)

// TABLA DE CONTENIDO AUTOMATICA
#{
  show outline.entry.where(level: 1): it => {
    v(12pt, weak: true)
    strong(it)
  }
  outline(
    title: "Contenido",
	indent: 1.5em
  )
}
#pagebreak()

// ESCRITURA Y AGRADECIMIENTO
#{
  set heading(numbering: none)
  include "secciones/ortografia.typ"
  pagebreak()
  include "secciones/agradecimientos.typ"
  pagebreak()  
}

// SECCIONES EN ORDEN
#set page(numbering: "1") 
#counter(page).update(1) 

#page(numbering: none, header: none)[
  #align(center)[
    #v(5cm)
	#text(size: 26pt, weight: "bold")[Parte I] \
    #v(0.5cm)
    #text(size: 24pt, style: "italic")[Introducción]
  ]
]

/*
#include "secciones/01_intro.typ"

#page(numbering: none, header: none)[
  #align(center)[
    #v(5cm)
	#text(size: 26pt, weight: "bold")[Parte II] \
    #v(0.5cm)
    #text(size: 24pt, style: "italic")[Fonología y Fonotáctica]
  ]
]

#include "secciones/02_fonologia.typ"
#pagebreak()
*/

#page(numbering: none, header: none)[
  #align(center)[
    #v(5cm)
	#text(size: 26pt, weight: "bold")[Parte III] \
    #v(0.5cm)
    #text(size: 24pt, style: "italic")[Sustantivos y Nominales]
  ]
]

#include "secciones/03_sustantivos.typ"
#pagebreak()

/*

#include "secciones/04_adjetivos.typ"
#pagebreak()

*/

#include "secciones/05_pronombres.typ"

#page(numbering: none, header: none)[
  #align(center)[
    #v(5cm)
	#text(size: 26pt, weight: "bold")[Parte IV] \
    #v(0.5cm)
    #text(size: 24pt, style: "italic")[Morfología Verbal]
  ]
]

#include "secciones/06_verbos.typ"

#page(numbering: none, header: none)[
  #align(center)[
    #v(5cm)
	#text(size: 26pt, weight: "bold")[Parte V] \
    #v(0.5cm)
    #text(size: 24pt, style: "italic")[Sintaxis]
  ]
]

#include "secciones/features.typ"