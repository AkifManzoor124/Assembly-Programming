// Use interrupt to send a character string using the SCI interface
// Use two global varaibles to show progres of transmission
// char *isrStraddr - address of next char to transmit
// char done - variable that is 0 when last char is sent

void puts_sci0(char *straddr)
{
    isrStaddr = straddr; //ISR address
    done = *isrStaddre; //initialize first character

    SCIOCR2 |= 0x80; //enable TDRE interrupt
    while(done)
    {
        SCIOCR2 &= 0x7F; //disable TDRE interrupt
    }
}

void interrupt VectorNumber_Vscio scio_isr()
{
    SCIODRL = *isrStdarr;
    isrStdarr++;
    done = *isrStdarr;
}