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
	'bɣ','dɣ','dzɣ',
	'pχ','tχ','tsχ','qχ',
	'ʢ', // = ʕ	
	'ʔ', // = ˀ
	'dz','dʒ', // = z, ʒ
	'st','sk','sp',
	
	// labializadas
	'bɣʷ','dɣʷ','dzɣʷ',
	'pχʷ','tχʷ','tsχʷ','qχʷ',
	'ʢʷ',
	'ʔʷ',
	'dzʷ','dʒʷ',
	'stʷ','skʷ','spʷ',
];

const mid = [
	'pː','tː','kː','sː','ʃː','tsː','tʃː',
	'χː', // = q:
	'q', // = qχ
	'ɣ', // = ʕ
	'ˀ', // = ʔ
	
	// labializadas
	'pːʷ','tːʷ','kːʷ','sːʷ','ʃːʷ','tsːʷ','tʃːʷ',
	'χːʷ',
	'qʷ',
	'ɣʷ',
	'ˀʷ',
];

const iniMid = [
	'b','d','g',
	'p','t','k','ts','tʃ','tɬ',
	'pʼ','tʼ','kʼ','qʼ','tsʼ','tʃʼ','tɬʼ',
	's','ʃ','χ',
	'r','l','ɬ','m','n','w','j',
	'ħ','h',
	'ʁ','z','ʒ',
	
	// labializadas
	'bʷ','dʷ','gʷ',
	'pʷ','tʷ','kʷ','tsʷ','tʃʷ','tɬʷ',
	'pʼʷ','tʼʷ','kʼʷ','qʼʷ','tsʼʷ','tʃʼʷ','tɬʼʷ',
	'sʷ','ʃʷ','χʷ',
	'rʷ','lʷ','ɬʷ','mʷ','nʷ','ww','jʷ',
	'ħʷ','hʷ',
	'ʁʷ','zʷ','ʒʷ',
];

const end = [
	'p','t','k','q','ts',
	'b','d','g','ʁ','dz',
	's','ʃ','χ','dʒ',
	'z','ʒ','tʃ',
	'r','l','ɬ','m','n',
	'w','j','ʔ','h','ʕ',
	'st','sk',	
	'rt','rs',
	
	// labializadas
	'pʷ','tʷ','kʷ','qʷ','tsʷ',
	'bʷ','dʷ','gʷ','ʁʷ','dzʷ',
	'sʷ','ʃʷ','χʷ','dʒʷ',
	'zʷ','ʒʷ','tʃʷ',
	'rʷ','lʷ','ɬʷ','mʷ','nʷ',
	'ww','jʷ','ʔʷ','hʷ','ʕʷ',
	'stʷ','skʷ',
	'rtʷ','rsʷ',
];

const clust = [
	'lb','ld','lg','lj','lk','lkʼ','lm','ln','lp','lpʼ','lq','lqʼ','ls','lʃ','lt','lts','ltsʼ','ltʃ','ltʃʼ','ltʼ','lz','lʒ','lχ',
	'nb','nd','ng','nj','nk','nkʼ','nɬ','np','npʼ','nq','nqʼ','ns','nʃ','nt','nts','ntsʼ','ntʃ','ntʃʼ','ntʼ','nz','nʒ','nχ',
	'rb','rd','rg','rj','rk','rkʼ','rl','rm','rn','rp','rpʼ','rq','rqʼ','rs','rʃ','rt','rts','rtsʼ','rtʃ','rtʃʼ','rtʼ','rz','rʒ','rχ',
	'sb','sd','sg','sk','skʼ','sl','sm','sn','sp','spʼ','sq','sqʼ','st','stʼ','sχ',
	'ʃb','ʃd','ʃg','ʃk','ʃkʼ','ʃl','ʃm','ʃn','ʃp','ʃpʼ','ʃq','ʃqʼ','ʃt','ʃtʼ','ʃχ',
	'χb','χd','χk','χkʼ','χm','χn','χp','χpʼ','χs','χʃ','χt','χts','χtsʼ','χtʃ','χtʃʼ','χtʼ',
];

const onset = [...new Set([...ini, ...iniMid])].sort((a, b) => a.localeCompare(b));

const medial = [...new Set([...mid, ...clust])].sort((a, b) => a.localeCompare(b));

const coda = end.sort((a, b) => a.localeCompare(b));

const vowels = [
	//'a','i','u',
	//'aː','iː','uː',
	'a','aː','ə','əː',
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

];


function reemplazarPares(str) {
	const pares = {
		'ʷəː': 'y',		
		'ʷaː': 'we',		
		'ʷə': 'œ',		
		'ʷa': 'wo',	
		'aː': 'e',
		'əː': 'i',		
		'a': 'a',
		'ə': 'u',
	};	
	// Creamos una expresión regular que busque todas las claves del objeto: /e|sa/g
	const expresion = new RegExp(Object.keys(pares).join('|'), 'g');
  
	return str.replace(expresion, (coincidencia) => pares[coincidencia]);
}