//------------------------------------------------
//		clock.c
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
#include "../Compiler.h"
#include "rtcc.h"
#include "clock.h"
//------------------- FUNCTIONS -----------------

//----------- initRTCC ----------------------
// Initialization of the RTCC modules
void initRTCC(void)
{
   	RtccInitClock();       	//turn on clock source
  	RtccWrOn();            	//enable RTCC writes
	mRtccOn();				//enable RTCC peripheral
	#ifdef _USE_RTCC_OUTPUT
		mRtccSetClockOe(1);	//Enables the Output Enable pin of the RTCC.
		_RTSECSEL = TRUE;	// Seconds Clock on RTCC pin
	#endif
}

//-------------- setRTCC --------------
// sets the RTCC to the datetime in the string
// string must be formated like "DDMMYYhhmmss"
void setRTCC(char *str)
{
	rtccTimeDate t;

   	RtccWrOn();            			//enable RTCC writes

    t.f.mday  = ((str[ 0]-'0')<<4);	// BCD codification for day of the month, 01-31
	t.f.mday +=  (str[ 1]-'0');
    t.f.mon   = ((str[ 2]-'0')<<4); // BCD codification for month, 01-12
	t.f.mon  +=  (str[ 3]-'0');
    t.f.year  = ((str[ 4]-'0')<<4); // BCD codification for year, 00-99
	t.f.year +=  (str[ 5]-'0');
    t.f.hour  = ((str[ 6]-'0')<<4); // BCD codification for hours, 00-24
	t.f.hour +=  (str[ 7]-'0');
    t.f.min   = ((str[ 8]-'0')<<4); // BCD codification for minutes, 00-59
	t.f.min  +=  (str[ 9]-'0');
    t.f.sec   = ((str[10]-'0')<<4); // BCD codification for seconds, 00-59 
	t.f.sec  +=  (str[11]-'0');
	t.f.wday  = 0;			       	// BCD codification for day of the week, 00-06  

	RtccWriteTimeDate(&t,TRUE);		// try to write this structure
	mRtccOn();						//enable RTCC peripheral

	return;
}

//------------- getTime ---------------
// Gets the time from the RTCC, and save
// it to a string in the format xx:xx:xx
// the string must be at least 9 chars long
void getTime(char *str)
{
	rtccTime time;

	// read the time from the RTCC
	RtccReadTime(&time);

	// Convert the time to a string
	str[0] = '0'+((time.f.hour&0xf0)>>4);
	str[1] = '0'+ (time.f.hour&0x0f);
	str[2] = ':';
	str[3] = '0'+((time.f.min &0xf0)>>4);
	str[4] = '0'+ (time.f.min &0x0f);
	str[5] = ':';
	str[6] = '0'+((time.f.sec &0xf0)>>4);
	str[7] = '0'+ (time.f.sec &0x0f);
	str[8] = 0;
}

//----------- getDate -------------------
// Gets the date from the RTCC, and save
// it to a string in the format xx/xx/xx
// the string must be at least 9 chars long
void getDate(char *str)
{
	rtccDate date;

	// read the time from the RTCC
	RtccReadDate(&date);

	// Convert the date to a string
	str[0] = '0'+((date.f.mday&0xf0)>>4);
	str[1] = '0'+ (date.f.mday&0x0f);
	str[2] = '/';
	str[3] = '0'+((date.f.mon &0xf0)>>4);
	str[4] = '0'+ (date.f.mon &0x0f);
	str[5] = '/';
	str[6] = '0'+((date.f.year&0xf0)>>4);
	str[7] = '0'+ (date.f.year&0x0f);
	str[8] = 0;
}
