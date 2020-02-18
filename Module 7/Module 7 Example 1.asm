; The HCS12 device is running on single chip mode
; What instructions configures PORT A as output port
; Write the contents of accumulator A on the PORT A pins

; PORTA is located at $0000
; The Direction Data Register DDRA is held at $0002
; We need to set DDRA to output, which means all DDRA bits must be 1


PORTA   EQU $00
DDRA    EQU $02

MOVB #$FF, DDRA; Move FF to DDRA to set all DDRA bits to 1
STAA PORTA; Write the current contents of register A to port A.

