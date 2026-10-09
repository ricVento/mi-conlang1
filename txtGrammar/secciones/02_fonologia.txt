// Importar todo desde config (que ya expone el paquete eggs)
#import "../config.typ": *

= Fonología y Ejemplos Sintácticos

== Ejemplos Interlineales con Eggs
El paquete `eggs` utiliza viñetas (`-`) para las glosas dentro de la función `#example`:

#example[
 +  - Gato-s  los  egg-s  comer-on.
    - cat-NOM  DET.PL  egg-PL  eat-3PL.PAST
    'Los gatos comieron los huevos.' #ex-label(<gl>)
    #v(0.25cm)
 +  - Perro  el  hueso come
    - perro-sg  det-PL.SG  hueso-ABS  comer-AOR
    'El perro come hueso' #ex-label(<gl2>)
]

== Notas sobre morfología
Además, puedes acceder a los ejemplos indonesio #ex-ref(<gl>) y bahasa @gl2 son referencias válidas.

#example(auto-subexamples: false, auto-glosses: false)[
  + This is a proper numbered item
  - And this is a proper bullet item
  #subexample[But this is a subexample]
  #gloss[i gloss-y][and gloss-#pl]
]

== Paradigmas de Declinación Nominal

A continuación, se presenta la declinación de los sustantivos de la primera clase para el tema en _-a_:

#align(center)[
  #table(
    // Tres columnas: Caso, Singular, Plural
    columns: (1fr, 2fr, 2fr),
    
    // Alineación: Caso a la izquierda, las formas centradas
    align: (left, center, center),
    
    // Quitamos todas las líneas por defecto (cuadrícula)
    stroke: none,
    
    // Dibujamos las líneas horizontales clásicas de libro (Booktabs)
    table.hline(y: 0, stroke: 1pt + black), // Línea superior externa
    
    // Encabezados de la tabla
    [*Caso*], [*Singular* (/M./F)], [*Plural* (/N)],
    
    table.hline(y: 1, stroke: 0.5pt + gray), // Línea divisoria del encabezado
    
    // Filas de datos (Tus mayúsculas pasan a versalitas solas)
    [NOM], [rosa-a],   [rosa-ae],
    [VOC], [rosa-a],   [rosa-ae],
    [ACC], [rosa-am],  [rosa-as],
    [GEN], [rosa-ae],  [rosa-arum],
    [DAT], [rosa-ae],  [rosa-is],
    [ABL], [rosa-a],   [rosa-is],
    
    table.hline(y: 7, stroke: 1pt + black), // Línea inferior externa
  )
]

== Paradigma del Sustantivo (Asimétrico)

#align(center)[
  #table(
    // 1. ANCHO ESTRECHO: Definimos anchos fijos pequeños en centímetros (cm)
    // o usamos "auto" para que la columna mida exactamente lo que mida el texto más largo.
    columns: (auto, auto, auto),
    
    align: (left, center, center),
    stroke: none,
    
    // Línea superior de la tabla
    table.hline(y: 0, stroke: 1pt + black),
    
    // Encabezados
    [*Caso*], [*Singular*], [*Plural*],
    
    // Línea del encabezado
    table.hline(y: 1, stroke: 0.5pt + gray),
    
    // FILAS DE DATOS CUSTOM
    [NOM], [kel-u],  [kel-wi],
    [ACC], [kel-un], [kel-win],
    [GEN], [kel-is], [kel-bi],
    [DAT], [kel-bi], [kel-bi],
    
    // Línea inferior de cierre
    table.hline(y: 5, stroke: 1pt + black),
  )
]

== Paradigma de Declinación Irregular

#align(center)[
  #table(
    // Tres columnas estrechas con tamaños automáticos
    columns: (auto, auto, auto),
    align: (left, center, center),
    stroke: none,
    
    // Línea superior del libro
    table.hline(y: 0, stroke: 1pt + black),
    
    // Encabezados principales
    [*Caso*], [*Singular*], [*Plural*],
    
    table.hline(y: 1, stroke: 0.5pt + gray),
    
    // FILAS DE DATOS
    [NOM], [nix], [nix-es],
    [ACC], [nix-em], [nix-es],
    
    // 1. EJEMPLO DE ROWSPAN (Fusión Vertical: toma 2 filas hacia abajo)
    [GEN], [nix-is], table.cell(rowspan: 2, align: center + horizon)[
      *nix-um* // \ (Forma sincretizada)
    ],
    [DAT], [nix-i], // Esta celda queda vacía porque el Plural del GEN la invade hacia abajo
    
    table.hline(y: 5, stroke: 0.5pt + gray),
    
    // 2. EJEMPLO DE COLSPAN (Fusión Horizontal: toma 2 columnas hacia la derecha)
    // El caso Locativo borra la distinción de número y abarca tanto Singular como Plural
    [LOC], table.cell(colspan: 2, align: center)[
      *nix-i-bux* // \ (Morfema global de espacio)
    ],
    
    // Línea de cierre inferior
    table.hline(y: 6, stroke: 1pt + black),
  )
]