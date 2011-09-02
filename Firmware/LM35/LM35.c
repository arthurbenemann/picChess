/*----------------------------------------------
//					LM35.c
//	LM35 temperature sensor
// 	Arthur Bemann 09/06/2011
//-----------------------------------------------
//
//	Description:
//	Reads a LM35 sensor with the ADC,
//	Apply some filtering and return the data
//
//-----------------------------------------------
//
//	Requeriments:
//	ADC
//	1 Analog pin
//
//-----------------------------------------------
*/

#include "../Compiler.h"	// Processor includes
#include "../HardwareProfile.h"
#include "LM35.h"

//------------------- CONSTANTS ------------------------
#define LM35_CAL	(((ADC_RES*SENSOR_RES)/(VREF))*LM35_SCALE)
#define AVERAGE	32


//---------------- initTemp ------------------------------
// Initialize the ADC for reading the tLM35 temperature sensor
void initLM35(void)
{
	LM35_CFG = 0; 			// Configure temp sensor pin as analog input
	_VCFG  = 0;				// Power supply as reference
	_ADRC  = 1; 			// Internal ADC RC clock

	_SIMSAM = 0;			// No simultanius samples
	_SSRC  = 0x7;			// Auto convert when sampling done
	_ASAM  = 0;				// Manual Start of sampling
	_SAMC  = 0x1f;			// Sample time of 31 TAD

	_AD12B = 1;				// 12 bits ADC
	AD1CON1bits.FORM = 0;	// Output as unsigned integer
	
	_ADON  = 1;				// Turn the ADC module ON
}

//--------------- getTemp ------------------------------
// Reads a sample from the temperature sensor
// Averraing of 32 values
int getTemp(void)
{
	unsigned int i,data;

	data = 0;
	for(i=0; i<AVERAGE; i++)		// Take the mean from 32 samples
	{
		_CH0SA = LM35_AN;
		_SAMP  = 1;
		while(!_DONE);
		data+= ADC1BUF0;
	}
	return (unsigned int)(data/(AVERAGE*LM35_CAL));
}
