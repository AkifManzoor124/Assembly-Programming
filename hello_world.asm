CR:     EQU $0d; Carriage Return
LF:     EQU $0a; Line Feed
EOS:    EQU 0; End of String

PROG:   EQU $8000; Flash memory
STACK:  EQU $0a00; Stack pointer variable initialized to $0a00
        
    ORG PROG;

    LDS #STACK; Load stack pointer register with stack pointer variable. Initialize Stack
loop:
    ldd #HELLO; Load register D with HELLO
    jsr printf; jump to subroutine printf
    ; Maybe the stack pointer is needed so the program knows to come back here after
    ; finishing the printf subroutine

    bra loop; Branch always to loop:

HELLO: DC.B 'Hello World!', EOS