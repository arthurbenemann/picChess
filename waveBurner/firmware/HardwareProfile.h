

//------------- Clock frequency values ------------------------
//used for UART and SPI baud rate generation.
#define GetSystemClock()		(80000000ul)			// Hz
#define GetInstructionClock()	(GetSystemClock()/2)	// Normally GetSystemClock()/4 for PIC18, GetSystemClock()/2 for PIC24/dsPIC, and GetSystemClock()/1 for PIC32.  Might need changing if using Doze modes.
#define GetPeripheralClock()	(GetSystemClock()/2)	// Normally GetSystemClock()/4 for PIC18, GetSystemClock()/2 for PIC24/dsPIC, and GetSystemClock()/1 for PIC32.  Divisor may be different if using a PIC32 since it's configurable.


//-------------- Serial CONFIGURATION --------------------
#define	BRATE		256000					// 115kbps
//#define U2_INV								// sinais invertidos ( Idle LO)
#define U2RxPin _U2RXR = 6					// U2RX no pino RP6
#define U2TxPin	_RP5R = 5					// U2TX no pino RP5

//------------- PS2 Keboard -----------------------------
#define	PS2DAT		_RB8					// PS2 Data line
#define	PS2DATtris	_TRISB8					// PS2 Data line
#define PS2CLK		_IC1R = 7				// IC1 no pino RP7

//------------ SST25 SPI Flash ------------------------
// Connections:
// SST - RPx  - pin
//	CE - RP09 - 1	- RB9
//	SI - RP24 - 4
//	SCK- RP23 - 3
//	SO - RP22 - 2
#define	SST25VF_CS_TRIS _TRISB9		
#define	SST25VF_CS 		_LATB9	
#define	SST25VF_SDO		_RP24R = 10;			
#define	SST25VF_SDI		_SDI2R = 22; 
#define	SST25VF_SCK		_RP23R = 11;
