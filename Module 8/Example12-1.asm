;initialize Interrupt Vector

XDEF Entry, main
XREF __SEG_END_SSTACK
XDEF IRQISR; ISR is made visible to linker

INTCR:  EQU $001e; IRQ_L control register located at $001e
IRQEL:  EQU %10000000; IRQ_L edge bit
IRQEN:  EQU %01000000; IRQ_L enable

LDS #__SEG_END_SSTACK; initialize the stack

BCLR INTCR, IRQE; Set low level interrupt on IRQ
BSET INTCR, IRQEN; Enable the interrupt for IRQ_L
CLI; Unmask interrupts

IRQISR:
    ;
    RTI



//Assembler Version with D-Bug12

#include mc9s12dg256.inc;

USERIRQ:    EQU 57; 
setuservector:  EQU $EEA4;

main;
    BSET DDRA, $01; //make port A into output
    BCLR PORTA, $01; //turn off the led
    BSET INTCR, %10000000; // falling edge interrupt
    BSET INTCR, %01000000; //turn on interrupt

    LDD #IRQISR //MY ISR ADDRESS
    PSHD        //Push variable to stack
    
    LDD #USERIRQ; //load USERIRQ
    JSR [setuservector, PCR];
    LEAS 2,CLI
    CLI

LOOP:
    BRA LOOP;

IRQISR:
    BRSET PORTA, $01, turnoff
    BCLR PORTA, $01
    BRA leave

turnoff:
    BSET PORTA, $01

LEAVE:
    TRI