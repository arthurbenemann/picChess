#include <stdio.h>

#include "chessEngine.h"
 
int main() {
	chessInit();

	while(1){
		if(chessGame(0)){
			return 0;
		}
	}
    return 0;
}