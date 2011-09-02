//------------------------------------------------
//		AD7781.h
//	AD7781 (20bit adc) communication
//	Arthur Benemann 27/07/2011
//------------------------------------------------
//
//	Description:
//	Read the conversion values from 4 AD7781 connected to the pic
//	uses a timer to read the digital interface
//
//-----------------------------------------------
//
//	Requeriments:
//	one timer, >2Khz interrupt
//	4 Input pins
//	4 Output pins
//
//-----------------------------------------------

extern volatile unsigned long data[4];

void adcTasks(void);