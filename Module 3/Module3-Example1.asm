; Perform the following operation
; z = a + b - c

; In C:
; int z; a = 5, b = 6, c = 8;
; z = a + b + c;

;define the addresses to the variables
ORG:    $2500
var_a   DC.W 5; definiton of a = 5. Define Constant Word
var_b   DC.W 6; definition of b = 6. Define Constant Word
var_c   DC.W 8; definiton of c = 8. Define constant Word
var_z   DC.W 1; definition of z = 1. Define constant Word

ORG:    $1000
ldaa var_a; Load register A with var_a = 5
adda var_b; Add to register A with var_b = 6
suba var_c; Subtract register A with var_c = 8
staa var_z; store the final answer at z