; Write subroutine send characters to Register A using polling method

;   TDRE needs to be 1 before writing to transmit register

PUTC_SCI0:
    BRCLR SCI0SR1, $80, putc_SCI0 ; continuosly checks if TDRE is 1
    ; BRCLR branches if the memory content SCI0SR1 is clear. The mask indicates which bit
    STAA SCI0DRL; Store the contents of Register SCI0DRL in Register A
    RTS

; Write subroutine to read a character in A using polling method

;   RDRF needs to be 1 before reading the recieve register

getc_SCI0:
    BRCLR SCI0SR1, $20, getc_SCI0;
    LDAA SCI0DRL; Load the contents of Register SCI0DRL to Register A
    RTS; Return from subroutine


void putc_sci0(char c)
{
    while(! SCI0SR1 & 0x80)
    {
        SCI0DRL = c
    }
}

char getc_scio()
{
    while(! SCI0SR1 & 0x20)
    {
        return(SCI0DRL)   
    }
}
