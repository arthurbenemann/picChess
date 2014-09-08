#include <stdio.h>
#include <signal.h>
#include "chessEngine.h"
 
int main() {
	signal(SIGINT,SIG_IGN);
	chessInit();

	while(1){
		if(chessGame(0)){
			return 0;
		}
	}
}