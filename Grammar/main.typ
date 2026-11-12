// Importar todo desde config
#import "config.typ": *

// Aplicar reglas de diseño
#show: configuracion_gramatica

/************************************************ Portada ANTIGUA
#align(center)[
  #v(5cm)
  #text(size: 26pt, weight: "bold")[Gramática de la Lengua #_x] \
  #v(1cm)
  #text(size: 16pt)[_Ricardo Ventosinos_]
  #align(bottom)[#text(size: 12pt)[Borrador: Octubre 2026]]
]
#pagebreak()
*****************************************************************/
// PORTADA
#page(margin: 1cm)[
  #block(
    width: 100%,
    height: 100%,
    fill: rgb("#C8102E"),
    inset: 1.5cm,
  )[
    #set text(fill: white)
    #set par(justify: false)

    #align(top + left)[
      #text(
	    size: 48pt,
		//weight: "bold",
		font: ("Arial", "Liberation Sans", "DejaVu Sans")        
		)[Gramática de la Lengua #_x]
    ]

    #align(top + left)[
      #text(size: 24pt)[Ricardo Ventosinos]
    ]
	
	#align(bottom + right)[
      #text(size: 18pt)[_Octubre 2026_]
    ]
  ]
]

// DEDICATORIA
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

// TABLA DE CONTENIDO AUTOMATICA
#set page(numbering: "i")
#counter(page).update(1)
#outline(
  title: "Contenido",
  indent: 1.5em
)
#pagebreak()

// ORTOGRAFIA
#include "secciones/ortografia.typ"
#pagebreak()

// AGRADECIMIENTO
#include "secciones/agradecimientos.typ"
#pagebreak()

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