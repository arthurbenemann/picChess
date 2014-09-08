//------------------------------------------------
//		chessInterface.c
//	Arthur Benemann 
//						26/05/2011
//------------------------------------------------
//  
//	Description:
// All the interface gfrom the user to the chess engine
// is made trought here.
// This module commands the outputs to the video, sound
// and serial.
//
// The main function is getMove(), who mhandels the user
//	input of moves
//
//
// Clock can be adjusted by entering "sDDMMYYhhmmss",
// in the text input mode
// DD - Day, MM - Month, YY - Year
// hh - Hour,mm - Minute,ss - Seconds
//
//
//	Requiriments:
//	Timer 1 - for the blinking piece
//
//-------------------------------------------------
#include <stdio.h>
#include <ctype.h> 				// for isalnum 
#include <string.h> 			// for strlen
#include "chessEngine.h"		// chess game definitions
#include "chessInterface.h"		// interfacing functions

//------------------------------ PRIVATE PROTOTYPES --------------------------------
void textInput(char c);
int validSelect(void);
int isDirEnt(unsigned char c);
void redraw(void);
unsigned checkCastle(MOVE m);
unsigned checkPromo(MOVE m);
unsigned getPromo(void);

//--------------------------------- MACROS --------------------------------------
#define isEnter(P)	((P==ENTER)||(P==KP5))

//--------------------------------- FUNCTIONS --------------------------------------

int getMove(MOVE *m, unsigned char key){
	char buf[256];
	while(1){
		fgets(buf, 256, stdin);
		if (buf[0]>='a'&&buf[0]<='h'){
			if (buf[1]>='1'&&buf[1]<='8'){
				if (buf[2]>='a'&&buf[2]<='h'){
					if (buf[3]>='1'&&buf[3]<='8'){
						break;
					}
				}
			}
		}
	}
	strToMove(buf,m);
}

//------------- publishMove -------------
// send it via serial
void publishMove(MOVE m)
{
	char buf[16];
	// send move via serial
	moveToStr(m,buf);
	printf("move %s\n",buf);
	fflush(stdout);
}


//------------- announceCheckmate ---------------------
// Function is called when a checkmate is made
// Alert via serial and display in the video
void announceCheckmate(void)
{
	printf("Checkmate\n");
}

//------------- announceStalemate ---------------------
// Function is called when a stalemate is made
// Alert via serial and display in the video
void announceStalemate(void)
{
	printf("Stalemate\n");
}

//---------------- moveToStr ------------
// Convert a MOVE variable to a algebraic
// chess notation string. 
// sizeof(Buf) must be > 6.
void moveToStr(MOVE m,char* buf)
{
    *buf++ = (m.from&7) +'a';		// file
    *buf++ = (m.from>>4)+'1';		// row
	*buf++ = (m.to&7) +'a';			// file
    *buf++ = (m.to>>4)+'1';			// row

	switch(m.status.promotion){		// add "=X" promotion chars if needed
		case queen:
			*buf++ = '=';
			*buf++ = 'q';
			break;
		case rook:
			*buf++ = '=';
			*buf++ = 'r';
			break;
		case bishop:
			*buf++ = '=';
			*buf++ = 'b';
			break;
		case knight:
			*buf++ = '=';
			*buf++ = 'n';
			break;
	}

	*buf++ = '\n';
    *buf = 0;						// string end
}

//---------------- strToMove ------------
// Convert algebraic chess notation string
// to a move.
void strToMove(char *str,MOVE *m)
{
	m->from = str[0]-'a'+ (str[1]-'1')*16;
	m->to   = str[2]-'a'+ (str[3]-'1')*16;
	if(board[m->to]!=empty)
		m->eat  = board[m->to];
	else
		m->eat  = empty;
	m->status.Castle = checkCastle(*m);
	if(str[4]=='=')						// check if there is a promotion
		switch(str[5]){
			case 'q':
				m->status.promotion = queen;
				break;
			case 'r':
				m->status.promotion = rook;
				break;
			case 'b':
				m->status.promotion = bishop;
				break;
			case 'n':
				m->status.promotion = knight;
				break;
			default:
				m->status.promotion = 0;
				break;
		}
	else
		m->status.promotion = 0;
	
}


//------------------- errorOverflow ---------------
// in case of overflow send a message via serial
// and show a box on the screen
void errorOverflow(void)
{
	printf("OVERFLOWWWWW\n");
}
