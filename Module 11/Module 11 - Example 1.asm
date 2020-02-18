; Example 1: Configure the SCI with the following parameters
; 9600 bits per second with clock of 24Mhz
; 1 start bit, 8 data bits, 1 stop bit and no parity
; Long mode for idle detection
; No interrupts
; Enable both reciever and transmit functions

; We need to set the SCI registers for the above configurations
; Baud rate is set using the Baud rate registers: $00C8:$00C9.
;   The value needs to be 9600, which means the content of the register needs to be 156
; Control register: $00CA: $00CB
;   Set the M to 0 for 8 data bits
;   Set the PE to 0 for no parity
;   Set ILT to 1 for long mode for idle detection
;   Set all SCIOCR2 Interrupt flags bits to 0. RWU and SBK for multipoint but guess is 0
;   Set TE (RE) to 1
;   0000 0100 -> SCI0CR1
;   00001100 -> SCIOCR2

INIT_SCI:

    MOVW #156, SCIOBDH; Move #156 to SCI0BDH to set the baudrate
    MOVW #%00000100,SCIOCR1; For configuration of SCI interface
    MOVW #%00001100,SCIOCR2; For configuration of SCI interface
    rts; return from subroutine


void init_sci()
{
    SCIOBDH = 156;
    SCIOCR1 = %00000100
    SCIOCR2 = %00001100
}