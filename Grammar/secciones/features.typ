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
  block(width: 90%)[
    #table(
      columns: (4fr,) + (1fr,) * 6,
      //stroke: none,
       align: left,
       table.cell(rowspan: 2)[Gender assigment], table.cell(colspan: 3)[Singular], table.cell(colspan: 3)[Plural], [#rotate(-90deg, reflow: true)[prefix]], [#rotate(-90deg, reflow: true)[infix]], [#rotate(-90deg, reflow: true)[suffix]], [#rotate(-90deg, reflow: true)[prefix]], [#rotate(-90deg, reflow: true)[infix]], [#rotate(-90deg, reflow: true)[suffix]], [#_i male human], [1], [2], [3], [4], [5], [6], [#_ii female human], [7], [8], [9], [10], [11], [12], [#_iii animals & inanimate objects], [13], [14], [15], [16], [17], [18], [#_iv animate & inanimate objects], [19], [20], [21], [22], [23], [24], [#_v inanimate objects & names of young], [25], [26], [27],  [28], [29], [30]
    )	
  ]  
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
    columns: (1fr, 2fr, 2fr),
    align: (left, center, center),
    stroke: none,
    table.hline(y: 0, stroke: 1pt + black), // Línea superior externa
    [*Caso*], [*Singular* (M/F)], [*Plural* (N)],
    table.hline(y: 1, stroke: 0.5pt + gray), // Línea divisoria del encabezado
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
    columns: (auto, auto, auto),
    align: (left, center, center),
    stroke: none,
    table.hline(y: 0, stroke: 1pt + black),
    [*Caso*], [*Singular*], [*Plural*],
    table.hline(y: 1, stroke: 0.5pt + gray),
    [#_abs], [kel-u],  [kel-wi],
    [#_abs], [kel-un], [kel-win],
    [#_abs], [kel-is], [kel-bi],
    [#_abs], [kel-bi], [kel-bi],
    table.hline(y: 5, stroke: 1pt + black),
  )
]

== Paradigma de Declinación Irregular

#align(center)[
  #table(
    columns: (auto, auto, auto),
    align: (left, center, center),
    stroke: none,    
    table.hline(y: 0, stroke: 1pt + black),
    [*Caso*], [*Singular*], [*Plural*],
    table.hline(y: 1, stroke: 0.5pt + gray),
    [#_abs], [nix], [nix-es],
    [#_abs], [nix-em], [nix-es],
    [#_abs], [nix-is], table.cell(rowspan: 2, align: center + horizon)[
      *nix-um* // \ (Forma sincretizada)
    ],
    [#_abs], [nix-i], // Esta celda queda vacía porque el Plural del #gen la invade hacia abajo
    table.hline(y: 5, stroke: 0.5pt + gray),
    [#_abs], table.cell(colspan: 2, align: center)[
      *nix-i-bux* // \ (Morfema global de espacio)
    ],
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

#pagebreak()

= Gramatica Breve de Khwarshi

== Casos Gramaticales

En el idioma khwarshi existen 51 casos y combinaciones de casos nominales. Estos se dividen en 8 casos gramaticales y el sistema de casos locales (espaciales), que resultan de combinar 7 sufijos de orientación con 6 sufijos direccionales.

---

=== 1\. Casos Gramaticales (8 casos)

 Absolutivo (Absolutive) (marca cero): Es la forma no marcada y la forma de citación del sustantivo. Se utiliza para marcar el sujeto de los verbos intransitivos, el paciente de los verbos transitivos, el atributo nominal del predicado y el instrumento en los predicados de contacto.
 Ergativo (Ergative) (sufijo \-i en sustantivos de un tema o formado mediante la raíz oblicua en sustantivos de dos temas): Marca al agente en las construcciones transitivas.
 Genitivo 1 (Genitive 1) (sufijo \-s): Expresa la relación de posesión o atributo cuando el sustantivo modificado (el poseído) está en caso absolutivo.
 Genitivo 2 (Genitive 2) (sufijo \-lo/-la): Indica posesión o atributo cuando el sustantivo modificado está en cualquier caso oblicuo. También se usa para marcar al paciente animado con predicados de contacto.
 Instrumental (Instrumental) (sufijo \-z): Expresa el instrumento con sustantivos inanimados concretos y la duración con sentido télico en expresiones adverbiales de tiempo.
 Durativo (Durative) (sufijo \-d): Se emplea únicamente con sustantivos abstractos para indicar duración con significado atélico en adverbiales de tiempo.
 Vocativo (Vocative) (sufijo \-yu en sustantivos comunes; la forma absolutiva en nombres propios/parentesco, frecuentemente acompañada por la partícula wo): Se utiliza para apelar o llamar al interlocutor.
 Causal (Causal) (sufijo \-λeru): Expresa la causa o motivo ("debido a" o "a causa de").

---

=== 2\. Casos Locales o Espaciales (Combinación de sufijos)

Los casos espaciales se forman combinando dos posiciones morfológicas: una para la orientación (localización en el espacio) y otra para la dirección.

==== Sufijos de Orientación (7 sufijos)

1. Super (\-λ’o/-λ’a): Localización "sobre" una superficie (contacto suelto o en superficie reducida).
2. Sub (\-λ): Localización "debajo de" un objeto.
3. In (\-ma): Localización "dentro de" un espacio cerrado o recipiente hueco.
4. Inter (\-ł): Localización "en/entre" una masa u objeto amorfo.
5. Ad (\-ho/-ha): Localización "en / junto a" un punto o referencia.
6. Apud (\-γo/-γa): Localización "cerca de / al lado de" (contacto muy cercano).
7. Cont (\-qo/-qa): Localización "en contacto fijo con" una superficie grande o "alrededor de" algo.

==== Sufijos Direccionales (6 sufijos)

1. Esivo (Essive) (sufijo cero): Indica reposo o ausencia de movimiento.
2. Lativo (Lative) (\-l / -li): Indica movimiento "hacia" o "a"; también cumple funciones gramaticales al marcar el Experimentador y Beneficiario en verbos inversos.
3. Versativo (Versative) (\-γul): Indica dirección general o aproximada "hacia".
4. Ablativo (Ablative) (\-z / -zi): Indica origen o movimiento "desde / fuera de".
5. Translativo (Translative) (\-γužaz): Indica movimiento "a través de".
6. Terminativo (Terminative) (\-q’a): Indica el límite del movimiento ("hasta")

== Adjetivos

En el idioma khwarshi, los adjetivos constituyen la segunda clase de palabras más grande después de los sustantivos y verbos. A continuación se sintetiza su funcionamiento principal:

=== 1\. Funciones Sintácticas y Posición

 Funciones: Los adjetivos se utilizan como atributos (modificando a un sustantivo), como predicados o como sustantivos mediante sustantivación.
 Orden de palabras: El orden habitual y no marcado dentro de la frase nominal es [Adjetivo + Sustantivo]. Si el adjetivo se coloca después del sustantivo, suele expresar contraste o foco. En un sintagma adjetival, los adverbios siempre preceden al adjetivo.

---

=== 2\. Concordancia y Clases Morfológicas

Los adjetivos se dividen en dos clases morfológicas según si expresan o no concordancia de género y número con el sustantivo al que modifican:

1. Con concordancia de género y número (más del 60% de los adjetivos):
   Préstamos del ávaro (\~45%): Muestran concordancia mediante sufijos. (El khwarshi es la única lengua del grupo tsez que ha conservado la concordancia por sufijos en adjetivos prestados del ávaro).
   Nativos de origen khwarshi (\~15%): Muestran concordancia mediante prefijos.
2. Sin concordancia de género y número (\~40% de los adjetivos):
   Son principalmente de origen nativo e incluyen adjetivos que empiezan por vocal (términos de color como ut’ana 'rojo') y adjetivos que empiezan por consonante (adjetivos de grado como k’ottu 'bajo').

---

=== 3\. Flexión, Caso Oblicuo y Plural

 Número: La forma en singular es la forma base no marcada. El plural de los adjetivos atributivos se forma con el sufijo \-t’a, tanto en el caso absolutivo como en los casos oblicuos.
 Modificación oblicua: Cuando modifican a un sustantivo en caso oblicuo, muchos adjetivos cambian de forma:
   Los adjetivos nativos que terminan en \-u cambian su vocal final a \-o.
   Opcionalmente, se les puede añadir el sufijo oblicuo \-lo / -la.
 Definitud: Pueden llevar la partícula de definitud \-so / -sa adjunta al tema.

---

=== 4\. Grados de Comparación

El khwarshi no posee formas morfológicas para el comparativo ni para el superlativo:

 Comparativo: Se expresa sintácticamente mediante una construcción comparativa en la que el estándar de comparación recibe el sufijo superablativo (\-λ’o-zi).
 Superlativo: Se expresa anteponiendo el adverbio heč’č’e ("el más") al adjetivo.

---

=== 5\. Negación y Sustantivación

 Negación: Los adjetivos no admiten sufijos de negación directos; para negar un adjetivo se niega el verbo copulativo o auxiliar de la oración.
 Sustantivación: Cuando un adjetivo se usa como sustantivo, pasa a recibir la declinación nominal de caso y número (siguiendo patrones de una o dos raíces)

== Verbos

No existen raíces supletivas en khwarshi para diferenciar el aspecto perfectivo del imperfectivo. El sistema verbal del khwarshi no presenta irregularidades en sus raíces léxicas (la única excepción irregular es el verbo auxiliar copulativo).

En su lugar, el aspecto se expresa mediante sufijos flexivos, modificaciones morfológicas de la raíz (como el alargamiento vocálico o la reduplicación) y construcciones analíticas (perifrásticas).

---

=== Mecanismos de marcación del aspecto

1. Aspecto Perfectivo:

- No existe un sufijo perfectivo puro independiente del tiempo; la perfectividad se manifiesta fusionada dentro del sistema de tiempos pasados.
- Se marca con el sufijo de pasado atestiguado -i o con el sufijo de pasado no atestiguado / converbo perfectivo -un / -ɨn / -in.

2. Aspecto Imperfectivo:

- Progresivo / Continuo: Se forma con el sufijo -še (presente simple y converbo imperfectivo). Para enfatizar la acción en curso, se emplean perífrasis uniendo el converbo en _-še_ con los auxiliares _goli_ o _-eč-_ ("ser/estar").
- Habitual: Se expresa a través del Tiempo General. Este no utiliza el sufijo _-še_, sino que modifica la raíz mediante el alargamiento de la vocal radical (en verbos monosilábicos) o la adición de los sufijos -yō, -āy o -ōy.

3. Aspecto Durativo e Iterativo:

- Se deriva mediante reduplicación morfológica de la raíz verbal (por ejemplo, reduplicando el patrón consonante-vocal).
- También se expresa sintácticamente reduplicando el converbo imperfectivo (con la estructura _-še-č -še_).

En el idioma khwarshi, las formas verbales no finitas (_non-finite forms_) se dividen en cuatro categorías principales: el masdar (o sustantivo verbal), el infinitivo, los participios y los converbos.

---

=== 1. El Masdar (Sustantivo Verbal)

- Formación: Se construye adjuntando el sufijo -nu a la raíz verbal desnuda.
- Naturaleza mixta: Posee propiedades tanto nominales como verbales.
    - Como sustantivo: Se asigna automáticamente al Género 4, se declina en casos gramaticales/locales y se puede flexionar en número. Expresa acciones o conceptos abstractos (por ejemplo, _urγidnu_ 'pensamiento' o _leλnu_ 'enfermedad').
    - Como verbo: Retiene sus argumentos sintácticos y mantiene concordancia de género y número con ellos.
- Uso principal: Se utiliza ampliamente para formar cláusulas de complemento con distintos predicados.

---

=== 2. El Infinitivo

- Formación: Se forma mediante el sufijo -a añadido a la raíz verbal. Si la raíz termina en vocal, se inserta la semivocal epentética -y- (_Vi + y + a_).
- Función de citación: Funciona como la forma de citación de los verbos en el diccionario o gramática.
- Usos sintácticos: Se emplea en construcciones perifrásticas para expresar el tiempo futuro definitivo, en cláusulas de complemento con verbos modales (como _uka_ 'deber' o _behida_ 'poder') y en oraciones subordinadas de propósito u oraciones finales.

---

=== 3. Los Participios

Su función primaria es atributiva (modificar a un sustantivo para construir oraciones relativas). Sin embargo, también pueden sustantivarse (recibiendo marcas de caso y número) o emplearse en funciones adverbiales. Indican tiempo relativo.

Se distinguen varias formas sintéticas y analíticas:

- Participio de pasado: Sufijo -u / -gu (se usa _-gu_ si la raíz acaba en vocal; y _-u_ si acaba en consonante, la cual se gemina).
- Participio presente: Se forma con el sufijo de presente -še más la partícula de definitud -so (_-šeso_), o mediante la forma del verbo auxiliar _gollu_.
- Participio de tiempo general: Sufijo -dow / -dogu. Expresa un significado habitual o de futuro indefinido. Su forma negativa utiliza el sufijo -tew.
- Participios analíticos o compuestos: Incluyen el _Participio pluperfecto_ (converbo perfectivo + participio pasado de _-eč-_ 'ser/estar'), el _Participio perfecto_ (converbo perfectivo + _gollu_), y el _Participio presente imperfectivo_ (converbo imperfectivo + _gollu_).

---

=== 4. Los Converbos

Los converbos son formas verbales no finitas cuya función es subordinar cláusulas y constituir oraciones adverbiales. Se dividen en dos clases sintácticas:

==== A. Converbos Contextuales

Tienen un significado semántico amplio o neutral que se precisa según el contexto de la oración:

- Perfectivo: Sufijo -un / -ɨn / -in; expresa una secuencia temporal de eventos o la manera de realizar una acción de movimiento.
- Imperfectivo / Progresivo: Sufijo -še; expresa la simultaneidad de acciones.
- Perfectivo progresivo: Combinación del converbo imperfectivo del verbo principal con el converbo perfectivo del auxiliar -eč-.
- Negativo: Sufijo -bič; sirve como la forma negativa para los converbos perfectivo e imperfectivo.
- Formas reduplicadas: Formas enfáticas como el perfectivo reduplicado o el imperfectivo reduplicado.

==== B. Converbos Especializados

Expresan un enlace semántico o lógico concreto entre la cláusula subordinada y la principal:

- Temporales:
    - _Anterior I_ (-aλa): 'cuando' / 'después de'.
    - _Anterior II_ (-unso): 'tras haber' / 'después de que'.
    - _Anterior III_ (-dowquł): 'el día que' (para eventos dentro de la misma jornada).
    - _Anterior inmediato_ (-uč): 'tan pronto como' / 'apenas'.
    - _Posterior_ (-šehol): 'antes de'.
    - _Terminativo_ (-šeq’a): 'hasta que'.
    - _Durativo_ (-šezuq’un): 'mientras'.
    - _Temporal propio_ (-q’arλ’a): 'en el momento en que' / 'cuando'.
- No temporales:
    - _Condicional_ (-ło): 'si' (oraciones hipotéticas).
    - _Concesivo_ (-łon): 'aunque' / 'a pesar de que'.
    - _Causal_ (-aλeru / -λeru): 'porque' / 'a causa de'.
    - _Locativo_ (-zaha): 'donde' / 'al lugar donde'.
    - _Propósito negativo_ (-aluso): 'para no' / 'a fin de que no'.
    - _Similativo_ (-hol): 'como' / 'tal como'.

Las formas verbales finitivas (_finite forms_) en khwarshi son aquellas que ejercen la función de predicado principal en oraciones independientes. Se dividen principalmente en categorías sintéticas (formadas por una sola palabra verbal) y categorías analíticas o perifrásticas (que combinan una forma verbal no finita con verbos auxiliares).

---

=== 1. Tiempos Sintéticos (Formas simples)

- Presente simple: Se construye añadiendo el sufijo -še a la raíz verbal desnuda. Se utiliza tanto para acciones que ocurren en el momento del habla como para eventos futuros inmediatos.
- Pasado atestiguado ( Past witnessed ): Se marca con el sufijo -i (o _-y-i_ tras vocal). Se exige cuando el hablante fue testigo presencial y directo del evento.
- Pasado no atestiguado ( Past unwitnessed ): Lleva el sufijo -un / -ɨn / -in. Expresa hechos que el hablante no presenció directamente y es la forma predominante en historias, mitos y narraciones tradicionales.
- Tiempo General ( General tense ): Expresa acciones habituales, rutinarias o verdades permanentes. No utiliza el sufijo _-še_, sino que modifica la raíz verbal mediante el alargamiento de la vocal radical o la adición de sufijos con vocal larga como -yō, -yōy, -āy u -ōy.
- Futuro General: Se deriva agregando la partícula -da a la forma del Tiempo General.

---

=== 2. Tiempos Analíticos o Perifrásticos

Estas formas combinan un converbo, participio u infinitivo con el auxiliar de presente goli ("ser/estar", negativo _gobi_) o con el auxiliar de pasado/futuro -eč-:

- Presente progresivo: Combina el converbo imperfectivo en -še con el auxiliar goli para indicar una acción en desarrollo continuo.
- Habitual de pasado/general: Une el converbo en -še con el auxiliar -eč- flexionado en Tiempo General (_-ēč_).
- Pasado progresivo: Formado por el converbo en -še y el auxiliar -eč- en Pasado atestiguado (_-i_) o no atestiguado (_-un_).
- Pluscuamperfecto: Combina el converbo perfectivo (-un / -ɨn / -in) con el auxiliar -eč- en Pasado (atestiguado o no atestiguado), indicando un evento completado con anterioridad a otro punto del pasado.
- Resultativo: Formado por el converbo perfectivo en -un / -ɨn / -in y el auxiliar goli, para expresar una acción pasada con relevancia o resultado en el presente.
- Futuro definitivo: Combina el infinitivo en -a con el auxiliar goli para indicar eventos futuros seguros o decididos. (En el pasado, se combina el infinitivo con _-eč-_ en pasado).
- Futuro indefinido: Utiliza el participio de tiempo general en -dow / -dogu junto al auxiliar goli.
- Futuro intencional: Formado por el tema en -alaha (infinitivo + _-laha_) y el auxiliar goli para expresar acciones planificadas.

---

=== 3. Modos No Indicativos

- Imperativo: Expresa órdenes directas a la segunda persona mediante los sufijos -o, -a o -e.
- Prohibitivo (imperativo negativo): Se marca con el sufijo -bo acompañado del alargamiento de la vocal de la raíz verbal.
- Hortativo (incitación para la primera persona del plural): Se construye con la partícula hobo ("vamos") seguida del verbo en Presente simple.
- Optativo: Expresa deseos, peticiones o bendiciones mediante el sufijo -oλo (o _-λo_) adjunto a la raíz del imperativo.
- Deliberativo: Emplea el sufijo -lu / -alu sobre el tema de infinitivo en oraciones interrogativas para solicitar instrucciones o reflexionar sobre qué hacer.

---

=== 4. Marcas de Evidencialidad en la Oración Finitiva

En el sistema verbal finito, cada oración en tiempo pasado exige marcar obligatoriamente la fuente de información:

1. Evidencia directa (Atestiguada): Marcada en formas simples con el sufijo _-i_.
2. Evidencia indirecta (No atestiguada): Marcada en formas simples con el sufijo _-un_.
3. Inferencial: Expresada mediante la construcción resultativa o la combinación de converbos con el verbo auxiliar _-us-_ ("encontrar").
4. Reportativa / Citativa: Formada mediante la partícula citativa λin / λɨn (proveniente del converbo "habiendo dicho") adjunta al final de la cláusula.