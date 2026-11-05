// Importar todo desde config
#import "../config.typ": *

= Introducción
Este proyecto contiene la descripción gramatical de la lengua objeto de estudio. Es un conlang con espiritu caucásico.

si uso el código 0abs1 no genera conflictos?

== Metodología
Los datos fueron recolectados mediante sesiones de elicitación directa. 

+ esto es una lista numerada

No sé que mas quieres que te diga. Esto son pruebas que hago para ver como trabaja.

- esto es una lista sin número

== Alfabeto
El idioma usa el alfabeto fonetico internacional (AFI) con algunas modificaciones como χ qχʷ ʔɑtʃ'ɪdʒ ł ƛ qχ° æ

== Listas
Esto es una lista anidada
+ Un elemento
 + otro elemento
 + y otro mas
+ este continua

Una lista anidada que no lleva numeros
- Un elemento
 - otro elemento
  - dentro del anterior
 - y otro mas en el medio
- este continua

== Versalitas
Para transformar palabras en versalitas solo hay que colocar un cero `0` delate como en `0‌abc` delante. Una funcion elimina el cero y convierte el texto en versalitas. Esta es una sigla protegida protegida: 0onu (en versalitas), en cambio esta no está protegida ONU (como en AFI arriba)

== Nombre Automatico
Este es el nombre de mi #xxx. Se cambia en config.typ

= Fonología y Ejemplos Sintácticos
Para analizar este sistema vocálico se pueden adoptar dos posturas: una descriptiva, basada en los sonidos que los hablantes producen realmente, y otra analítica, enfocada en el nivel subyacente. Desde el primer punto de vista, el idioma cuenta con más de cinco vocales de superficie. Sin embargo, un análisis subyacente reduce el inventario a solo tres fonemas contrastivos por duración. Este segundo enfoque no solo resulta más económico, sino que simplifica drásticamente la descripción gramatical, ya que toda la morfología y los procesos de armonía vocálica se pueden explicar a partir de estas tres vocales básicas.

#asterismo

La evidencia empírica de esta reducción es la ausencia absoluta de pares mínimos con más de tres vocales distintas; es decir, cualquier raíz o morfema que comparta el mismo entorno consonántico solo es capaz de contrastar tres timbres vocálicos.

== Una tabla chula
#figure(
  caption: [Este es el título de mi tabla mundana],
  kind: table,
	table(
	  columns: (4fr,) + (1fr,) * 6,
	  align: left,
	  table.cell(rowspan: 2)[Gender assigment], table.cell(colspan: 3)[Singular], table.cell(colspan: 3)[Plural],
	  [#rotate(-90deg, reflow: true)[prefix]], [#rotate(-90deg, reflow: true)[infix]], [#rotate(-90deg, reflow: true)[suffix]], [#rotate(-90deg, reflow: true)[prefix]], [#rotate(-90deg, reflow: true)[infix]], [#rotate(-90deg, reflow: true)[suffix]], [0i male human], [1], [2], [3], [4], [5],
	  [6], [0ii female human], [7], [8], [9], [10], [11], [12], [0iii animals & inanimate objects], [13], [14], [15], [16], [17], [18], [0iv animate & inanimate objects], [19], [20], [21], [22], [23], [24], [0v inanimate objects & names of young], [25], [26], [27],  [28], [29], [30]
	)  
)

A pesar de las ventajas del modelo analítico, en las glosas se mantendrá la transcripción fonética. De este modo se facilita el cotejo con los audios de los hablantes nativos y se evita introducir una abstracción teórica que complique innecesariamente el diseño de una ortografía práctica para la comunidad.

== Ejemplos Interlineales con Eggs
El paquete `eggs` utiliza viñetas (`-`) para las glosas dentro de la función `#example`. He aqui algunos ejemplos prácticos.

#example[
  - Gato-s los egg-s comer-on.
  - cat-#nom #det.#pl egg-#pl eat-3#pl.#pst
  'Los gatos comieron los huevos.' #ex-label(<gl>)
]

Se deben usar dos espacios antes de `__-` en ambas glosas para que separe las palabras; entre las palabras se puede usar espacio simple.

La traduccion puede ir entre `'` o `"`. Las primeras se convieren en `"` y las segundas en `«`. Tambien pueden omitirse del todo. Por comodidad y coherecia con el resto del texto se pueden preceder de dos espacios para mantener la sangría pero no es necesario.

Unas glosas con dos subejemplos

#example[
 + - Gato-s los egg-s comer-on.
   - cat-#nom #det.#pl egg-#pl eat-3#pl.#pst
   'Los gatos comieron los huevos.' #ex-label(<gl>)
   #v(0.25cm)
 + - Perro el hueso come
   - perro-#sg det-#pl.#sg hueso-#abs comer-#aor
   'El perro come hueso' #ex-label(<gl2>)
]

Si se quieren usar subejemplos no son necesarios los espacios dobles antes de `__-`, basta con usar `_+_-_texto` en la primera linea, luego la segunda sí exige mantener la linea de sangría.

== Notas sobre morfología
Además, puedes acceder a los ejemplos indonesio #ex-ref(<gl>) y bahasa @gl2 son referencias válidas.

Este ejemplo no lo entiendo bien...

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
    [*Caso*], [*Singular* (M/F)], [*Plural* (N)],
    
    table.hline(y: 1, stroke: 0.5pt + gray), // Línea divisoria del encabezado
    
    // Filas de datos (Tus mayúsculas pasan a versalitas solas)
    [#nom], [rosa-a],   [rosa-ae],
    [#voc], [rosa-a],   [rosa-ae],
    [#acc], [rosa-am],  [rosa-as],
    [#gen], [rosa-ae],  [rosa-arum],
    [#dat], [rosa-ae],  [rosa-is],
    [#abl], [rosa-a],   [rosa-is],
    
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
    [#nom], [kel-u],  [kel-wi],
    [#acc], [kel-un], [kel-win],
    [#gen], [kel-is], [kel-bi],
    [#dat], [kel-bi], [kel-bi],
    
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
    [#nom], [nix], [nix-es],
    [#acc], [nix-em], [nix-es],
    
    // 1. EJEMPLO DE ROWSPAN (Fusión Vertical: toma 2 filas hacia abajo)
    [#gen], [nix-is], table.cell(rowspan: 2, align: center + horizon)[
      *nix-um* // \ (Forma sincretizada)
    ],
    [#dat], [nix-i], // Esta celda queda vacía porque el Plural del #gen la invade hacia abajo
    
    table.hline(y: 5, stroke: 0.5pt + gray),
    
    // 2. EJEMPLO DE COLSPAN (Fusión Horizontal: toma 2 columnas hacia la derecha)
    // El caso Locativo borra la distinción de número y abarca tanto Singular como Plural
    [#loc], table.cell(colspan: 2, align: center)[
      *nix-i-bux* // \ (Morfema global de espacio)
    ],
    
    // Línea de cierre inferior
    table.hline(y: 6, stroke: 1pt + black),
  )
]

== Lista de Abreviaturas
Se deben declarar en config.typ; se pueden crear nuevas como variables.
#print-abbreviations()