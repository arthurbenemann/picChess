/*----------------------------------------------
//					VGA.c
// 	Video Graphics Array Library
// 	Arthur Bemann 01/05/2011
//-----------------------------------------------
//
//	Description:
//	Generates a VGA video signal on a dsPIC33F.
// 	Output Resolution 800x600, double buffered.
//
//-----------------------------------------------
//
//	Requeriments:
//	SPI1, TMR2, OC1, OC2, DMA0, DMA1
//	2 Remapable pins
//	1 General I/O pin
// 	Main Clock must be 80MHz
//	~8Kbytes of RAM
//	~%8 of processor  time on ISR
//
//-----------------------------------------------
*/

#include "../Compiler.h"	// Processor includes
#include "VGA.h"			// Self definitions
#include <string.h>			// for memset()

//-------------------- MACROS ------------------------
// notify the compiler we are not modifying the PSV
#define _NOPSV  __attribute__((no_auto_psv))
#define _FAR __attribute__(( far))

//-------------------- DEFINES--------------------------						
// Vertcal timing definitions, in lines
#define V_FP	1u
#define	V_BLANK	4u
#define	V_BP	23u
#define V_LN	600u
#define	V_TOTAL	(V_FP+V_BLANK+V_LN+V_BP)// lines per frame

// Horizontal timings definitions, in px
#define H_FP	40u
#define	H_BLANK	128u
#define	H_BP	88u
#define H_LN	800u
#define	H_TOTAL	(H_FP+H_BLANK+H_BP+H_LN)// px per Line

// Internal Timming
#define ISR_DELAY	24		// Delay To start of line in the ISR
#define H_SHIFT		16*4	// Number of pixels one each SPI transfer

//--------------- Global Variables -----------------------
int _FAR VMap1[VRES * lineSize];	// Video Buffers
#if defined DOUBLE_BUFFER
	int _FAR VMap2[VRES * lineSize];
#endif

volatile int *VA ;		// Pointer to the Active buffer
volatile int *VH ;		// Pointer to the Hidden buffer
volatile int *VPtr;		// Pointer to the word been transfered			

volatile int Vline;		// Line counter

volatile int LineBuf[] __attribute__((space(dma))) = {
	0xFaaa,0xaaaa,0xaaaa,0xaaaa,
	0xaaaa,0xaaaa,0xaaaa,0xaaaa,
	0xaaaa,0xaaaa,0xaaaa,0xaaaa,
	0xaf00};
volatile int TxTimes[] __attribute__((space(dma))) = {
	ISR_DELAY+H_BLANK+H_BP+H_SHIFT*0 ,
	ISR_DELAY+H_BLANK+H_BP+H_SHIFT*1 ,	
	ISR_DELAY+H_BLANK+H_BP+H_SHIFT*2 ,	
	ISR_DELAY+H_BLANK+H_BP+H_SHIFT*3 ,	
	ISR_DELAY+H_BLANK+H_BP+H_SHIFT*4 ,	
	ISR_DELAY+H_BLANK+H_BP+H_SHIFT*5 ,	
	ISR_DELAY+H_BLANK+H_BP+H_SHIFT*6 ,	
	ISR_DELAY+H_BLANK+H_BP+H_SHIFT*7 ,		
	ISR_DELAY+H_BLANK+H_BP+H_SHIFT*8 ,	
	ISR_DELAY+H_BLANK+H_BP+H_SHIFT*9 ,	
	ISR_DELAY+H_BLANK+H_BP+H_SHIFT*10,	
	ISR_DELAY+H_BLANK+H_BP+H_SHIFT*11,
	ISR_DELAY+H_BLANK+H_BP+H_SHIFT*12 };

//------------------- Public Functions -----------------------

//-------------------- cleanHScreen ---------------------
// Clean the hidden video buffer
void cleanHScreen(void)
{
	memset((char*)VH,0,VRES*lineSize*2); //fill buffer with zeros
}

//-------------------- swapV ----------------------------
// Swap video Buffers, VA -> VH, VH->VA
void swapV(void)
{
	volatile int *Vtemp;

	while(Vline <= V_BP+V_LN+1); // wait the end of the frame
	
	Vtemp = VA;
	VA    = VH;
	VH    = Vtemp;
	VPtr  = VA;
}




