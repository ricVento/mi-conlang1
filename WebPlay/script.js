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
const cons = [
	'b','p','pʼ','pː',
	'd','t','tʼ','tː',
	'g','k','kʼ','kː',
	'q','qʼ','qː',	
	'ʁ','χ','ɣ',
	'z','s','sː',
	'ʒ','ʃ','ʃː',
	'ʑ','ɕ','ɕː',
	'dz','ts','tsʼ','tsː',
	'dʒ','tʃ','tʃʼ','tʃː',	
	'dʑ','tɕ','tɕʼ','tɕː',
	'tɬ','tɬʼ',	
	'h','ħ',
	'r','l','ɬ',
	'm','n',
	'w','j',	
	
	'ʔ','ʢ',	
	
	'rs','rt',	
	'st','sk',
	'bɣ','dɣ',
	'pχ','tχ',		
	'sχ','tsχ',	
];

const clust = [
	'lb','ld','lg','lj','lk','lkʼ','lm','ln','lp','lpʼ','lq','lqʼ','ls','lʃ','lt','lts','ltsʼ','ltʃ','ltʃʼ','ltʼ','lz','lʒ','lχ',
	'nb','nd','ng','nj','nk','nkʼ','nɬ','np','npʼ','nq','nqʼ','ns','nʃ','nt','nts','ntsʼ','ntʃ','ntʃʼ','ntʼ','nz','nʒ','nχ',
	'rb','rd','rg','rj','rk','rkʼ','rl','rm','rn','rp','rpʼ','rq','rqʼ','rs','rʃ','rt','rts','rtsʼ','rtʃ','rtʃʼ','rtʼ','rz','rʒ','rχ',
	'sb','sd','sg','sk','skʼ','sl','sm','sn','sp','spʼ','sq','sqʼ','st','stʼ','sχ',
	'ʃb','ʃd','ʃg','ʃk','ʃkʼ','ʃl','ʃm','ʃn','ʃp','ʃpʼ','ʃq','ʃqʼ','ʃt','ʃtʼ','ʃχ',
	'χb','χd','χk','χkʼ','χm','χn','χp','χpʼ','χs','χʃ','χt','χts','χtsʼ','χtʃ','χtʃʼ','χtʼ',
];

const labCons = cons.map(str => `${str}ʷ`);

const onset = [...new Set([...cons, ...labCons])];

const medial = [...new Set([...cons, ...clust])].sort((a, b) => a.localeCompare(b));

const coda = cons.sort((a, b) => a.localeCompare(b));

const vowels = [
	'a','ə',
	'aj','əj',
	'aw','əw',
];

const regExpRules = [
	// restricciones generales
	/[wʔʢ]ʷ/,
	/jj|ww/,
	
	// iniciales prohibidas
	/^r[st]/,
	/^ɣ/,
	/^(t)?[kptqsʃɕʑ]ː/,
	
	// finales prohibidas
	/[ːɣʢ]$/,
	/[pts]χ(ʷ)?$/,
	/[ʼːɣ]ʷ$/,
	/(d)?[ʒʑ]$/,
	/dz$/,
	/ʼ$/,
	/tɬ$/,
	
	// mediales prohibidas
];

	/*
	/[ʷw]u|u(ː)?[ʷw]/,
	/ji/,
	/[ʷw].*[ʷwu]/,
	/[ʔħʢ][ʷw]/,
	// for wordbuilding only
	/([ːʼɬɣwʷ]).+\1/,
	/i(ː)?j/,
	/u(ː)?[ʷw]/,	
	*/

function reemplazarPares(str) {
	const pares = {			
		'ʷaː': 'we',		
		'ʷə': 'œ',		
		'ʷa': 'o',
		'aj': 'e',
		'aw': 'o',
		'əj': 'i',
		'əw': 'u',		
		'aː': 'a',	
		'a': 'e',
		'ə': 'u',
	};	
	
	// Creamos una expresión regular que busque todas las claves del objeto: /e|sa/g
	const expresion = new RegExp(Object.keys(pares).join('|'), 'g');
  
	return str.replace(expresion, (coincidencia) => pares[coincidencia]);
}

/*

	aː
	a
	ə
	aj
	əj
	aw
	əw
	ʷaː
	ʷa
	ʷə
	ʷaj
	ʷəj
	ʷaw
	ʷəw

*/