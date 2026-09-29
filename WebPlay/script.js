// La "Tabla de Arcilla": Para el Creador de Sílabas
const transcriptionMap = {
	'0': 'ɡʷ', '1': 'kʷ', '2': 'χʷ', '3': 'qʷ', '4': 'ʁʷ',
	'5': 'tv', '6': 'tsv', '7': 'sv', '8': 'tʃv', '9': 'ʃv',
	'a': 'æ', 'A': 'ɑ', 'i': 'i', 'e': 'e', 'o': 'o', 'u': 'u',
	'b': 'b', 'c': 'ts', 'C': 'tsʼ', 'ç': 'tʃ', 'Ç': 'tʃʼ',
	'D': 'dz', 'd': 'd', 'f': 'f', 'g': 'ɡ', 'H': 'ʕ', 'h': 'ħ',
	'J': 'dʒ', 'j': 'j', 'K': 'kʼ', 'k': 'k', 'L': 'ɬ', 'l': 'l',
	'm': 'm', 'n': 'n', 'P': 'pʼ', 'p': 'p', 'q': 'qχ', 'Q': 'χʼ',
	'r': 'ɾ', 'R': 'ʁ', 'S': 'ʃ', 's': 's', 'T': 'tʼ', 't': 't',
	'W': 'ʔ', 'w': 'w', 'X': 'χ', 'x': 'x', 'y': 'tɬ', 'Y': 'tɬʼ',
	'Z': 'ʒ', 'z': 'z', 
};

function transcribir_IPA(cadenaASCII) {
	return Array.from(cadenaASCII)
		.map(letra => transcriptionMap[letra] !== undefined ? transcriptionMap[letra] : letra)
		.join('');
}