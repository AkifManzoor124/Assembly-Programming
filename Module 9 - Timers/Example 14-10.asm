; Write a program to create a 1sec delay with timer module (channel 2)
; Assume 24MHz Clock
; Make LED blink with 1 sec interval

RAM_addr_TC2:   EQU $3E6A;

LED1:   EQU $01; PIN 0 attached to LED
NTIMES: EQU 250; number of interrupts for 1 sec delay
MS_4:   EQU 6000; counter ticks for 4ms delay

SETUP:

    MOVW #oc2_isr, RAM_addr_TC2; establish OC2_ISR interrupt vector in RAM

    BSET DDRB, #FF; Set Port B to Output
    BCLR PORTB, LED1; Turn off LED

    MOVB %10010000; Turn on Timer module and turn on fast clear
    BSET TIOS, IOS2; Use channel 2
    MOVB %00000100, TSCR2; 2/3 micro-s ticks
    BSET TIE, C2I; Enable TC2 Interrupts
    CLI

    MOVB #NTIMES, counter; setup counter
    ADDD #MS_4; first interrupt occurs in 4ms
    STD TC2;

spin:
    wai; waits for first interrupt
    tst counter; is counter at zero
    bne spin
    movb #NTIMES, counter; reinitialize counter
    eora LED1; toggles PORT bits
    STAA PORTB
    bra spin

oc2_isr:
    dec counter
    ldd TC2
    ADDD #MS_4
    STD TSCR2
    RTI

counter DS.B 1;