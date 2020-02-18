; Add all numbers greater than 0 of an N element array stored in memory
; beginning at the address A_start and store results at A_result
; Sum -> accumulator A
; ctr -> accumulator B
; ptr -> register X

; C code:

; int sum = 0;
; int i;
; int n;
; int array[n];

; for(i = 0; i < n; i++)
; {
;     if(array[i] < 0)
;     {
;         continue;        
;     }
;     else
;     {
;         sum += array[i]; 
;     }
; }

N:      EQU 4; n is the number of elements held within the array
ORG $800

CLRA;   Clear the contents of register A. This is where we store the sum
LDX #A_start;    Load the register X with ptr
LDAB #N;    Load register B with counter

LOOP:
    TST 0,X; test memory location if it is 0 or a minus; This is the if statement; Causes N = 1 
    BMI NEXT; Check if N = 1;
    ADDA 0,X; 
NEXT:
    INX; increment register X to point to next memory location
    dbne B,LOOP; Decrement counter in register B and branch to LOOP   
    STAA A_result; when B = 0 and no more elements in array, store sum in A

STAA $A_result; We store the sum held in register A in memory location A_result

ORG $820
A_result ds 1
A_start db 1,-2,3,-4