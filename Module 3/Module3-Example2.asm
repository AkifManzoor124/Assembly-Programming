; 4 element array stored in memory starting at address $900
; Write a program to add all the elements in the array and put sum in A

N:  EQU 4;
putchar:    EQU $F684;

ORG $800
clra; clear contents of register A
ldx $A_start; Load X with memory location A_start
ldab #N

LOOP:
    adda 0,x; Go to memory location which is held in Register X. Indexed Addressing
    inx; Increment x
    decb; decrement b. Raises Z flag if B is 0
    bne loop; Branch if Not Equal, Z = 0
LDX putchar
jsr 0,x; jump to subroutine putchar located at $F684
swi; stop

ORG $820
A_start db 1,2,3,4