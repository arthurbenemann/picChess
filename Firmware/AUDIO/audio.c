//----------------------------------------------
//				audio.c
// 	Audio playback trought DAC
// 	Arthur Bemann 26/05/2011
//-----------------------------------------------
//
//	Description:
//	Uses the DAC to generate a audio signal
//  Curently has only support to read 16 bit 8Khz files
//  stored on a SST25 Flash memory. Sounds pointers are
//  acessed troght the sounds.h file.
//	
//-----------------------------------------------
//	
//	Requeriments:
//	One DAC channel
//  One DMA channel
//	DMA interrupt
//  NVM library runnings
//
//-----------------------------------------------

#include "../Compiler.h"		// Peripheral definitions
#include "../NVM/sst25vf016.h"	// Serial Flash
#include "sounds.h"				// Sounds header

#define DMA_REQ_DAC_R	0x4E		// DMA request from DAC right channel

//-------------------- MACROS ------------------------
// notify the compiler we are not modifying the PSV
#define _NOPSV  __attribute__((no_auto_psv))
#define _FAR __attribute__(( far))

//------------------- VARIABLES ----------------------

volatile int AudioBuf[] __attribute__((space(dma))) = {
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
};
#define AudioBuf_SIZE (sizeof(AudioBuf)/sizeof(AudioBuf[0]))

unsigned int  Refill = 0;
unsigned long AudioPtr = 0x00000000;

//------------------- FUNCTIONS ----------------------

//----------------------- playSound ------------------------
// Play one of the sounds Stored in the Flash memmory
 void playSound(int i)
{
	if(i<NUM_SOUNDS)	// Check if is in range
	{
		AudioPtr = soundAdd[i];
		Refill   = soundLengths[i];
		DMA2CONbits.CHEN=1;
		DMA2REQbits.FORCE=1;	
	}
}

//--------------------- isPlaying ---------------------------
// Returns if the sound rotine is playing a sound
int isPlaying(void)
{	
	return(((Refill)>0)& DMA2CONbits.CHEN);	
}


//-------------------- initSound ----------------------------
// Initilize the sound Module, uses 1 DMA channel, and one
// channel from the DAC module
void initSound(void)
{
	// Setup Auxiliary Clock as 160Mhz (source VCO 1:1)
	_SELACLK = 0; 				// Vco as source for the Auxiliary Clock Divider
	_AOSCMD  = 0;				// Auxiliary Oscilitor Disabled
	_APSTSCLR= 0x7;				// Auxiliary Clock divider 1:1

	// Setup DAC Right channel, unsigned 8kHz
	DAC1STATbits.ROEN = 1; 		// Right Channel DAC Output Enabled 
	DAC1STATbits.RITYPE = 1; 	// Right Channel Interrupt if FIFO is Empty
	DAC1CONbits.AMPON = 0; 		// Amplifier Disabled During Sleep and Idle Modes 
	DAC1CONbits.DACFDIV = 78; 	// Divide Clock by 78 for 8Khz samppling rate (DAC Clock is Vco=160MHz) 
	DAC1CONbits.FORM = 1; 		// Data Format is Signed
	DAC1DFLT = 0; 				// Default value set to Midpoint when FORM = 1 
	_DAC1RIF = 0; 				// Clear Right Channel Interrupt Flag 
	_DAC1RIE = 0;		 		// Right Channel Interrupt Enabled 
	DAC1CONbits.DACEN = 1; 		// DAC1 Module Enabled 

	// Configure  DMA channel, to load up Interrupt times for OC2
	DMA2CON = 0x2000;							// Continuos, post inc.
	DMA2REQ = DMA_REQ_DAC_R;					// Select DAC_R as DMA request source
	DMA2STA = __builtin_dmaoffset(AudioBuf);	// Point DMA input to Audio Buffer
	DMA2PAD =(volatile unsigned int) &DAC1RDAT;	// Point DMA output to DAC right channel input
	DMA2CNT =  AudioBuf_SIZE-1;
	_DMA2IF = 0;								// Enable DMA interrupts
	_DMA2IP = 5;
	_DMA2IE = 1;								//
	DMA2CONbits.CHEN=1;							// Enable module
}



//------------------ Sound Interrupt ----------------------
// When playing a sound this isterrupt is called every 4ms
// To refill the Audio buffer with new data from the Flash
void _ISR _NOPSV _DMA2Interrupt(void)
{// Caution when debbuging, DMA is idependent of the core
 // You have 125uS(8Khz) to refill the buffer befor next transfer
	_DMA2IF = 0; 	//clear  interrupt flag

	if((Refill--)>0)			// Refill the audio buffer the number of times nedeed
	{
		readBufNVM((int*) AudioBuf, AudioBuf_SIZE,AudioPtr);
		AudioPtr += sizeof(AudioBuf);
	}
	else
	{							// This sound has been trasmided, stop DMA transfers
		DMA2CONbits.CHEN = 0;	
	}
}

