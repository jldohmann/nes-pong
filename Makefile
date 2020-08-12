build: main reset
	ld65 src/*.o -C nes.cfg -o pong.nes

main:
	ca65 src/pong.asm

reset:
	ca65 src/reset.asm

clean:
	rm src/*.o