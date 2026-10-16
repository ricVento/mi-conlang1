// La 'Tabla de Arcilla': 1 caracter = 1 fonema
const transcriptionMap = {
	'0': 'gʷ',
	'1': 'kʷ',
	'2': 'tʃʷ',
	'3': 'qχʷ',
	'4': 'tsʷ',
	'5': 'sʷ',
	'6': 'ʃʷ',
	'7': 'tʷ',
	'8': 'χʷ',
	'9': 'ʁʷ',
	'_': 'ː',
	'A': 'ɑ',
	'a': 'æ',
	'ª': 'ʰ',
	'á': 'ʌ',
	'à': 'ɒ',
	'â': 'a',
	'b': 'b',
	'B': 'ʋ',
	'c': 'ts',
	'C': 'tsʼ',
	'ç': 'tʃ',
	'Ç': 'tʃʼ',
	'd': 'd',
	'D': 'dz',
	'e': 'e',
	'E': 'ɛ',
	'è': 'ɜ',
	'ë': 'ə',
	'F': 'ˁ',
	'f': 'f',
	'g': 'ɡ',
	'G': 'ʕ',
	'h': 'h',
	'H': 'ħ',
	'i': 'i',
	'I': 'ɪ',
	'î': 'ɨ',
	'ï': 'ʲ',
	'J': 'dʒ',
	'j': 'j',
	'k': 'k',
	'K': 'kʼ',
	'l': 'l',
	'L': 'ɬ',
	'M': 'ˀ',
	'm': 'm',
	'n': 'n',
	'N': 'ʔ',
	'ñ': 'ɥ',
	'Ñ': 'qχ',
	'o': 'o',
	'O': 'œ',
	'º': 'ʼ',
	'ó': 'ɤ',
	'ò': 'ɔ',
	'ö': 'ø',
	'p': 'p',
	'P': 'pʼ',
	'q': 'q',
	'Q': 'qχʼ',
	'r': 'ɾ',
	'R': 'ʁ',
	's': 's',
	'S': 'ʃ',
	't': 't',
	'T': 'tʼ',
	'u': 'u',
	'U': 'ʊ',
	'ü': 'y',
	'V': 'ɣ',
	'v': 'v',
	'w': 'w',
	'W': 'ʷ',
	'x': 'x',
	'X': 'χ',
	'y': 'tɬ',
	'Y': 'tɬʼ',
	'ý': 'ƛ',
	'z': 'z',
	'Z': 'ʒ',
};

function transcribir_IPA(cadenaASCII) {
	return Array.from(cadenaASCII)
		.map(letra => transcriptionMap[letra] !== undefined ? transcriptionMap[letra] : letra)
		.join('');
		
	// Transcribe a IPA
	// const ipa_array = valid_array.map(str => transcribir_IPA(str));		
}

// Variables para Combinatoria
const ini = [ // solo iniciales
	'ʕ', // sustituye ɣ
	'dz','dʒ', // sustituye z, ʒ
	'bɣ','pχ','pχʼ', // africadas solo iniciales
	'dɣ','tχ','tχʼ',
	'kx','kxʼ',
	'qχ','qχʼ', // sustituye q χʼ
];

const mid = [ // solo mediales
	'ɣ', // sustituye ʕ
	'q','χʼ', // sustituye qχ qχʼ
	'pː','tː','kː','χː','sː','ʃː','tsː','tʃː', // geminadas solo mediales
];

const iniMid = [ // nunca finales
	'd','ɡ','b','z','ʒ','ʁ', // sonoras finales
	'pʼ','tʼ','kʼ','tsʼ','tʃʼ','tɬʼ', // eyectivas finales	
	'h','ħ', // postuvulares finales
	'tʷ','ɡʷ','kʷ','zʷ','sʷ','ʃʷ','ʒʷ','tsʷ','tʃʷ','qχʷ','χʷ','hʷ','ʁʷ', // labializadas finales
];

const anyPos = [ // cualquier posición
	'ʔ',
	'p','t','k',
	's','ʃ',
	'ts','tʃ',
	'tɬ',
	'χ',
	'ɾ','l','ɬ',
	'm','n',
	'w','j',
];

const end = [
	'q', // susituye qχ, tambien esta en mid
];
	
// rr, ll como geminacion enfatica
// w = v delante de vocales anteriores	
// hʷ = f

const onset = [...new Set([...ini, ...iniMid, ...anyPos])].sort((a, b) => a.localeCompare(b));

const vowels = ['ɑ','æ','ɪ','ʊ','ə','ɑː','ɛː','iː','uː','əː'];

const medial = [...new Set([...mid, ...iniMid, ...anyPos])].sort((a, b) => a.localeCompare(b));

const coda = [...new Set([...end, ...anyPos])].sort((a, b) => a.localeCompare(b));

/*
	S	LH	HL
	bɑ	bwɔ	bʌə
	bæ	bjɛ	bea
	bɪ	biː	bɪə
	bʊ	buː	bʊə
	by	bɥœ	byə

	ə = y = œ
*/
		
// Reglas para CV
const rules = [
//,
];	