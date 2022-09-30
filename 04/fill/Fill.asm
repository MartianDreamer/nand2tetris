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
@24576 // 0
D=A //
@R0 //
M=D // save size of the screen
@KBD //4
D=M // get keyboard value
@10 
D;JNE // if keyboard is being pressed jump to instruction 10
@30
0;JMP // else jump to instruction 4
@SCREEN // 10
D=A //
@R1 //
M=D // reset current pixel position
@SCREEN
D=M
@4
D+1; JEQ
@R0 // 24
D=M // get screen size
@R1
M=M+1
A=M-1
M=-1 // set screen to black
@R1
D=D-M
@18
D;JNE
@4
0;JMP
@SCREEN
D=M
@4
D; JEQ
@SCREEN // 10
D=A //
@R1 //
M=D // reset current pixel position
@R0 //38
D=M // get screen size
@R1
M=M+1
A=M-1
M=0 // set screen to white
@R1
D=D-M
@38
D;JNE
@4
0;JMP