// La "Tabla de Arcilla": Para el Creador de Sílabas
const transcriptionMap = {
'0': 'gʷ','1': 'kʷ','2': 'tʃʷ','3': 'qʷ','4': 'tsʷ','5': 'sʷ','6': 'ʃʷ','7': 'tʷ','8': 'χʷ','9': 'ʁʷ','A': 'ɑ',
'a': 'a','á': 'ɑː','à': 'ɐ','â': 'ʌ','ä': 'æ','b': 'b','B': 'ˀ','c': 'ts','C': 'tsʼ','ç': 'tʃ','Ç': 'tʃʼ','d': 'd',
'D': 'dz','e': 'e','E': 'je','é': 'ɵ','è': 'ɛ','ê': 'ɜ','ë': 'ə','f': 'f','F': 'ˁ','g': 'ɡ','V': 'ɣ','h': 'h',
'H': 'ħ','I': 'ʔ','i': 'i','í': 'iː','ì': 'ʲ','î': 'ɪ','ï': 'ɨ','J': 'dʒ','j': 'j','k': 'k','K': 'kʼ','l': 'l',
'L': 'ɬ','m': 'm','M': 'ʼ','n': 'n','N': 'ː','ñ': 'ʰ','Ñ': 'qχ','o': 'o','O': 'œ','ó': 'ɤ','ò': 'ɒ','ô': 'ɔ','ö': 'ø',
'p': 'p','P': 'pʼ','q': 'q','Q': 'qχʼ','R': 'ʁ','r': 'ɾ','s': 's','S': 'ʃ','t': 't','T': 'tʼ','u': 'u','U': 'y',
'ú': 'uː','ù': 'ʋ','û': 'ʊ','ü': 'ʷ','G': 'ʕ','v': 'v','W': 'wo','w': 'w','x': 'x','X': 'χ','y': 'tɬ','Y': 'tɬʼ',
'Z': 'ʒ','z': 'z',
};

function transcribir_IPA(cadenaASCII) {
	return Array.from(cadenaASCII)
		.map(letra => transcriptionMap[letra] !== undefined ? transcriptionMap[letra] : letra)
		.join('');
}