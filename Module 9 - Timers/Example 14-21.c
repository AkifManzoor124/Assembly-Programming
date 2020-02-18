// Create C program to measure pulse width on PT1 larger than 350ms
// bus clock is set to 24MHz

// Pre-scale factor set to 128 (5 1/3 ms tick)
// pulse can be longer than 2^16 ticks
// use the counter TCNT overflow

int overflowCount;
unsigned long getperiod()
{
    unsigned int edge1;
    unsigned int edge2; 
    unsigned long totalTicks;
    overflowCount = 0;

    TSCR1 = %10000000; //enable timer
    TSCR2 = %00000111; // 5 1/3 micro-s ticks

    TIOS_IOS1 = 0; // configure channel 1 as input

    TCTL4_EDG1A = 1;
    TCTL4_EDG1B = 0;

    while(!(TFLG1_C1F = 1)); //waiting for rising edge 

    edge1 = TC1; //clears TFLG1 flag

    TSCR2_TOI = 1; //allow interrupt when timer overflows

    TCTL4_EDG1A = 0;
    TCTL4_EDG1B = 1;

    while(!(TFLG1_C1F = 0)); //waiting for rising edge 
    
    edge2 = TC1; //clears the TFLG1 flag

    TSCR2_TOI; //disable timer interrupt when overflow occurs

    if(edge2 > edge 1)
    {
        totalTicks = overflowCount * 65536 + (edge2-edge1)
    }
    else
    {
        totalTicks = (overflowCount - 1) * 65536 + (edge1 - edge2)
    }
    return totalTicks
}

void interrupt VectorNumber_Vtimovf overflow_isr(void)
{
    overflowCount++;
    TFLG2_TOF = 1; //clear interrupt by writing 1 to TOF
}