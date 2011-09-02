//----------------------------------------------
//					waveBurner.h
//	SST25 Serial Flash Burner
// 	Arthur Bemann 01/06/2011
//-----------------------------------------------
//
//	Description:
//	An simple programmer for the SST25 Falsh chip
//
//-----------------------------------------------


#include "Compiler.h"

#include <stdio.h>	// debug
#include <ctype.h>	//debug


#include "SERIAL/UART2.h"

#include "NVM/sst25vf016.h"	// Serial Flash


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

enum{
	S_DEFAULT,
	S_NVM_WRITE
} serialState = S_DEFAULT;
long writeAdd;

char Buffer[4096];
char *Index;

// ----------------------- MAIN --------------------------
int main()
{

	initSystem();

	putsU2("\r\n waveBurner\r\nSST25 Serial Flash Burner\r\n"__DATE__"\r\n");

	while(1)
	{	
	}	
}// main


//##############################################
void _ISR _NOPSV _U2RXInterrupt(void)	
{
	int c,i;
	long add;

	_U2RXIF = 0;
	c = U2RXREG;

	switch(serialState)
	{
		case S_NVM_WRITE:
			// Buffer filling
			*Index++ = c;

			if(Index >= (Buffer+sizeof(Buffer)))
			{	// Buffer filled
				Index = Buffer;				// restart the buffer pointer

				// Write the buffer to the NVM, and increment NVM pointer
				writeBufNVM((int*)Buffer,sizeof(Buffer)/2,writeAdd);
				writeAdd += sizeof(Buffer);

				// Send a messege to alert that this block has been transfered	
				putU2('t');					

				// When NVM is Full stop the write mode
				if(writeAdd == SST25_SIZE)	
					serialState = S_DEFAULT;
			}



			break;

		default:
			
			if(c=='w')
			{
				clearNVM();
				serialState = S_NVM_WRITE;
				writeAdd    = 0x0000000;
				Index = Buffer;	
				putU2('w');		
			}	

	
		// Read NVM and send trought serial port
		if(c=='r')
		{
			int buf[64];
			for(add=0; add<SST25_SIZE; add+=sizeof(buf))
			{
				readBufNVM(buf,sizeof(buf)/2,add);
				for(i=0;i<64;i++)
				{
					putU2((buf[i] & 0x00FF));
					putU2((buf[i] & 0xFF00) >> 8);
				}
			}
		}
	}
}


//-------------- initSystem -----------------------------------
// Initilize the microcontroler, startup of all modules
// ( audio, video, serial,keyboard, ...)
void initSystem(void)
{
	// Microcontroller initialization
	Clock80MHz();
	initIO();

	// Initialize all peripherals
	initU2();
	initNVM();
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
