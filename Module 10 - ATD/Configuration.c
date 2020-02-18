/*

    Obtain "No_samples" from AD0 at sampling rate of 200ms and store at address "acq_addr"
    Complete one conversion in the conversion sequence and wait 100ms between sequences
    Use a 500kHz ATD clock and 16 cycles for sampling time
    No interruptions. Use timer for timing

Pin: AD0
Sampling Rate: 200ms
Conversion Sequence: One conversion
ATD Clock: 500kHz
Sampling Time: 16 cycles
*/

void openAD0()
{
    ATD0CTL2 = 0xE0; //Power up ATD0 and enable fast clear
    wait20us();

    ATD0CTL3 = 0x08; //sequence of 1 A/D conversions, no FIFO
    ATD0CTL4 = 0xF7; //resolution of 8 bit, 16 cycles/sample time, prescale to 48

}

void wait20us()
{
    TSCR1 = 0x90; //enable TNCT, and fast clear
    TSCR2 = 0;  //TNCT prescaler to 1
    TIOS |= 0x01; //enable the clock
    TC0 = TCNT + 480;

    while(!(TFLG1 & 0x01)) //wait until content of TFLG1 is 1

}