// La 'Tabla de Arcilla': 1 caracter = 1 fonema
const transcriptionMap = {
	'0': 'gʷ',	'1': 'kʷ',	'2': 'tʃʷ',	'3': 'qχʷ',	'4': 'tsʷ',	'5': 'sʷ',	'6': 'ʃʷ',	'7': 'tʷ',	'8': 'χʷ',	'9': 'ʁʷ',	'_': 'ː',	'A': 'ɑ',	'a': 'æ',	'ª': 'ʰ',	'á': 'ʌ',	'à': 'ɒ',	'â': 'a',	'b': 'b',	'B': 'ʋ',	'c': 'ts',	'C': 'tsʼ',	'ç': 'tʃ',	'Ç': 'tʃʼ',	'd': 'd',	'D': 'dz',	'e': 'e',	'E': 'ɛ',	'è': 'ɜ',	'ë': 'ə',	'F': 'ˁ',	'f': 'f',	'g': 'ɡ',	'G': 'ʕ',	'h': 'h',	'H': 'ħ',	'i': 'i',	'I': 'ɪ',	'î': 'ɨ',	'ï': 'ʲ',	'J': 'dʒ',	'j': 'j',	'k': 'k',	'K': 'kʼ',	'l': 'l',	'L': 'ɬ',	'M': 'ˀ',	'm': 'm',	'n': 'n',	'N': 'ʔ',	'ñ': 'ɥ',	'Ñ': 'qχ',	'o': 'o',	'O': 'œ',	'º': 'ʼ',	'ó': 'ɤ',	'ò': 'ɔ',	'ö': 'ø',	'p': 'p',	'P': 'pʼ',	'q': 'q',	'Q': 'qχʼ',	'r': 'ɾ',	'R': 'ʁ',	's': 's',	'S': 'ʃ',	't': 't',	'T': 'tʼ',	'u': 'u',	'U': 'ʊ',	'ü': 'y',	'V': 'ɣ',	'v': 'v',	'w': 'w',	'W': 'ʷ',	'x': 'x',	'X': 'χ',	'y': 'ƛ',	'Y': 'ƛʼ',	'ý': 'ƛ',	'z': 'z',	'Z': 'ʒ',
};

function transcribir_IPA(cadenaASCII) {
	return Array.from(cadenaASCII)
		.map(letra => transcriptionMap[letra] !== undefined ? transcriptionMap[letra] : letra)
		.join('');
		
	// Transcribe a IPA
	// const ipa_array = valid_array.map(str => transcribir_IPA(str));		
}

// Variables para Combinatoria
const ini = [
	'bɣ','dɣ','dzɣ','dʒɣ',
	'pχ','tχ','tsχ','tʃχ','kx','qχ',
	'ʢ', // = ʕ	
	'dz','dʒ', // = z, ʒ
	'ʃt','ʃk','ʃp',
	'st','sk','sp',
];

const mid = [
	'pː','tː','kː','sː','ʃː','tsː','tʃː',
	'χː', // = q:
	'ɣ', // = ʕ
];

const iniMid = [
	'b','d','g',
	'p','t','k','q','ts','tʃ','tɬ',
	'pʼ','tʼ','kʼ','qʼ','tsʼ','tʃʼ','tɬʼ',
	's','ʃ','χ',
	'r','l','ɬ','m','n','w','j','ʔ',
	'ħ','h',
	'ʁ','z','ʒ',
];

const end = [
	'p','t','k','q','ts',
	'b','d','g','ʁ','dz',
	's','ʃ','χ','dʒ',
	'z','ʒ','tʃ',
	'r','l','ɬ','m','n',
	'w','j','ʔ','h','ʕ',
	'ʃt','ʃk',
	'st','sk',	
	'rd','rt','rʃ','rs',
];

