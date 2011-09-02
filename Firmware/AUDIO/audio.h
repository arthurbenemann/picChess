//----------------------------------------------
//				audio.h
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

//--------------- Functions ------------------
void initSound(void);
void playSound(int i);
int isPlaying(void);
