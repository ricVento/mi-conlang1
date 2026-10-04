// La "Tabla de Arcilla": Para el Creador de Sílabas
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
const onset = ['ʔ','b','d','dˁ','dz','dʒ','f','ɡ','gʷ','ʕ','ɣ','h','ħ','j','k','kː','kʼ','kʷ','l','ɬ','m','n','p','pː','pʼ','qχ','qχʼ','qχʷ','ɾ','s','sː','sʷ','sˁ','ʃ','ʃː','ʃʷ','t','tː','tˁ','tʷ','tʼ','ts','tsː','tsʼ','tsʷ','tʃ','tʃː','tʃʼ','tʃʷ','tɬ','tɬʼ','x','χ','χː','χʷ','ʁ','ʁʷ','v','w','z','ʒ'];

const vowels = ['ɑ','æ','je','ɛː','ɪ','iː','œ','wo','ɥœ','ʊ','y','uː'];
		
// Reglas para CV
const rules = [
	/ʷ.*[wœɥyujʊː]/, // labial + redondeada/larga
	/ː.+ː/, // geminada + larga
	//, // intensas solo con faringeales
];	