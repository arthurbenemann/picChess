//------------------------------------------------
//		Keyboard.h
//	PS/2 keyboard input library  using input compare
//	Arthur Benemann 21/11/2010
//------------------------------------------------
//
//	Description:
//	Comunicates with a PS2 keyboard.
//  There is a Receive Flag for communication betwen
//	the user program and the library.
//
//-----------------------------------------------
//
//	Requeriments:
//	IC1
//	1 Remapable pin
//	1 General I/O pin
//
//-----------------------------------------------

#define KBD_FIFO	16		// Tamanho do Buffer FIFO de entrada

//---------------- I/O ------------------
//#define	PS2DAT		_RB11		// PS2 Data line
//#define	PS2DATtris	_TRISB11	// PS2 Data line
//#define PS2CLK		 RPINR7bits.IC1R = 10	// IC1 no pino RB10

//------------- Functions ----------------
void initKBD(void);			// inicializa o modulo
unsigned char getKey(void); // recebe um caracter do teclado 
							// (retorna falso caso não haja nada para receber)


