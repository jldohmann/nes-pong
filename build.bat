@echo off
c:\cc65\bin\ca65 src\pong.asm
c:\cc65\bin\ld65 src\pong.o -t nes -o pong.nes