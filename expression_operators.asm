ONE:    EQU 1
TWO:    EQU 2
SMALL:  EQU $FF

ADD:    DC.B    {ONE+TWO};
SUB:    DC.B    {TWO-ONE};
ASL:    DC.B    {ONE << 1};
LSR:    DC.B    {SMALL >>1};
AND:    DC.B    {ONE&TWO};
OR:     DC.B    {ONE|TWO};
XOR:    DC.B    {ONE^TWO};
MULT:   DC.B    {TWO*TWO};
DIV:    DC.B    {TWO/TWO};