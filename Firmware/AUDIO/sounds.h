//----------------------------------------------------------
//		sounds.h
//	 waveBurner Header
//	 Arthur Benemann   25/06/2011 19:36:30
//----------------------------------------------------------
//
//	Description:
// This is the header for the hex that contains the sound
// The address of each sound in the hex file is listed here
//
//----------------------------------------------------------

#define NUM_SOUNDS	9

//----------------------- Sounds ---------------------------
#define	S_CHECKMATE	0x00	//15 Kbytes
#define	S_DAMN	0x01	//22 Kbytes
#define	S_GETSOME	0x02	//23 Kbytes
#define	S_HOLY	0x03	//16 Kbytes
#define	S_NIRVANA	0x04	//627 Kbytes
#define	S_OFFSPRING	0x05	//433 Kbytes
#define	S_PIECEOFCAKE	0x06	//25 Kbytes
#define	S_RHCP	0x07	//627 Kbytes
#define	S_TUC	0x08	//1 Kbytes


extern const long soundAdd[];
extern const unsigned int soundLengths[] ;
