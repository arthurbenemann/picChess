/*----------------------------------------------
//					sst25vf016.h
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

#define SST25_SPRE		0x6			// Secondary Prescaler 2:1
#define SST25_PPRE		0x2			// Primary Prescaler 4:1

#define SST25_SIZE		0x200000	//	16Mbit flash

//-------- Functions -------------
void initNVM(void);
void clearNVM(void);
int readNVM(long addr);
void writeNVM(char data,long address);
void writeBufNVM(int *buf,int len,long address);
void readBufNVM(int *buf,int len,long address);		
