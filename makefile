all: main.out

main.out:
	 gcc -g -o main.out $(wildcard src/*.c)

clean:
	rm main.out