all: main.out

main.out:
	 gcc -g -o main.out $(wildcard src/*.c)

clean:
	rm -f main.out

test:
	xboard -fcp fairymax -scp /home/arthurbenemann/picChess/main.out -mg 1 -searchTime 0:03

