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

#define VREF		3.53		// Reference voltage (power supply as ref.)
#define ADC_RES		4096		// ADC Resolution in bits
#define SENSOR_RES	0.01		// LM35 Resolution (10mV/°C)
#define LM35_SCALE 	0.1			// Result scaling (1 bit = 0.1°C)

//-------------- Functions ----------------------
void initLM35(void);		// Initialize the LM35 sensor
int getTemp(void);			// Reads LM35 Output is in 0.1°C/bit
