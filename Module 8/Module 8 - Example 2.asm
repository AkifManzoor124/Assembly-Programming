
; A button is connected to IRQ
; A counter is incremented when button is pressed
; Counter contents are displays on LEDs

RAM_addr_IRQ:   EQU $3E72;

    ORG $1500
SETUP:
    LDS #$1500; setup stack pointer

    CLR CTR; Clear contents of ctr variable

    MOVB #$FF, DDRB; Configure Port B as output
    MOVB CTR,PORTB; display the count value on LEDs
    
    movw #irq_isr, RAM_addr_IRQ; establish IRQ interrupt vector entry in RAM
    MOVB #$C0, IRQCR; enable IRQ interrupt on falling edge
    CLI; enable interrupts

forever:
    nop
    bra forever

irq_isr:
    inc CTR  
    movb count,PORTB
    rti

ORG $1000
CTR:  ds.b    1; reserve one byte for count


