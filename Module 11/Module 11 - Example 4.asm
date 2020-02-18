; Use interrupt to send character string using the SCI interface on the EVB board
; Using the D-BUG12 monitor for setting up the interrupts

; Use global variables to communicate between main program and transmission ISR
; straddr - address of next char to transmit (main -> ISR)
; done - variable that is 0 when last char has been sent
; Index Register X contains the address of the string to transmit 

init_sci0:
    LDD SCI0_isr ; interrupt vector
    PSHD;
    LDAB #SCIO_vec_no
    CLRA
    JSR [setuservector,PCR]

    MOVB #52, SCIOBDH; Set the data rate
    MOVB #$04, SCIOCR1; Set ILT
    MOVB #$0C, SCIOCR2; Set TE and RE
    RTS

put_SCI0:
    BSET SCIOCR2, $80; enable TDRE interrupt
    CLI
    STX straddr; pass address of string to ISR
    movb 0,X,done; put 1st char in done

loop:
    tst done; wait until end of transmission
    bne loop; when ISR will put null in done
    BCLR SCIOCR2, $80; disable TDRE interrupt
    SIE
    RTS

SCI0_ISR:
    LDX straddr; get addr of next char
    MOVB 0,X, SCIODRL; put into transmission register
    INX
    STX straddr

ENDISR:
    MOVB 0,X,done; shwo next char to MAIN
    RTI