build: main
	ld65 src/*.o -t nes -o pong.nes

main:
	ca65 src/pong.asm

clean:
	rm src/*.o