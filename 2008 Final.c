
#define ONE_HUNDRED_MS 18750;
#define alarmStatus;

initDoorWindoMonitor()
{
    DDRB = 0xFF;
    PUCR = %00000000; //deactivate pullup registers
    DDRH = 0x00;

    TSCR1_TEN = 1; //enable timer. May be done in main function
    TSCR1_AFFC = 1; //automatic flag clear
    TIOS_IOS0 = 1; //Set timer channel 0 to output compare

    TC0 = TCNT + ONE_HUNDRED_MS; 

    TIE_CO0 = 1; //Allow timer channel 0 to throw interrupt

}


void interrupt VectorNumber_Vtimch0 monitor_isr()
{
    PORTH = PORTB; //reflect status of switches on LED;
    //turns on the LED for cooresponding switch

    if(PORTH != 0x00)
    {
        alarmStatus = FALSE;
    }
    else
    {
        alarmStatus = TRUE;
    }
    

    TCO = TC0 + ONE_HUNDRED_MS;
}


/*
A speaker is connected to PT5 of Timer port
Generating a 1kHz signal rectangular wave shape of 40% duty cycle
*/
#define POINT_4_MS 75
#define POINT_6_MS 112
#define

initSiren()
{
    //configure as output channel
    //toggle the output pin
    TIOS |= %00100000
}

#define HIGH 1
#define LOW 0
int levelTC5;
turnOnSiren()
{
    TCTL1 |= 0b00001100; // Sets high on pin 5 at output-compare event
    CFORC = 0b00100000; // Force an event on TC5 (i.e high on pin 5)
    levelTC5 = HIGH;

    TCTL1 &= 0b11110111; // Set to toggle
    TC5 = TCNT + POINT_4_MS;
    TIE |= 0b00100000; //enable interrupt
}

void turnOffSiren()
{
    //set the pin to 0
    //force the event to the pin
    //disable the interrupt
}

void interrupt VectorNumber_Vtimch5 siren_isr()
{
    if(levelTC5 = HIGH)
    {
        TC5 = TC5 + POINT_6_MS;
        levelTC5 = LOW;
    }
    else
    {
        TC5 = TC5 + POINT_4_MS;
        levelTC5 = HIGH;
    }
    
}

initMain()
{
    //enable timer and fast clear
    //setup prescaler to 128. 5 1/3 microticks

    //initialize port A
    //call other initialzing functions
    //enable interrupts
    asm cli;
}

main()
{
    initMain()
    while(1)
    {
        turnOffSiren();
        while
    }
}