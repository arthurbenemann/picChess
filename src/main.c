#include <stdio.h>
#include <signal.h>
#include <string.h>
#include "chessEngine.h"
 
int main() {
	char buf[256];
	do{
		fgets(buf, 256, stdin);
		printf("# received %s\n", buf );
		fflush(stdout);
	}while(strcmp(buf,"protover 2\n")!=0);
	
	printf("feature sigint=0 done=1\n");
	fflush(stdout);

	chessInit();

	while(1){
		if(chessGame(0)){
			return 0;
		}
	}
}