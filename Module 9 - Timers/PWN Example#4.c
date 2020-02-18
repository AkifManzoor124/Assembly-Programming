// Use PWN to dim light bulb.
// PWN0 output to control brightness
// Dim light to 10% gradually over 5 seconds

// Set duty cycle to 100%
// dim light by 10%. and then 20% per second for 4s
// load 100 into PWNPER0 register at beginning
// decrement PWNPER0 by 1 every 100ms during the first second
// decrement PWNPER0 by 2 every 100ms in the 4s

void main()
{
    int dim_cnt;
    PWNCLK = 0; //select clock A as clock source
    PWNPOL = 1; //make waveform to start with high level
    PWNCTL = 0x0C; //select 8-bit mode
    PWNPRCLK = 2; //set clock A prescaler to 4
    PWNCAE = 0; //left-aligned mode
    PWNPER0 = 100; //set period of PWM0 to 0.1ms
    PWNDTY0 = 100; //set duty cycle to 100%
    PWME |= 0x01; //enable PWM0 channel

    for(dim_cnt; dim_cnt < 10; dim_cnt++)
    {
        delayby100ms(1);
        PWNDTY0--;
    }
    
    for(dim_cnt; dim_cnt < 40; dim_cnt++)
    {
        delayby100ms(1);
        PWNDTY0 -= 2;
    }
    ASM SWI
}