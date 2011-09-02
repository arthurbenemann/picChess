//------------------------------------------------
//		clockVideo.c
//	A visual clock for video output
//	Arthur Benemann 23/11/2010
//------------------------------------------------
//
//	Description:
//	Plots a clock on the video buffer
//
//-----------------------------------------------
//
//	Requeriments:
//	RTCC module up and running
//
//-----------------------------------------------

#include <math.h>			// trigonometric functions
#include "rtcc.h"			// RTCC module
#include "../CLOCK/clock.h"	// for getTime()
#include "../VGA/VGA.h"		// Video Screen Buffers
#include "../VGA/text.h"	// Video text

#include <stdio.h>			// temperature string
#include "../LM35/LM35.h"		// Temperature Module

//------------------ DEFINES----------------------

// Analog clock position
#define C_RAD	(60)
#define C_X0	(HRES/2)
#define C_Y0	(10+VRES/2)
#define C_MARK	(5)
#define C_SEC	(C_RAD-7)
#define C_MIN	(C_RAD-18)
#define C_HOUR	(C_RAD-30)
#define PI		(3.141592)

// Digital time position
#define TIME_X0		((HRES-FONT_X*8)/2)
#define TIME_Y0		((C_Y0-C_RAD)/2)
// Digital time position
#define DATE_X0		((HRES-FONT_X*8)/2)
#define DATE_Y0		(TIME_Y0-FONT_Y)

// Temperature position
#define TEMP_X0	(HRES-FONT_X*7)
#define TEMP_Y0	(VRES-FONT_Y)

//---------------- PRIVATE PROTOTYPES -------------
void plotClock(void);

//------------------ FUNCTIONS --------------------

//-------------- displayClock --------------
// Refresh clock video at 2Hz
void diplayClock(void)
{
	static int refreshed;
	if(_HALFSEC)
	{
		if(refreshed)
		{
			refreshed = 0;
			plotClock();
		}
	}
	else
		refreshed = 1;
}
//-------------- plotClock ------------------
// plots a analog clock on the screen
// with the timing from the RTCC
void plotClock(void)
{
	double x,y;
	rtccTime time;
	int sec,min,hour;
	char str[10];

	// read the time from the RTCC
	RtccReadTime(&time);
	sec = ((time.f.sec&0xf0)>>4) *10 +(time.f.sec &0x0f);
	min = ((time.f.min&0xf0)>>4) *10 +(time.f.min &0x0f);
	hour =((time.f.hour&0xf0)>>4)*10 +(time.f.hour&0x0f);

	// Clean the screen to start painting
	cleanHScreen();

	// Plot the outter circle
	plotCircle(C_X0,C_Y0,C_RAD,1);	

	// plot clock marks
	plotLine(C_X0+C_RAD-C_MARK,C_Y0,C_X0+C_RAD,C_Y0,1);
	plotLine(C_X0-C_RAD+C_MARK,C_Y0,C_X0-C_RAD,C_Y0,1);
	plotLine(C_X0,C_Y0+C_RAD-C_MARK,C_X0,C_Y0+C_RAD,1);
	plotLine(C_X0,C_Y0-C_RAD+C_MARK,C_X0,C_Y0-C_RAD,1);

	// Plot the inner circle filed
	plotCircle(C_X0,C_Y0,2,1);
	plotSquare(C_X0-1,C_Y0-1,C_X0+1,C_Y0+1,1,1);

	// Plot the seconds hand
	x = C_SEC*sin(sec*((PI)/30.0));
	y = C_SEC*cos(sec*((PI)/30.0));
	plotLine((int)x+C_X0,(int)y+C_Y0,C_X0,C_Y0,1);


	// Plot the minutes hand
	x = C_MIN*sin(min*((PI)/30.0));
	y = C_MIN*cos(min*((PI)/30.0));
	plotLine((int)x+C_X0,(int)y+C_Y0,C_X0,C_Y0,1);

	// Plot the Hours hand
	x = C_HOUR*sin(hour*((PI)/6.0)+min*((PI)/360.0));
	y = C_HOUR*cos(hour*((PI)/6.0)+min*((PI)/360.0));
	plotLine((int)x+C_X0,(int)y+C_Y0,C_X0,C_Y0,1);

	
	// Plot the digital value
	getTime(str);				// gets the time
	putsV(str,TIME_X0,TIME_Y0);	// put it on the screen
	
	// Plot the date
	getDate(str);				// gets the time
	putsV(str,DATE_X0,DATE_Y0);	// put it on the screen


	int i;
	i = getTemp();
	//putU2(i);
	sprintf(str,"%d.%d`C",i/10,i%10);
	putsV(str,TEMP_X0,TEMP_Y0);

	// Display the frame
	swapV();

}
