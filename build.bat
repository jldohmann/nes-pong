@echo off
c:\cc65\bin\ca65 src\pong.asm
c:\cc65\bin\ca65 src\reset.asm
c:\cc65\bin\ld65 src\pong.o src\reset.o -C nes.cfg -o pong.nes
del src\*.o /q