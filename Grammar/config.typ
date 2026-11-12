// Importar el paquete oficial eggs para lingüística
#import "@preview/eggs:0.10.0": *
#import abbreviations as abb

#let _aor = abbreviation("aor", "aoristo")
#let _prs = abbreviation("prs", "presente, presentativo")
#let _pst = abbreviation("pst", "pasado")
#let _fut = abbreviation("fut", "futuro")
#let _even = abbreviation("even", "eventual")
#let _pf = abbreviation("pf", "perfecto")
#let _pfv = abbreviation("pfv", "aspecto perfectivo")
#let _ppf = abbreviation("ppf", "pluperfecto")
#let _impf = abbreviation("impf", "imperfecto")
#let _ipfv = abbreviation("ipfv", "aspecto imperfectivo")
#let _enun = abbreviation("enun", "enunciativo")
#let _invol = abbreviation("invol", "involuntario, accidental")

#let _ind = abbreviation("ind", "modo indicativo")
#let _evi = abbreviation("evi", "evidencial")
#let _ded = abbreviation("ded", "deductivo")
#let _infer = abbreviation("infer", "inferencial")
#let _deb = abbreviation("deb", "debitivo")
#let _oblig = abbreviation("oblig", "obligativo")
#let _recom = abbreviation("recom", "recomendador")

#let _subj = abbreviation("subj", "subjuntivo")
#let _hip = abbreviation("hip", "hipotetico")
#let _int = abbreviation("int", "intencional")
#let _opt = abbreviation("opt", "optativo")
#let _des = abbreviation("des", "desiderativo")
#let _pot = abbreviation("pot", "potencial")
#let _cond = abbreviation("cond", "condicional")
#let _perm = abbreviation("perm", "permisivo")
#let _trun = abbreviation("trun", "truncado")


#let _abs = abbreviation("abs", "absolutivo")
#let _part = abbreviation("part", "partitivo, genitivo 2")
#let _ad = abbreviation("ad", "orientacion espacial 'en' \npunto de referencia ")
#let _ante = abbreviation("ante", "orientacion espacial 'delante de'")
#let _apud = abbreviation("apud", "orientacion espacial 'cerca de, al lado de'")
#let _in = abbreviation("in", "orientacion espacial 'dentro de'")
#let _post = abbreviation("post", "orientacion espacial 'detrás de'")
#let _sub = abbreviation("sub", "orientacion espacial 'debajo de'")
#let _super = abbreviation("super", "orientacion espacial 'encima de, sobre'")

#let _esi = abbreviation("esi", "direccion espacial esivo \n'en un lugar estático'")
#let _lat = abbreviation("lat", "direccion espacial lativo \n'hacia un destino específico'")
#let _vers = abbreviation("vers", "direccion espacial versativo \n'hacia una dirección general'")
#let _ela = abbreviation("ela", "direccion espacial elativo \n'desde un origen'")
#let _trans = abbreviation("trans", "direccion espacial translativo \n'a través de'")
#let _term = abbreviation("term", "direccion espacial terminativo \n'hasta un punto concreto'")

#let _i = abbreviation("i", "clase nominal 1 \nmasculino humano")
#let _ii = abbreviation("ii", "clase nominal 2 \nfemenino humano")
#let _iii = abbreviation("iii", "clase nominal 3 \nanimado no humano")
#let _iv = abbreviation("iv", "clase nominal 4 \ninanimado")
#let _v = abbreviation("v", "clase nominal 5 \ninanimado")

#let _x = "Aghwar"

#let asterismo = {
  v(1em)
  align(center)[\* \* \*]
  v(1em)
}

// Configuración estética de la gramática
#let configuracion_gramatica(doc) = {
  set page(
    paper: "a4",
    margin: (x: 3cm, y: 4cm),
	
	// INSERTA MARCA DE SECCION EN ENCABEZADO DE PAGINA
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
        if cap.body == [Contenido] or cap.body == [Ortografia] or cap.body == [Agradecimientos] {
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
  
  show heading.where(level: 1): it => block(
    above: 2.5em,
    below: 1.2em,
    text(size: 20pt, weight: "bold", it)
  )
  
  show heading.where(level: 2): it => block(
    above: 2em,
    below: 1em,
    text(size: 16pt, weight: "bold", it)
  )  

  show heading.where(level: 3): it => block(
    above: 2em,
    below: 1em,
    text(size: 12pt, weight: "bold", it)
  )  

  show heading.where(level: 4): it => block(
    above: 1.5em,
    below: 1em,
    text(style: "italic", weight: "bold", it)
  ) 
  
  set enum(indent: 10pt, full: true)

  // PONE TITULOS DE TABLAS ARRIBA-IZQUIERDA
  set figure.caption(position: top)
  show figure.caption: set align(left)
  
  // TRANSFORMA EN VERSALITAS SI PRECEDE 0
  show regex("\b0(\w+)\b"): coincidencia => {
    let texto = coincidencia.text
    let texto-limpio = texto.slice(1) 
    smallcaps(all: true)[#texto-limpio]
  }
  
  // INSERTA § EN REFERENCIA CRUZADA
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