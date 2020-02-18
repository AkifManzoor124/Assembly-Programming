; Complex Test Expression 1

; do { … } while( (var1<10) && (var2>3));

do:
…;{ … }

ldaa var1; while( (var1 < 10)
cmpa #10
bhs endwhile; branch if higher or the same
ldaa var2; && (var2 > 3) 
cmpa #3
bhi do; branch if higher 

endwhile: ;);

; Complex Test Expression 2

; if( (var1=3) || (var1=2) ) {…} else {…}

ldaa var1 ; if((var=3)
cmpa #3
beq then; branch if equal
ldaa var1 ;|| (var1=2)
cmpa #2
bne else;)
then:
…
    bra endif
else:
…
endif: