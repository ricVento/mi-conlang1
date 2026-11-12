// Importar todo desde config
#import "../config.typ": *

= Pagina de Pruebas
Este proyecto contiene la descripción gramatical de la lengua objeto de estudio. Es un conlang con espiritu caucásico.

#quote(block: true, attribution: "René Descartes")[
  Esta es una cita larga que se mostrará como un bloque independiente, 
  con márgenes hacia adentro, ideal para textos de más de tres líneas.
]

La referencia al capítulo @generosyclases[§]

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
Para transformar palabras en versalitas solo hay que colocar un cero `[0]` delate como en `0+abc`. Una funcion elimina el cero y convierte el texto en versalitas. Esta es una sigla protegida protegida: 0onu (en versalitas), en cambio esta no está protegida ONU (como en AFI arriba)

== Nombre Automatico
Este es el nombre de mi #_x. Solo debo tipear `#_x` y se cambia en config.typ

== Fonologia (parrafo)
Para analizar este sistema vocálico se pueden adoptar dos posturas: una descriptiva, basada en los sonidos que los hablantes producen realmente, y otra analítica, enfocada en el nivel subyacente. Desde el primer punto de vista, el idioma cuenta con más de cinco vocales de superficie. Sin embargo, un análisis subyacente reduce el inventario a solo tres fonemas contrastivos por duración. Este segundo enfoque no solo resulta más económico, sino que simplifica drásticamente la descripción gramatical, ya que toda la morfología y los procesos de armonía vocálica se pueden explicar a partir de estas tres vocales básicas.

#asterismo

La evidencia empírica de esta reducción es la ausencia absoluta de pares mínimos con más de tres vocales distintas; es decir, cualquier raíz o morfema que comparta el mismo entorno consonántico solo es capaz de contrastar tres timbres vocálicos.

== Una tabla chula
Un parrafo para separar

#figure(
  caption: [Este es el título de mi tabla mundana],
  kind: table,
	table(
	  columns: (4fr,) + (1fr,) * 6,
	  align: left,
	  table.cell(rowspan: 2)[Gender assigment], table.cell(colspan: 3)[Singular], table.cell(colspan: 3)[Plural],
	  [#rotate(-90deg, reflow: true)[prefix]], [#rotate(-90deg, reflow: true)[infix]], [#rotate(-90deg, reflow: true)[suffix]], [#rotate(-90deg, reflow: true)[prefix]], [#rotate(-90deg, reflow: true)[infix]], [#rotate(-90deg, reflow: true)[suffix]], [#_i male human], [1], [2], [3], [4], [5],
	  [6], [#_ii female human], [7], [8], [9], [10], [11], [12], [#_iii animals & inanimate objects], [13], [14], [15], [16], [17], [18], [#_iv animate & inanimate objects], [19], [20], [21], [22], [23], [24], [#_v inanimate objects & names of young], [25], [26], [27],  [28], [29], [30]
	)  
)<mi-tabla1>

A pesar de las ventajas del modelo analítico, en las glosas se mantendrá la transcripción fonética. De este modo se facilita el cotejo con los audios de los hablantes nativos y se evita introducir una abstracción teórica que complique innecesariamente el diseño de una ortografía práctica para la comunidad.

== Ejemplos Interlineales con Eggs
El paquete `eggs` utiliza viñetas `[-]` para las glosas dentro de la función `#example`. 

El modelo es 
```text
#example[
  - The cats ate the eggs
  - 0art.0def gato.0sg comer.0pas 0art.0def huevo.0pl
  'Los gatos comieron los huevos.'
]
```

He aqui como se vería:

#example[
  - The cats ate the eggs
  - 0art.0def gato.0sg comer.0pas 0art.0def huevo.0pl
  'Los gatos comieron los huevos.'
]

Se deben usar dos espacios antes de `[-]` en ambas glosas para que separe las palabras; entre las palabras se puede usar espacio simple.

La traduccion puede ir entre `[']` o `["]`. Las primeras se convieren en `"abc"` y las segundas en `«abc»`. Tambien pueden omitirse del todo. Por comodidad y coherecia con el resto del texto se pueden preceder de dos espacios para mantener la sangría pero no es necesario.

