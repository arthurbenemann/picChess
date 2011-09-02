//------------------------------------------------
//		UART2.h
//	Serial communication library
//	Arthur Benemann 13/11/2010
//------------------------------------------------
//
//	Description:
//	Open UART peripheral for serial communication.
//  Contain some basic input/output rotines
//
//-----------------------------------------------
//
//	Requeriments:
//	UART2
//	2 Remapable pin (RX,TX)
//
//-----------------------------------------------


//---------------- Constantes ------------------
//#define	BRATE		34	// 115  kbit/s (BREGH=1)
//#define U2_INV			// sinais invertidos ( Idle LO)

 #define USE_SERIAL_INT		// Uncomment this line to enable serial int.

//----------------- Macros ---------------------
#define lineU2		putU2('\r');putU2('\n')

//---------------- Funções ---------------------
void initU2(void);	 	// inicializa a porta seria (8n1, UART2)
void putU2(int c);	 	// envia um caracter para a porta
void putsU2(char *s); 	// envia uma string terminada em null
char getU2(void);	 	// espera até receber um caracter da porta

