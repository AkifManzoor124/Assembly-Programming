getKCode:
    movb #%00001110, PORTA
    LDAB PORTA
    cmpb #%11111110
    bne endif

    movb ,PORTA
    ldab PORTA

endif:
    clr PORTA
    rts