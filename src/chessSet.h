//------------------------------------------------
//		chessSet.c
//  Chess pieces Bitmaps 16x16
//	Arthur Benemann 
//	Igor de Oliveira
//						02/05/2011
//------------------------------------------------
//  
//	Description:
//	Bitmaps of chess pieces, monochromatic 16x16
//	To plot the pieces follow the diagram:
//	
//	Pieces Bitmaps:
//
//			|side	|square	|
//	piece	| black	| black	|
//	_piece	| black	| white	|
//	~piece	| white | white	|
//	~_piece	| white	| black	|
//
//-------------------------------------------------

const int pawnBitmap[] ={
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x03C0,
	0x0420,
	0x0810,
	0x1008,
	0x0810,
	0x0420,
	0x0420,
	0x0C30,
	0x1008,
	0x2004,
	0x1FF8,
	0x0000
};

const int _pawnBitmap[] ={
	0xFFFF,
	0xFFFF,
	0xFFFF,
	0xFFFF,
	0xFFFF,
	0xFC3F,
	0xF81F,
	0xF00F,
	0xF81F,
	0xFC3F,
	0xFC3F,
	0xFC3F,
	0xF00F,
	0xE007,
	0xFFFF,
	0xFFFF
};

const int rookBitmap[] ={
	0x0000,
	0x1998,
	0x2664,
	0x2004,
	0x2004,
	0x1008,
	0x0810,
	0x0810,
	0x0810,
	0x0810,
	0x0810,
	0x1008,
	0x2004,
	0x4002,
	0x3FFC,
	0x0000
};

const int _rookBitmap[] ={
	0xFFFF,
	0xFFFF,
	0xE667,
	0xE007,
	0xE007,
	0xF00F,
	0xF81F,
	0xF81F,
	0xF81F,
	0xF81F,
	0xF81F,
	0xF00F,
	0xE007,
	0xC003,
	0xFFFF,
	0xFFFF
};

const int knightBitmap[] ={
	0x0080,
	0x0340,
	0x0440,
	0x0820,
	0x1050,
	0x0808,
	0x1004,
	0x0804,
	0x1468,
	0x0C78,
	0x0820,
	0x0810,
	0x1008,
	0x2004,
	0x1FF8,
	0x0000
};

const int _knightBitmap[] ={
	0xFFFF,
	0xFF7F,
	0xFC7F,
	0xF83F,
	0xF05F,
	0xF80F,
	0xF007,
	0xF807,
	0xF46F,
	0xFC7F,
	0xF83F,
	0xF81F,
	0xF00F,
	0xE007,
	0xFFFF,
	0xFFFF
};


const int kingBitmap[] ={
	0x0180,
	0x0240,
	0x0420,
	0x0E70,
	0x1248,
	0x1008,
	0x0810,
	0x0420,
	0x0420,
	0x0420,
	0x0420,
	0x0810,
	0x0810,
	0x1008,
	0x2004,
	0x1FF8
};

const int _kingBitmap[] ={
	0xFFFF,
	0xFE7F,
	0xFC3F,
	0xFE7F,
	0xF24F,
	0xF00F,
	0xF81F,
	0xFC3F,
	0xFC3F,
	0xFC3F,
	0xFC3F,
	0xF81F,
	0xF81F,
	0xF00F,
	0xE007,
	0xFFFF
};

const int bishopBitmap[] ={
	0x0000,
	0x0180,
	0x0240,
	0x04A0,
	0x0910,
	0x1208,
	0x0810,
	0x0420,
	0x0420,
	0x0420,
	0x0420,
	0x0810,
	0x0810,
	0x1008,
	0x2004,
	0x1FF8,
};

const int _bishopBitmap[] ={
	0xFFFF,
	0xFE7F,
	0xFCBF,
	0xF91F,
	0xF20F,
	0xF81F,
	0xFC3F,
	0xFC3F,
	0xFC3F,
	0xFC3F,
	0xFC3F,
	0xF81F,
	0xF81F,
	0xF00F,
	0xE007,
	0xFFFF
};


const int queenBitmap[] ={
	0x0000,
	0x0180,
	0x0240,
	0x0C30,
	0x1188,
	0x1188,
	0x0810,
	0x0420,
	0x0420,
	0x0420,
	0x0420,
	0x0810,
	0x0810,
	0x1008,
	0x2004,
	0x1FF8
};

const int _queenBitmap[] ={
	0xFFFF,
	0xFFFF,
	0xFE7F,
	0xFC3F,
	0xF18F,
	0xF18F,
	0xF81F,
	0xFC3F,
	0xFC3F,
	0xFC3F,
	0xFC3F,
	0xF81F,
	0xF81F,
	0xF00F,
	0xE007,
	0xFFFF
};



const int blankBitmap[] ={
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000
};

const int _blankBitmap [] ={
	0xFFFF,
	0xFFFF,
	0xFFFF,
	0xFFFF,
	0xFFFF,
	0xFFFF,
	0xFFFF,
	0xFFFF,
	0xFFFF,
	0xFFFF,
	0xFFFF,
	0xFFFF,
	0xFFFF,
	0xFFFF,
	0xFFFF,
	0xFFFF,
};

