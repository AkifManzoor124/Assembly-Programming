void main(void)
{
    DDRA_BIT0 = 1; //make Port A(7) output port
    PORTA_BIT0 = 0; //Turn on LED

    INTCR_IRQE = 1; //Initialize INTCR:IRQE for falling edge interrupts
    INTCR_IRQEN = 1; //Enable interrupts from IRQ_L
    EnableInterrupts;
}

void interrupt IRQISR(void)
{
    if(PORTA_BIT0 = 1)
    {
        PORTA_BIT0 = 0;
    }
    else
    {
        PORTA_BIT0 = 1;
    }
    
}
