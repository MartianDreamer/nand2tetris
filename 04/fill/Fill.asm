// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// Set size
@24575
D=A
@size
M=D

// Listening to keyboard
(LISTEN_KBD)
@16384
D=A
@pos
M=D
@KBD
D=M
@PRESSED
D;JNE
@UNPRESSED
0;JMP

(PRESSED)
@SCREEN
D=M
@LISTEN_KBD
D;JLT
(PRESSED_LOOP)
@pos
M=M+1
A=M-1
M=-1
D=A
@size
D=M-D
@PRESSED_LOOP
D;JGT
@LISTEN_KBD
0;JMP

(UNPRESSED)
@SCREEN
D=M
@LISTEN_KBD
D;JEQ
(UNPRESSED_LOOP)
@pos
M=M+1
A=M-1
M=0
D=A
@size
D=M-D
@UNPRESSED_LOOP
D;JGT
@LISTEN_KBD
0;JMP