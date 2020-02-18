; Initialize the RAM Interrupt Vector of Port P


UserPortP:  EQU 7;
setuservector:  EQU $EEA4;

MAIN:

    LDD #PortP_isr; ISR vector for Port P
    PSHD; pass PORT P interrupt vector via stack
    ldd #UserPortP; pass interrupt vector number of PORT P through D to setuservector
    jsr [setuservector,PCR]
    leas 2,SP
    CLI

PortP_isr:
    ;
    RTI