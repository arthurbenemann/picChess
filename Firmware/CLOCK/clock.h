//------------------------------------------------
//		clock.h
//	RTCC routines.
//	Arthur Benemann 23/11/2010
//------------------------------------------------
//
//	Description:
//	Rotines of the RTCC. Initialization,
//	Transform the time to a string,

//
//-----------------------------------------------
//
//	Requeriments:
//	RTCC module
//	32kHz oscilator in SOSC
//
//-----------------------------------------------

//-------------- CONFIG -------------------------
// Uncomment next line if you want the RTCC output
#define _USE_RTCC_OUTPUT

// Refresh rate of the screen
#define REFRESH_RATE	0xffff

//-------------- FUNCTIONS ---------------------
void initRTCC(void);
void getTime(char *str);
void getDate(char *str);
void setRTCC(char *str);
void diplayClock(void);