const clust = [
	'lb','ld','lg','lj','lk','lkʼ','lm','ln','lp','lpʼ','lq','lqʼ','ls','lʃ','lt','lts','ltsʼ','ltʃ','ltʃʼ','ltʼ','lz','lʒ','lχ','lw',
	'nb','nd','ng','nj','nk','nkʼ','nɬ','np','npʼ','nq','nqʼ','ns','nʃ','nt','nts','ntsʼ','ntʃ','ntʃʼ','ntʼ','nz','nʒ','nχ','nw',
	'rb','rd','rg','rj','rk','rkʼ','rl','rm','rn','rp','rpʼ','rq','rqʼ','rs','rʃ','rt','rts','rtsʼ','rtʃ','rtʃʼ','rtʼ','rz','rʒ','rχ','rw',
	'sb','sd','sg','sk','skʼ','sl','sm','sn','sp','spʼ','sq','sqʼ','st','stʼ','sχ','sw',
	'ʃb','ʃd','ʃg','ʃk','ʃkʼ','ʃl','ʃm','ʃn','ʃp','ʃpʼ','ʃq','ʃqʼ','ʃt','ʃtʼ','ʃχ','ʃw',
	'χb','χd','χk','χkʼ','χm','χn','χp','χpʼ','χs','χʃ','χt','χts','χtsʼ','χtʃ','χtʃʼ','χtʼ','χw',
];

const onset = [...new Set([...ini, ...iniMid])].sort((a, b) => a.localeCompare(b));

const medial = [...new Set([...mid, ...clust])].sort((a, b) => a.localeCompare(b));

const coda = end.sort((a, b) => a.localeCompare(b));

const vowels = [
	'a','i','u',
	'aː','iː','uː',
	'wa','wi',
];

/*
	S	LH	HL
	bɑ	bwɔ	bʌə
	bæ	bjɛ	bea
	bɪ	biː	bɪə
	bʊ	buː	bʊə
	by	bɥœ	byə

	ə = y = œ
*/

const regExpRules = [
	/wu/,
	/ji/,
	/[ɬħʔʢɣwjʼː]w/,
	// for wordbuilding
	/([ːʼɬɣ]).+\1/,
	/ː[^aiu]{2,}/,
];


function reemplazarPares(str) {
	const pares = {
		'aː': 'a',
		'iː': 'i',
		'uː': 'u',
		'a': 'ɔ',
		'i': 'e',
		'u': 'œ',
		'wa': 'wɑ',
		'wi': 'ɨ',	
				
		//'wə': '','ja': 'jæ','ju': 'y','jə': 'ɥœ','əː': 'ɑɛ',		
	};	
	// Creamos una expresión regular que busque todas las claves del objeto: /e|sa/g
	const expresion = new RegExp(Object.keys(pares).join('|'), 'g');
  
	return str.replace(expresion, (coincidencia) => pares[coincidencia]);
}

function adaptaVocales(str) {
    // 1. Definimos las reglas por grupos de caracteres
    const reglasGrupo1 = { 'a': 'o', 'e': 'i', 'o': 'u' }; // Reglas para el grupo [kXq]
    const reglasGrupo2 = { 'a': 'e', 'e': 'a' };           // Ejemplo de reglas para otro grupo

    // Mapeamos qué letras pertenecen a qué grupo
    const grupos = {
        'k': reglasGrupo1, 'X': reglasGrupo1, 'q': reglasGrupo1,
        'p': reglasGrupo2, 'm': reglasGrupo2
    };

    // 2. Expresión regular adaptada:
    // ([kXqpMm...]) -> Primer grupo: los caracteres disparadores
    // ('?)          -> Segundo grupo: el apóstrofe opcional (el signo ? significa 0 o 1 ocurrencia)
    // ([aeiouAEIOU])-> Tercer grupo: la vocal
    const regex = /([kXqpMm])('?)([aeiouAEIOU])/g;

    return str.replace(regex, (match, disparador, intercalado, vocalOriginal) => {
        // Seleccionamos el grupo de reglas que le corresponde a la letra
        const reglasDelGrupo = grupos[disparador];

        // Si la letra no tiene grupo asignado, devolvemos el texto original
        if (!reglasDelGrupo) return match;

        // Buscamos el cambio correspondiente a la vocal en ese grupo
        const cambio = reglasDelGrupo[vocalOriginal];

        // Reconstruimos la cadena: Letra + Carácter Intercalado + (Vocal nueva o la original)
        return disparador + intercalado + (cambio || vocalOriginal);
    });
}


