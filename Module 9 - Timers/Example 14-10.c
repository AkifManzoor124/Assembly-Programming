#include <mc9s12c256.h>

#define LED1 0x1
#define NTIMES 250 /* number of interrupts for 1 sec*/
#define MS_4 6000 /* # of ticks for 4ms delay */

void interrupt VectorNumber_Vtimch2 oc2_isr(void); //Prototype function
int counter; //isr counter

void main()
{
    DDRB = DDRB | LED1; 
    PORTB = PORTB | ~LED1; // Turn off LED

    TSCR1 = 0b10010000; // Enable, Fast clear
    TSCR2 = 0b00000100; // 2/3 micros ticks
    TIOS = TIOS | 0b00000100; // Set Output compare for Channel 2
    
    TC2 = TCNT + MS_4; // first interrupt in 4ms
    // We add the current value of TCNT to MS_4
    // When TCNT reaches TC2 value, interrupt thrown
    asm BSET TIE, 0b00000100; // Channel 2 Interrupt
    asm cli; // Enable interrupts

    counter = NTIMES;

    for(;;) //causes function to run continuosly 
    {
        while(counter != 0) //Wait until a second has passed
        {
            asm wai; //push for interrupt
            PORTB = PORTB ^ LED1; //toggle the LED
            counter = NTIMES; //reinitialize the counter
        }
    }
}

void interrupt VectorNumber_Vtimch2 0c2_isr(void)
{
    counter--; 
    TC2 = TC2 + MS_4; //Reading TC2 resets interrupt
    //4ms are new added to TC2
    //TNCT will go to new value and throw another interrupt
}