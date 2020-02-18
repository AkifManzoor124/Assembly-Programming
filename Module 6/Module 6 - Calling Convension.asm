int function1(char arg1, int arg2, float arg3);
int function2(char arg1);

void main (void)
{
    static char stacy; 1 byte
    static int sam; 2 bytes
    static float susan; 4 bytes
    mike = function1(stacy, sam, susan);

    static int mike; 2 bytes
    sam = function2(stacy);
}

;mike = function1(stacy,sam,susan)
LDAB stacy; Load B with stacy. Stacy is a char, 1 byte which is stored in B
PSHB; push stacy to the stack. Push to the stack
LDD SAM; Load D with sam. Sam is 2 bytes, store in D register
PSHD;
LDD susan:2; susan is a 4 byte. Store high bits in X and lower in D
LDX susan
JSR function1; jump to subroutine function1
LEAS 3,SP
STD mike; mike is an int, 2 bytes. store in D register

;sam = function2(stacy)
LDAB stacy; Load register b with stacy. char, 1 byte
JSR function2 jump to subroutine function2
STD sam
RTS