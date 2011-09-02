/*----------------------------------------------
//					sst25vf016.c
//	Serial Flash driver
// 	Arthur Bemann 01/05/2011
//-----------------------------------------------
//
//	Description:
//	Driver to read and write to a sst25vf016 memmory
//
//-----------------------------------------------
//
//	Requeriments:
//	SPI2
//	3 Remapable pins
//	1 General I/O pin
// 	Main Clock must be 80MHz
//
//-----------------------------------------------
*/

#include "../Compiler.h"		// Processor includes
#include "sst25vf016.h"			// Self definitions
#include "../HardwareProfile.h"	// I/O pins 

#if(GetPeripheralClock()!=40000000)
	#error "Peripheral Clock is Wrong for NVM access"
#endif


//---------------------- SST25 Instruction Set -----------------------
#define SST25_WREN 			0x06	// Write Enable
#define SST25_WRDI 			0x04	// Write Disable
#define SST25_WRSR	 		0x01	// Write Status Register
#define SST25_CHIP_ERASE	0x60	// Full Chip Erase
#define SST25_RDSR			0x05	// Read Status Register
#define SST25_READ			0x03	// Read memory
#define SST25_WRITE			0x02	// Write memory
#define SST25_AAIP			0xAD	// Auto Address Increment Programming

#define SST25_UNPROTECT	0x00		// Byte that must be transfered to the Status register to unprotect the memory
#define SST5_BUSY		0x01		//Mask for the Busy Bit on the status register

//------------------------------ MACROS -------------------------------
#define NVM_On		(SST25VF_CS = 0)
#define NVM_Off		(SST25VF_CS = 1)

#define readSPI2()	(writeSPI2(0xff)) 			// Read by sending a dummy byte
#define busyNVM()   (readStatusNVM()& SST5_BUSY)// Returns the state of the Busy bit on the status register

//------------------------ PRIVATE PROTOTYPES --------------------------
void unprotectNVM(void);
int readStatusNVM(void);
int writeSPI2(int data);


//--------------------------- FUNCTIONS --------------------------------

//--------------- initNVM --------------------
// Initialize SPI to talk with the memmory
void initNVM(void)
{
	SPI2CON1bits.DISSCK	= 0;	// Internal clock enabled	
	SPI2CON1bits.DISSDO = 0;	// SDO controlled by module	
	SPI2CON1bits.MODE16	= 0;	// Byte wide communication		
	SPI2CON1bits.SMP	= 1;	// Input sampled at end of data time	
	SPI2CON1bits.CKE	= 1;	// Data changes from high to low clock	
	SPI2CON1bits.CKP	= 0;
	SPI2CON1bits.MSTEN	= 1;	// Master mode enabled			
	SPI2CON1bits.SSEN	= 0;	// SS pin is controlled by port		
	
	SPI2CON1bits.SPRE	= SST25_SPRE;
	SPI2CON1bits.PPRE	= SST25_PPRE;
	
	SPI2CON2bits.FRMEN	= 0;	// Framed SPIx is disabled		
	
	SST25VF_CS_TRIS 	= 0;	// Configure Chip Select pin 
	SST25VF_CS 			= 1;
	SST25VF_SDO;				// Configure SDO pin
	SST25VF_SDI;				// Configure SDI pin
	SST25VF_SCK;				// Configure SCK pin
	
	
	SPI2STAT            = 0;
	SPI2STATbits.SPISIDL= 0;	// Operational in idle mode
	_SPI2IF 			= 0;
	SPI2STATbits.SPIEN	= 1;	// Enable the module		
}

//---------------- writeNVM -------------------
// write one byte to the NVM
int writeSPI2(int data)
{
	SPI2BUF = data;				// TX data
    while(!SPI2STATbits.SPIRBF);// wait until 'SPITBF' bit is cleared
	data = SPI2BUF;				// return the received value
	return data;
}

//-------------- readStatusNVM ----------------
// Read the Status Register from the memory
int readStatusNVM(void)
{
	int data;

	NVM_On;
	writeSPI2(SST25_RDSR);
	data = readSPI2();
	NVM_Off;

	return data;
}


