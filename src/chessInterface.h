//------------------------------------------------
//		chessInterface.h
//	Arthur Benemann 
//						13/06/2011
//------------------------------------------------
//  
//	Description:
// Header for the functions used for the chess interface, video menus , etc.
//
//-------------------------------------------------

//------------------------------- STRUCTS ------------------------------
// GameTypes
enum gameType{PvP,PvC,CvP,CvC,};

// Cursor
typedef struct
{
	union
	{
		unsigned char pos;
		struct{
			unsigned x:3;
			unsigned :1;
			unsigned y:3;
		};	  
	};
	char PieceSel;
	enum{		
		SC_NONE,				// No input
		SC_CURSOR,				// Cursor on screen
		SC_SEL,					// Cursor and piece Selected
		SC_TEXT				// Text input
		} State; 	
} TCursor;
void errorOverflow(void);

//---- Move utilits
void strToMove(char *str,MOVE *m);
void moveToStr(MOVE m,char* buf);
int getMove(MOVE *m, unsigned char key);

//---- Publishing Functions
void announceCheckmate(void);
void announceStalemate(void);
void publishMove(MOVE m);
void publishLevel(int level);

//---- aux. functions
void waitForEnter(void);

