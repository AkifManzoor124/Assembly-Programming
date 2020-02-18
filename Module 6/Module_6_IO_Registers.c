// define a port type = unsigned char
typedef unsigned char PORT;

// declare a volatile variable of type PORT named PORT and assign to value
// @0x0000
volatile PORT PORTA @0x0000;

//declare portB
volatile PORT PORTB @0x0001;

void main()
{
    unsigned char p_a_val;
    PORTA = 6; //Write to PORTA
    p_a_val = PORTA; //read from PORTA
    PORTB = 26;    //read from portB
}

/***** Types ******/
typedef unsigned char PORT;
typedef unsigned int BITFIELD;
/**** Union that gives two perspectives ****/
typedef union 
{
    PORT PortByte;
    struct
    {
        BITFIELD BIT0 : 1;
        BITFIELD BIT1 : 1;
        BITFIELD BIT2 : 1;
        BITFIELD BIT3 : 1;
        BITFIELD BIT4 : 1;
        BITFIELD BIT5 : 1;
        BITFIELD BIT6 : 1;
        BITFIELD BIT7 : 1;
    } PortBits;
} IOPort;

// Data and Data direction registers for Port T
volatile IOPort PORTT @0x0240;
volatile IOPort DDRT @0x0242;

void main( void )
{
    DDRT.PortByte = 0x0F; //Bits 3 - 0 , output 
    PORTT.PortBits.Bit3 = 1; // make Bit 3 = 1
}