//-------------- initVGA ----------------------------------
// Initialize the video outputs , must be called before 
// using the video module. Uses about 6% of the processor in ISR.
void initVGA(void)
{
	// 0. Initize I/O
	VSync = 0;
	PixelTris;
	HSyncTris;
	VSyncTris;

	// 1. Initialize variables
	Vline = -V_BLANK;
	
	VA = VMap1;
	#if defined DOUBLE_BUFFER
		VH = VMap2;
	#else
		VH = VA;
	#endif
	VPtr  = VA;

	// 2. Configure SPI1 Module
	SPI1CON1 = 0x0420;			// Master Mode, 16bit, disable SCK/SS
	SPI1CON1bits.SPRE = 0x4;	// Secondary Prescale 4:1
	SPI1CON1bits.PPRE = 0x3;	// Primary Prescale 1:1
	SPI1CON2 = 0x0000;			// Frame mode OFF
	_SPI1IE  = 0;				// No interrupts
	SPI1STAT = 0x8000;			// Enable SPI1

	// 3. Configure Timers
	T2CON = 0x0000;						// T2 off
	T2CONbits.TCKPS = 0x0;  			// 1:1 Fcy 
	PR2   = H_TOTAL - 1;				// Line Period
	TMR2  = H_TOTAL - 10;				// 
	_T2IP = 7;
	_T2IF = 0;							// 
	_T2IE = 1;							// Enable TMR2 interrupt

	// 3. Configure Output Compare Modules
	OC1CON = 0x0005;					// OC1 ON, Continuos Pulse Mode, TMR2
	OC1R   = ISR_DELAY;					// Hoziontal sync signal
	OC1RS  = ISR_DELAY+H_BLANK;			// 

	OC2CON = 0x0003;					// OC2 ON, Togle Mode, TMR2
										// Timed Transfers

	//4. Setup DMA Channels 
	DMACS0  = 0x0000;			// Clear any error

	// Configure first DMA channel, to load up Interrupt times for OC2
	DMA0CON = 0x2000;							// 16 bit,Continuos, post inc.
	DMA0REQ = 0x0006;							// Select OC2 as DMA request source
	DMA0STA = __builtin_dmaoffset(TxTimes);		// Point DMA input to Buffer
	DMA0PAD = (volatile unsigned int) &OC2R;	// Point DMA output to OC2R
	DMA0CNT = (sizeof(TxTimes)/sizeof(TxTimes[0]))-1;
	_DMA0IE = 0;								// Disable DMA interrupts
	DMA0CONbits.CHEN=1;							// Enable module
	DMA0REQbits.FORCE=1; 						// Setup first Transfer, to start the timed transfers

	// Configure second DMA channel, to serialize via SPI1 the line buffer
	// Using the timed transfers
	DMA1CON = 0x2000;							// 16 bit,Continuos, post inc.
	DMA1REQ = 0x0006;							// Select OC2 as DMA request source
	DMA1STA = __builtin_dmaoffset(LineBuf);		// Point DMA input to line Buffer
	DMA1PAD = (volatile unsigned int) &SPI1BUF;	// Point DMA output to SPI1BUF
	DMA1CNT = (sizeof(LineBuf)/sizeof(LineBuf[0]))-1;
	_DMA1IE = 0;								// Disable interrupts
	DMA1CONbits.CHEN=1;							// Enable module

	//----- Start Video Machine
	T2CONbits.TON = 1;
}



//------------------- Private Functions -----------------------
//--------------- Video Line -----------------------------
void _ISR _NOPSV _T2Interrupt(void)	// Time2 int
{
	_T2IF = 0;
	if(Vline++ < 0) {
		VSync =1;
		return;	
	}
	else
		VSync =0;

	if(Vline <= V_BP)
		return;

	if(Vline > (V_BP+V_LN))
	{
		if(Vline == V_BP+V_LN+1)
		{
			VPtr = VA;
			LineBuf[0] = 0;
			LineBuf[1] = 0;
			LineBuf[2] = 0;
			LineBuf[3] = 0;
			LineBuf[4] = 0;
			LineBuf[5] = 0;
			LineBuf[6] = 0;
			LineBuf[7] = 0;
			LineBuf[8] = 0;
			LineBuf[9] = 0;
			LineBuf[10]= 0;
			LineBuf[11]= 0;
			LineBuf[12]= 0;
			return;
		}
		if(Vline >= (V_BP+V_LN+V_FP))
		{
			Vline = -V_BLANK;
			return;
		}
	}

	if(!(Vline & 0x0003))
	{
		// Load one line of Pixels
		LineBuf[0] = *VPtr++;
		LineBuf[1] = *VPtr++;
		LineBuf[2] = *VPtr++;
		LineBuf[3] = *VPtr++;
		LineBuf[4] = *VPtr++;
		LineBuf[5] = *VPtr++;
		LineBuf[6] = *VPtr++;
		LineBuf[7] = *VPtr++;
		LineBuf[8] = *VPtr++;
		LineBuf[9] = *VPtr++;
		LineBuf[10]= *VPtr++;
		LineBuf[11]= *VPtr++;
		LineBuf[12]= *VPtr++ & 0xff00;
	}

}

