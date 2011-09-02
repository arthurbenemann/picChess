/*----------------------------------------------
//					VGA.h
// 	Video Graphics Array Library
// 	Arthur Bemann 01/05/2011
//-----------------------------------------------
//
//	Description:
//	Generates a VGA video signal on a dsPIC33F.
// 	Monocromatic, double buffered.
//	Output Resolution 800x600, 
//	Resolution 200x150
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
//---------------------------------------------*/

// Comment the next line if Double buffer is not needed
#define DOUBLE_BUFFER
		

//--------------- Constants ---------------------
#define	VRES	150u		// Screen Resolution
#define HRES	200u
#define lineSize	13

//------------ PINs definitions -----------------
#define	VSyncTris	_TRISC5=0X0  	// Vertical Sync 
#define	VSync		_LATC5		  	
#define HSyncTris 	_RP20R = 0x12	// Horizontal Sync 
#define PixelTris	_RP19R = 0x07	// RGB line

//--------------- Functions ---------------------
void initVGA(void);					// Inicialization of VGA module
void swapV(void);					// Swap video Buffers
void cleanHScreen(void);			// Clean hidden Buffer

// graphics
int readDotH(unsigned x, unsigned y);// Check a pixel in the Hidden Buffer
int readDotA(unsigned x, unsigned y);// Check a pixel in the Active Buffer

void plotDot(unsigned x, unsigned y,// Light up one pixel at cord.
				 unsigned color);			

void plotLine(   int x0, int y0,  	// plot a line
 			     int x1, int y1,
                 unsigned color);
	
void plotSquare( int x0, int y0, 	// plot a square
				 int x1, int y1,
				 unsigned filled,unsigned color); 

void plotCircle( int x0, int y0, 	// plot a circle
				 int radius, int color);

//--------------- Variables ---------------------
extern volatile	int *VH ;			// Pointer to the hidden video buffer
extern volatile	int *VA ;			// Pointer to the active video buffer
