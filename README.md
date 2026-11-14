# mi-conlang1 — Estructura, Fases y Contenido

Este repositorio contiene los avances en la creación de una lengua construida (*conlang*) que se lleva desarrollando desde hace varios años.

## Estructura y Fases del proyecto

### Fase 1: Research — Preparación e investigación (`0.1.x-pre-alpha`) 
- **Investigación y organización:** Creación del repositorio, estructura de carpetas y esquema general del índice en `main.typ`. Recopilación de notas sueltas, reglas, bases de datos, hojas de cálculo y estructura general del idioma.
- **Configuración tipográfica:** Diseño de la plantilla en Typst (estilos, fuentes, macros para glosas interlineales y tablas).

### Fase 2: Draft — Redacción de capítulos (`0.2.x-alpha`) 
Redacción formal de los capítulos en Typst (`.typ`) a partir de los borradores y notas previas:
- **Introducción y contexto:** Situación sociolingüística, historia, hablantes, metodología y abreviaturas.
- **Fonética y Fonología:** Inventario de vocales y consonantes, estructura silábica, acento y procesos fonológicos.
- **Morfología Nominal:** Sustantivos, pronombres, adjetivos, género, número, casos y clasificadores.
- **Morfología Verbal:** Tiempo, aspecto, modo (TAM), persona, voz, valencia y paradigmas de conjugación.
- **Otras clases de palabras y derivación:** Adverbios, adposiciones, conjunciones, partículas y formación de palabras.
- **Sintaxis:** Orden de constituyentes, tipos de oraciones (simples, compuestas, subordinadas), negación e interrogación.
- **Apéndices y textos glosados:** Inclusión de textos completos analizados, listas de verbos irregulares y léxico básico.

### Fase 3: Internal Review — Revisión interna (`0.3.x-pre-beta`) 
- **Revisión interna:** Lectura integral para unificar terminología, verificar referencias cruzadas en Typst y pulir el estilo.

### Fase 4: Peer Review — Revisión externa (`0.4.x-beta`) 
- **Borrador completo (Beta):** Manuscrito íntegro disponible de principio a fin para que colegas, lingüistas o estudiantes revisen ejemplos y den retroalimentación sobre la claridad de las explicaciones.

### Fase 5: Publication — Cierre y lanzamiento (`1.0.0`)
- **Primera Edición (Lanzamiento oficial):** Incorporación de las correcciones finales, maquetación definitiva y edición compilada (en PDF y web) lista para publicar, imprimir y citar.

## ¿Qué encontraré aquí?
- Herramientas en **Python**, **JavaScript** y **Typst** creadas para facilitar la generación de vocabulario, pruebas fonológicas y la redacción de la gramática en PDF.
- Un proceso de trabajo abierto y en tiempo real, con actualizaciones casi diarias tanto de contenido lingüístico como de diseño y código.
- Un espacio de aprendizaje continuo donde la lingüística y la programación avanzan sobre la marcha, sin un cronograma rígido.
- **Contacto y sugerencias:** Todas las críticas, dudas y aportes son bienvenidos. Como no uso redes sociales activas, puedes escribirme abriendo un mensaje en la pestaña de [Issues](../../issues).

## Contenido del repositorio

| Carpeta | Descripción | Estado |
| :--- | :--- | :--- |
| `Grammar/` | Código fuente en **Typst** (`main.typ`) de la gramática. Se compila automáticamente a PDF en cada actualización. | En redacción |
| `LexiconBuilder/` | Scripts en **Python** y **JS**, además de colecciones en **CSV** y objetos JS para desplegar un diccionario web. | Próximamente |
| `WebPlay/` | Generadores de sílabas y transcriptores de caracteres para probar cambios fonológicos y morfosintácticos en el día a día. | Uso activo |
| `AHK/`, `notasObsidian/`, `oldGrammar/` | Borradores antiguos, notas personales y pruebas históricas de referencia para el autor. | Archivo |

## Enlaces directos
- **Sitio web del proyecto:** [https://ricvento.github.io/mi-conlang1/](https://ricvento.github.io/mi-conlang1/)
- **Gramática en PDF (última compilación):** [Ver o descargar PDF](https://github.io) \[Proximamente\]
- **Historial de avances:** Consulta los cambios y nuevas secciones agregadas en el archivo [CHANGELOG.md](CHANGELOG.md).
