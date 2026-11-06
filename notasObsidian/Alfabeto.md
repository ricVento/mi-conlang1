Aqui se estudia la escritura del idioma, si prefiere un estudio más detallado de [[Fonología]], revise la seccion correspondiente.
El idioma no tiene escritura normativa, esta gramatica no pretende proveerle un alfabeto. La elección del alfabeto ha causado no pocos conflictos por rencillas políticas, étnicas y religiosas.
El alfabeto utilizado hoy en día sigue la lógica de otras lenguas del caucaso, haciendo uso del cirílico de Daguestán, aunque sustituye el signo *palochka* por el signo duro, tomas caracteres de lenguas de la estepa túrquica y hace dígrafos diferentes al Avar. 
Tambien existe un alfabeto latino regido por convenciones tomadas del turco y el azerí, pero de uso más restringido.
En este tratado uso un sistema convencional propio que resulta un híbrido entre caracteres IPA con los del antiguo sistema _americanista_. La prioridad es transmitir la acústica del idioma.
A continucion muestro una tabla de equivalencias

| IPA  | Cirílico | Latino | Cometarios                          |
| :--: | :------: | :----: | :---------------------------------- |
|  ɑ   |    а     |   a    |                                     |
|  b   |    б     |   b    |                                     |
|  dʒ  |    дж    |   c    |                                     |
|  tʃ  |    ч     |   ç    |                                     |
| tʃˀ  |    чъ    |   çʼ   |                                     |
| tʃʷ  |    чв    |   çv   |                                     |
|  dz  |    дз    |   d    | Solo en posición inicial de palabra |
|  d   |    д     |   dz   |                                     |
|  ə   |    е     |   e    | originalmente *i* faringeal         |
|  ɸ   |    ф     |   f    | originalmente *hw*                  |
|  ɡ   |    г     |   g    |                                     |
|  ɡʷ  |    гв    |   gv   |                                     |
|  ʁ   |    хъ    | ğ, gh  |                                     |
|  ʁʷ  |   хъв    |   ğv   | complementaria con *ghv*            |
|  h   |    гь    |   h    |                                     |
|  ɪ   |    и     |   i    |                                     |
|  ʒ   |    ж     |   j    |                                     |
|  k   |    к     |   k    |                                     |
|  kˀ  |    къ    |   kʼ   |                                     |
|  kʷ  |    кв    |   kv   |                                     |
|  l   |    л     |   l    |                                     |
|  ɬ   |    лъ    |   ll   |                                     |
|  m   |    м     |   m    |                                     |
|  n   |    н     |   n    |                                     |
|  ɤ   |    о     |   o    | originalmente *u* faringeal         |
|  p   |    п     |   p    |                                     |
|  pˀ  |    пъ    |   pʼ   | Fonema muy raro                     |
|  qχ  |    гх    |   q    |                                     |
|  qˀ  |    кх    |   qʼ   |                                     |
|  qʷ  |   гхв    |   qv   |                                     |
| ʕ, q |    кь    |   qh   |                                     |
|  ɾ   |    р     |   r    |                                     |
|  s   |    с     |   s    |                                     |
|  ʃ   |    ш     |   ş    |                                     |
|  t   |    т     |   t    |                                     |
|      |    тъ    |   tʼ   |                                     |
|      |    тв    |   tv   |                                     |
|      |    ц     |   ts   |                                     |
|      |    цъ    |  tsʼ   |                                     |
|      |    цв    |  tsv   |                                     |
|      |    у     |   u    |                                     |
|      |    в     |   v    | originalmente *w*                   |
|      |    х     |   x    |                                     |
|      |    хв    |   xv   | complementaria con *xhv*            |
|      |    хь    |   xh   |                                     |
|      |    й     |   y    |                                     |
|      |    з     |   z    |                                     |
|      |    зв    |   zv   |                                     |
|      |    ы     |   ə    | originalmente *a* faringeal         |



ones de la Teoría de la Optimidad Armónica (HG):

$P(C_{1}VC_{2})=w_{1}\cdot C_{\text{Margen}}(C_{1})+w_{2}\cdot C_{\text{Margen}}(C_{2})+w_{3}\cdot \text{Dist}_{SSP}(C_{1},V,C_{2})+w_{4}\cdot \text{Penaliz}_{\text{Laríngea}}(C_{1},C_{2})$

2. Distancia de Sonoridad Diferencial $x(\text{Dist}_{SSP}$)

Para evaluar la transición C₁ → V → C₂, tu sistema analítico debe asignar un valor numérico a la escala de sonoridad del K'iche':

$\text{Ocl\ (1)}<\text{Afr\ (2)}<\text{Fric\ (3)}<\text{Nas\ (4)}<\text{Liq\ (5)}<\text{Semiv\ (6)}<\text{Voc\ (7)}$

El algoritmo calcula la optimización de los dos perfiles de la sílaba CVC:

1. **Pendiente de Ataque:** $\Delta_{\text{ONS}} = \text{Sonoridad}(V) - \text{Sonoridad}(C_1)$
2. **Pendiente de Coda:** $\Delta_{\text{COD}} = \text{Sonoridad}(V) - \text{Sonoridad}(C_2)$

- **Regla del K'iche':** El K'iche' prefiere maximizar $\Delta _{\text{ONS}}$ (ataques de baja sonoridad como oclusivas /p, t, k/) y prefiere codas que minimicen $\Delta _{\text{COD}}$ o que mantengan un perfil de sonoridad descendente limpio. Las codas con fricativas /s, x/ u oclusivas son perfectamente legítimas, pero las líquidas /l, r/ en coda reciben la menor penalización por SSP.

---

El número de vocales es $V \approx e + 2 \phi$
El número de consonantes es $C \approx V(2e +\phi)$
Para encontrar la distribución de frecuencias de fonemas seguimos la fórmula $$\left(\frac{\phi}{\phi + k-1}\right)^{\phi - 1}$$
Donde $k$ es la posición del fonema.
Para encontrar el % de frecuencias se normaliza hallando el coeficiente $C$ realizando la suma para todos los $k$ y ejecutando $$\left(\frac{C}{1 + \frac{k-1}{\phi}}\right)^{\phi - 1}$$
Para asignar los coeficientes NAD no vamos a usar numeros arbitrarios sino que usaremos la función $$1-e^{-\frac{k}{e}}$$
.