Usando `[~]` se puede omitir una palabra dejando el espacio vacío

#example[
  #ex-label(<gl>)
  - donde esta el _topic_ perro
  - where is the ~ dog
  'donde esta el perro?'
]

Unas glosas con dos subejemplos

#example[
   #ex-label(<pair>)
 + - The cats ate the eggs
  - 0art.0def gato.0sg comer.0pas 0art.0def huevo.0pl
  'Los gatos comieron los huevos.'
   #v(0.25cm)
 + - The dogs ate the bones
  - 0art.0def perro.0sg comer.0pas 0art.0def hueso.0pl
  'Los perros comieron los huesos.'
]

Si se quieren usar subejemplos no son necesarios los espacios dobles antes de `[-]`, basta con usar ` + - texto` en la primera linea, luego la segunda sí exige mantener la linea de sangría.

Además, puedes acceder a los ejemplos de una sola linea como @gl o a los que contienen subejemplos de forma global como #ex-ref(<pair>) con las funciones `@label` o `#ex-ref(<label>)`. Estos ultimos se pueden referenciar tambien individualmente como @pair:a y @pair:b mediante la forma `@ref:a|b`.

Se pueden hacer un rango de ejemplos como en @gl[@pair] `@label[label2]` o @pair:a[@pair:b] `@label:a[@label:b]`. Todos son referencias válidas.

== Notas sobre morfología
Este ejemplo no lo entiendo bien...

#example(auto-subexamples: false, auto-glosses: false)[
 + This is a proper numbered item
 - And this is a proper bullet item
  #subexample[But this is a subexample]
  #gloss[i gloss-y][and gloss-#_abs]
]

== Paradigmas de Declinación Nominal
A continuación, se presenta la declinación de los sustantivos de la primera clase para el tema en _–a_:

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
    [#_abs], [rosa-a],   [rosa-ae],
    [#_abs], [rosa-a],   [rosa-ae],
    [#_abs], [rosa-am],  [rosa-as],
    [#_abs], [rosa-ae],  [rosa-arum],
    [#_abs], [rosa-ae],  [rosa-is],
    [#_abs], [rosa-a],   [rosa-is],
    
    table.hline(y: 7, stroke: 1pt + black), // Línea inferior externa
  )
]

Fijate como hago ref a @mi-tabla1

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
    [#_abs], [kel-u],  [kel-wi],
    [#_abs], [kel-un], [kel-win],
    [#_abs], [kel-is], [kel-bi],
    [#_abs], [kel-bi], [kel-bi],
    
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
    [#_abs], [nix], [nix-es],
    [#_abs], [nix-em], [nix-es],
    
    // 1. EJEMPLO DE ROWSPAN (Fusión Vertical: toma 2 filas hacia abajo)
    [#_abs], [nix-is], table.cell(rowspan: 2, align: center + horizon)[
      *nix-um* // \ (Forma sincretizada)
    ],
    [#_abs], [nix-i], // Esta celda queda vacía porque el Plural del #gen la invade hacia abajo
    
    table.hline(y: 5, stroke: 0.5pt + gray),
    
    // 2. EJEMPLO DE COLSPAN (Fusión Horizontal: toma 2 columnas hacia la derecha)
    // El caso Locativo borra la distinción de número y abarca tanto Singular como Plural
    [#_abs], table.cell(colspan: 2, align: center)[
      *nix-i-bux* // \ (Morfema global de espacio)
    ],
    
    // Línea de cierre inferior
    table.hline(y: 6, stroke: 1pt + black),
  )
]

== Un ejemplo largo
Este es un ejemplo mas largo
#example[
  - este es un ejemplo más largo donde las palabras sencillamente se tienen que cortar y seguir en una linea diferente porque no alcanza la página
  - este es un ejemplo más largo donde las palabras sencillamente se teenen que cortar y seguir en una linea diferente porque no alcanza la página
 'este es un ejemplo más largo donde las palabras sencillamente se tienen que cortar y seguir en una linea diferente porque no alcanza la página'
]

== Lista de Abreviaturas
Se deben declarar en config.typ; se pueden crear nuevas como variables.
#columns(2, gutter: 1.5em)[
  #print-abbreviations()
]