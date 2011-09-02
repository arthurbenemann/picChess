//------------------------------------------------
//		gameOfLife.c
//	Arthur Benemann 
//						27/05/2011
//------------------------------------------------
//  
//	Description:
//
//-------------------------------------------------

#include "../VGA/VGA.h"			// Video Buffer and graphics functions
#include <stdlib.h>				// for rand() function

//------------------------------ CONSTANTS ------------------------------------------
#define DEAD	0
#define LIVE	(!DEAD)

//------------------------------ PRIVATE PROTOTYPES --------------------------------
int countLiveCells(int x, int y);
void evolve(void);


/*	Acorn
		plotDot(99,100,1);
		plotDot(100,100,1);
		plotDot(100,102,1);
		plotDot(102,101,1);
		plotDot(103,100,1);
		plotDot(104,100,1);
		plotDot(105,100,1);
*/

/*	Glider
		plotDot(101,100,1);
		plotDot(102,100,1);
		plotDot(103,100,1);
		plotDot(103,101,1);
		plotDot(102,102,1);
*/
/*
//		Glider Gun
		plotDot(90 ,76,1);
		plotDot(90 ,75,1);
		plotDot(91 ,75,1);
		plotDot(91 ,76,1);
		plotDot(100,75,1);
		plotDot(100,76,1);
		plotDot(100,74,1);
		plotDot(101,73,1);
		plotDot(101,77,1);
		plotDot(102,72,1);
		plotDot(102,78,1);
		plotDot(103,72,1);
		plotDot(103,78,1);
		plotDot(104,75,1);
		plotDot(105,73,1);
		plotDot(105,77,1);
		plotDot(106,74,1);
		plotDot(106,75,1);
		plotDot(106,76,1);
		plotDot(107,75,1);
		plotDot(110,76,1);
		plotDot(110,77,1);
		plotDot(110,78,1);
		plotDot(111,76,1);
		plotDot(111,77,1);
		plotDot(111,78,1);
		plotDot(112,75,1);
		plotDot(112,79,1);
		plotDot(114,74,1);
		plotDot(114,75,1);
		plotDot(114,79,1);
		plotDot(114,80,1);
		plotDot(124,77,1);
		plotDot(124,78,1);
		plotDot(125,77,1);
		plotDot(125,78,1);

//		LWSS

		plotDot(100,101,1);
		plotDot(100,102,1);
		plotDot(101,101,1);
		plotDot(101,102,1);
		plotDot(101,103,1);
		plotDot(102,100,1);
		plotDot(102,102,1);
		plotDot(102,103,1);
		plotDot(103,100,1);
		plotDot(103,101,1);
		plotDot(103,102,1);
		plotDot(104,101,1);
	
*/

/*		putsV("Arthur Benemann",10,75);
*/
//--------------------------------- FUNCTIONS --------------------------------------

void gameOfLife(unsigned char key)
{
	evolve();
	swapV();
}

void randomizeScreen(int seed, int n)
{
	srand(seed);		// randomize random number generator
	
	while(n-->0)		// fill the screen with 'n' random dots
		plotDot(rand()%HRES,rand()%VRES,1);	
	
	swapV();
}
 
int countLiveCells(int x, int y)
{
   	unsigned int i, j; 					// unsigned so negative values are big numbers (out of screen)
	int count;

	count = (readDotA(x,y)!=DEAD)?-1:0;	// -1 so when it scans it self the cont gets right

   	for( i=x-1; i!=(x+2); i++)			// Run trought all squares in the neighborhood 
      	for( j=y-1; j!=(y+2); j++)		// and it self
         	if ((i<HRES) && (j<VRES))	// Check for out of the screen scan
				if(readDotA(i,j)!=DEAD)	// if cell is alive add 1 to the count
              		count++;
   return count;						// Retorn the count of alive cells
}
 
void evolve(void)
{
   	int i, j, count, state;

   	for(i=0; i < HRES; i++)				// scans all cells in the screen
      	for(j=0; j < VRES; j++)
      	{
         	count = countLiveCells(i,j);// get the number of neighbors of this cell
         	state = readDotA(i,j);		// and it's state
         	if (state != DEAD)			// Decide the cell future based on this info
         	{	// cell is alive
            	if ((count>3)||(count<2))
            		plotDot(i,j,DEAD); 	// Cell Die by under-population or overcrowding
            	else
                	plotDot(i,j,LIVE);	// Cell lives happy with two or three neighbors
         	} 
			else 
			{	// cell is dead
            	if ( count == 3 )
                	plotDot(i,j,LIVE);	// Reproduction if three cells met over a dead one 
            	else
                	plotDot(i,j,DEAD);	// R.I.P
         	}
      	} // run trought all cells
}
