// Generate 250Hz frequency digital square wave on PT0 (use channel 0)
// Use interrupts
// Bus-Clock 24Mhz Frequency

#define HALF_P 3000 //3000 ticks = 2ms
void interrupt VectorNumber_Vtimch0 oc0_isr(void);

void main()
{
    TSCR1 = %10010000; //Enable timer and fast clear
    TSCR2 = %00000100; //setup prescaler

    TIOS_IOS0 = 1; //output capture for channel 0
    //Set PT0 pin to toggle
    TCTL2 = %00000001;
    

    //TC0 = current time plus 2ms. Interrupt thrown after 2ms
    TC0 = TCNT + HALF_P;

    asm BSET TIE, %00000001; //Enable channel 0 to throw interrupts
    asm CLI; //Allow system to throw interrupts

    for(;;)
}

void interrupt VectorNumber_Vtimch0 oc0_isr(void)
{
    TC0 = TC0 + HALF_P;
}