//------------ unprotectNVM ------------------
// Disable the write protection from the NVM
void unprotectNVM(void)
{
		// Enable Write
		NVM_On;
		writeSPI2(SST25_WREN);
		NVM_Off;	
	
		// Unprotect Memory
		NVM_On;
		writeSPI2(SST25_WRSR);
		writeSPI2(SST25_UNPROTECT);
		NVM_Off;
}

//-------------- clearNVM ------------------
// Clear the entire memory 
void clearNVM(void)
{
		// Disable Write Protection
		unprotectNVM();

		// Enable Write
		NVM_On;
		writeSPI2(SST25_WREN);
		NVM_Off;

		// Chip Erase
		NVM_On;
		writeSPI2(SST25_CHIP_ERASE);
		NVM_Off;

		// Wait until Erasing is complete
		while(busyNVM());
}

//--------------- readNVM ----------------
// Reads one byte from the NVM
int readNVM(long address)
{
	int data;

	// Send Read Command
	NVM_On;
	writeSPI2(SST25_READ);
	
	// Send Address to be read
	writeSPI2((address & 0x00FF0000) >> 16);		// MSB
	writeSPI2((address & 0x0000FF00) >> 8);
	writeSPI2((address & 0x000000FF) );				// LSB

	// receive data
	data = readSPI2();

	NVM_Off;
	
	return data;
}

//--------------- readBufNVM ----------------
// Reads a series of byte from the NVM to a buffer
// Address must be even, because of aligniment
// little-endian ( LSB first)
void readBufNVM(int *buf,int len,long address)
{
	// Send Read Command
	NVM_On;
	writeSPI2(SST25_READ);
	
	// Send Address to be read
	writeSPI2((address & 0x00FF0000) >> 16);		// MSB
	writeSPI2((address & 0x0000FF00) >> 8);
	writeSPI2((address & 0x000000FF) );				// LSB

	// Receive requested data
	while((len--)>0)
	{
		// receive data
		*buf     = readSPI2();
		(*buf++)+= readSPI2() << 8;
	}

	NVM_Off;
}

//-------------- writeNVM ------------------
// Write one byte to the NVM
// The SST25 must not be write protected
void writeNVM(char data,long address)
{
		// Enable Writes
		NVM_On;
		writeSPI2(SST25_WREN);
		NVM_Off;	

		NVM_On;
		writeSPI2(SST25_WRITE);	// Send Write Command
		
		// Send Address to be written
		writeSPI2((address & 0x00FF0000) >> 16);		// MSB
		writeSPI2((address & 0x0000FF00) >> 8);
		writeSPI2((address & 0x000000FF) );				// LSB

		// Send data to be written
		writeSPI2(data);		
		NVM_Off;	

		// Wait while writting
		while(busyNVM());

		// Disables writings
		NVM_On;
		writeSPI2(SST25_WRDI);	
		NVM_Off;
}	

//------------- writeBufNVM -----------------
// Write an entire buffer to the NVM, starting
// at the position passed as arg. .
// Address must be even, because of aligniment
// little-endian ( LSB first)
void writeBufNVM(int *buf,int len,long address)
{
		// Enable Writes
		NVM_On;
		writeSPI2(SST25_WREN);	
		NVM_Off;	

		// Send Sequential Write Command
		NVM_On;
		writeSPI2(SST25_AAIP);	

		// Send Address to be written
		writeSPI2((address & 0x00FF0000) >> 16);		// MSB
		writeSPI2((address & 0x0000FF00) >> 8);
		writeSPI2((address & 0x000000FF) );				// LSB

		// Send first word to be Written
		writeSPI2( (*buf)       & 0xFF);				// Send word to be written
		writeSPI2(((*buf++)>>8) & 0xFF);
		NVM_Off;		
		len--;
		while(busyNVM());		// Wait until write is complete

		while((len--)>0)
		{
			// Send Sequential Write Command
			NVM_On;
			writeSPI2(SST25_AAIP);	
			writeSPI2( (*buf)       & 0xFF);			// Send word to be written
			writeSPI2(((*buf++)>>8) & 0xFF);
			NVM_Off;		
			while(busyNVM());		// Wait until write is complete
		}

		NVM_On;
		writeSPI2(SST25_WRDI);	// Disables future writings
		NVM_Off;
}





