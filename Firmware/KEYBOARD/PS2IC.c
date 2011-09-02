//------------------------------------------------
//		Keyboard.c
//	PS/2 keyboard input library  using input compare
//	Arthur Benemann 21/11/2010
//------------------------------------------------
//
//	Description:
//	Comunicates with a PS2 keyboard.
//  There is a Receive Flag for communication betwen
//	the user program and the library.
//	Break codes are consumed inside the receive routine
//	befor even going to the FIFO buffer
//
//-----------------------------------------------
//
//	Requeriments:
//	IC1
//	1 Remapable pin
//	1 General I/O pin
//
//-----------------------------------------------

#include "../Compiler.h"			// Processor includes
#include "../HardwareProfile.h"		// Hardware definitions
#include "PS2IC.h"					// Public functions
#include "keymap.h"					// Keymap


//---------------- Constantes -------------------
#define BREAKCODE	0xf0

//---------------- Macros ----------------------
#define _NOPSV  __attribute__((no_auto_psv))

//---------------- Variables --------------------
// Keyboard state machine
enum {PS2START,	PS2BIT,	PS2PARITY, PS2STOP };

// Keyboard State e buffer
int PS2State;					// maquina de estados
int	KCount, KParity;			// Bit count e Paridade
unsigned char KBDBuf;			// Buffer temporario
unsigned char LastChar;			// Buffer to consume break Codes

// FIFO Buffer
unsigned char KCB[KBD_FIFO];		// Keyboard Code Buffer (FIFO)
volatile int KBR,KBW;			// FIFO buffer pointers
	
//-------------- Public Functions --------------------

//------------ initKBD ------------------
// Inicializa o teclado 
void initKBD(void)	// Inicialização do teclado
{
	LastChar = 0;		// Limpa o buffer de break char
	KBR = KBW =0;		// inicializa o buffer FIFO

	PS2DATtris = 1;		// CLK como INPUT
	PS2CLK;				// DATA como IC1


	#if defined(__PIC24F__)
		IC1CON1 = 0x0002; 	// Captura todas bordas de subida
	#elif defined(__dsPIC33F__)
		IC1CON  = 0x0002; 	// Captura todas bordas de subida
	#endif
	_IC1IF = 0;			// Ativa as interrupções
	_IC1IP = 6;
	_IC1IE = 1;		 
}// initKBD

//------------------- getKey() ------------------------
// Recebe um Key code do buffer FIFO do teclado
// retorna FALSO (0) se não tiver nada para receber
unsigned char getKey(void)
{
	unsigned char c;

	if(KBR == KBW)	
		return 0;	// Retorna Falso caso estaja com o buffer vazio
	
	c = KCB[KBR++];	// Le e retorna um code do buffer
	KBR %= KBD_FIFO;
	
	return c;		// retorna o code lido	
}

//-------------- Private Functions --------------------
void _ISR _NOPSV _IC1Interrupt(void) // Input Capture interrupt
{
	Nop();
	switch( PS2State)				// Maquina de estados do teclado
		{
		default:					// Por padrão volta para START
		case PS2START:				// START
			if(!PS2DAT) 			//
			{						// Caso a linha DAT esteja baixa é um start bit
				KCount = 8; 		// Inicia as variaveis
				KParity = 0;		// E avança a maquina de estados um passo
				PS2State = PS2BIT;
			}
			break;

		case PS2BIT:				// 8 BITS
			KBDBuf >>=1;			// shift para esquerda, abre espaço para mais um bit
			if(PS2DAT)				//
				KBDBuf += 0x80; 	// seta o MSB conforme a linha DAT
			KParity ^= KBDBuf;		// Update da paridade
			if(--KCount == 0)		// Se todos lidos avança, senão decrementa contagem de bits
				PS2State = PS2PARITY;
			break;

		case PS2PARITY:				// PARITY
			if(PS2DAT)				//
				KParity ^= 0x80; 	//
			if(KParity & 0x80)		// Se a parity odd continua
				PS2State = PS2STOP;	//
			else					// Senão reinicia
				PS2State = PS2START;
			break;

		case PS2STOP:				// STOP
			if(PS2DAT)				// verifica o stop bit
			{						// testa se não é um break code
				if((KBDBuf!=BREAKCODE)&(LastChar!=BREAKCODE))
				{	// escreve no um caracter buffer
					KCB[ KBW]= keyCodes[KBDBuf %128];
					if( (KBW+1)%KBD_FIFO != KBR)// testa se o buffer esta cheio
					{
						KBW++;					// caso não incrementa o ponteiro de escrita
						KBW %= KBD_FIFO;			
					}
				}					
				LastChar = KBDBuf;	// Salva o ultimo codigo recebido
			}						//
			PS2State = PS2START;	// Reinicia a maquina
			break;
		
		} // Maquina de estados
		
		_IC1IF = 0; 	// Limpa a flag de int.
} // IC int.


//------------------ PS2 keyboard codes --------------------
const char keyCodes[128]={    
                0,  F9,   0,  F5,  F3,  F1,  F2, F12,   //00
                0, F10,  F8,  F6,  F4, TAB, '`',   0,   //08
                0,   0,L_SHFT, 0,L_CTRL,'q','1',   0,   //10
                0,   0, 'z', 's', 'a', 'w', '2',   0,   //18
                0, 'c', 'x', 'd', 'e', '4', '3',   0,   //20
                0, ' ', 'v', 'f', 't', 'r', '5',   0,   //28
                0, 'n', 'b', 'h', 'g', 'y', '6',   0,   //30
                0,   0, 'm', 'j', 'u', '7', '8',   0,   //38
                0, ',', 'k', 'i', 'o', '0', '9',   0,   //40
                0, '.', '/', 'l', ';', 'p', '-',   0,   //48
                0,   0,'\'',   0, '[', '=',   0,   0,   //50
          CAPS, R_SHFT,ENTER, ']',  0,0x5c,   0,   0,   //58
                0,   0,   0,   0,   0,   0, BKSP,  0,   //60
                0, KP1,   0, KP4, KP7,   0,   0,   0,   //68
                0, '.', KP2, KP5, KP6, KP8, ESC, NUM,   //70
              F11, '+', KP3, '-', '*', KP9,   0,   0    //78
            };


