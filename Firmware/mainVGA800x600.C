	/*
//		main.c
// 
// Test Program Stick 33F, just blinking some leds
//
// Arthur Bemann 20/04/2011
*/


#include "Compiler.h"

#include <stdio.h>	// debug
#include <ctype.h>	//debug

#include "VGA/VGA.h"
#include "CHESS/chessEngine.h"
#include "SERIAL/UART2.h"
#include "KEYBOARD/PS2IC.h"
#include "KEYBOARD/keymap.h"

#include "CLOCK/clock.h"

#include "LIFE/gameOfLife.h"

#include "VGA/text.h"

#include "NVM/sst25vf016.h"	// Serial Flash

#include "AUDIO/Audio.h"
#include "AUDIO/sounds.h"

#include "LM35/LM35.h"


//#include "HardwareProfile.h"	// I/O pins 
//-------------------- CONFIGURATION --------------------
// Select Internal FRC at POR
_FOSCSEL(FNOSC_FRC)						
// Multiple RP configurations, Clock switch enabled,POSC in HS mode
_FOSC(FCKSM_CSECMD & IOL1WAY_OFF & OSCIOFNC_OFF & POSCMD_HS); 
// Watchdog disabled
_FWDT(FWDTEN_OFF);		
// JTAG diasabled, IC debbugin on PGD1/PGC1
_FICD(JTAGEN_OFF & ICS_PGD1);
// No Code Protection OFF
_FBS(BWRP_WRPROTECT_OFF);
_FSS(SWRP_WRPROTECT_OFF);
_FGS(GWRP_OFF);
// Power-on Reset 128ms
_FPOR(FPWRT_PWR128);

// notify the compiler we are not modifying the PSV
#define _NOPSV  __attribute__((no_auto_psv))

//--------------------- PRIVATE PROTOTYPES ---------------
void initSystem(void);
void Clock80MHz(void);
void initIO(void);

//---------------------- Variables -----------------------
enum {CHESS,LIFE,CLOCK} gameState = CHESS;

// ----------------------- MAIN -----------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ---------
int main()
{
	unsigned char key;

	// Initialize System
	initSystem();

	// Send Splash message
	putsU2("\r\n picChess v1.0 \r\n"__DATE__"\r\n");

	// Init Software
	chessInit();

	// Main Loop
	while(1)
	{	
		key = getKey();

		switch(key)					// Check if is not a Game Select
		{
			case F1:
				gameState = CHESS;
				break;
			case F2:
				gameState = LIFE;
				break;
			case F3:
				gameState = CLOCK;
				break;
			case F5:
				playSound(S_NIRVANA);
				break;
			case F6:
				playSound(S_RHCP);
				break;
			case F8:
				playSound(S_OFFSPRING);
				break;
			default:
				break;
		}

		switch(gameState)			// Game Kind State Machine
		{
			case CHESS:				// Chess Game
				chessGame(key);
				break;
	
			case LIFE:				// Game of Life
				gameOfLife(key);
				break;	

			case CLOCK:				// Clock
				diplayClock();
				break;			
		}

	} // main loop	
}// main




//-------------- initSystem -----------------------------------
// Initilize the microcontroler, startup of all modules
// ( audio, video, serial,keyboard, ...)
void initSystem(void)
{
	// Microcontroller initialization
	Clock80MHz();
	initIO();

	// Initialize all peripherals
	initRTCC();
	initU2();
	initKBD();
	initVGA();
	initNVM();
	initSound();
	initLM35();

}


//-------------- initIO -----------------------------------------
// Initialize all general porpuse I/O pins
void initIO(void)
{
	// Configure digital/analog pins
	AD1PCFGL = 0xffff;
}

//-------------- Clock80MHz -------------------------------------
// Switch System clock to the PLL at 80MHz
void Clock80MHz(void)
{
	// Configure PLL prescaler, PLL postscaler, PLL divisor
	PLLFBD=30; 				// M = 32
	CLKDIVbits.PLLPOST=0; 	// N2 = 2
	CLKDIVbits.PLLPRE=2; 	// N1 = 4

	// Initiate Clock Switch to Primary Oscillator with PLL (NOSC = 0b011)
	__builtin_write_OSCCONH(0x03);
	__builtin_write_OSCCONL(0x01);

	// Wait for Clock switch to occur
	while (OSCCONbits.COSC != 0b011);
	
	// Wait for PLL to lock
	while(OSCCONbits.LOCK!=1) {};
}
