

SOURC:  EQU $A000; Location of first memory location where the 10 elements are stored
COPY:   EQU $A100; Location of the first memory location where the 10 elements need to be stored
N:      EQU 10; Number of elements to be stored

ORG $800; Load the PC register with $800

LDAB #N; Load register B with N
LDX #SOURC; Load the index register X using immediate addressing mode with SOURC
LDY #COPY; Load the index register Y using immediate addressign mode with COPY

LOOP:
    MOVB 1,X+, 1,Y+; Direct Adressing mode. Don't understand why we use 1,X and not 0,X
    ;Also increments the X and Y register after execution of program to point to next avaliable address
    DBNE B, LOOP; Decrement Register B where counter is and Branch if B is not 0
    SWI; If A is 0, branch is skipped and program will stop
