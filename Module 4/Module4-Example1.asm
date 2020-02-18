STACK:  EQU $0a00; 

lds #STACK; initialize the stack pointer
...
psha; push content of register a onto stack
pshx; push content of register x onto stack
...
pulx; pull content from stack to register x
pula; pull content from stack to register a

;We need to pull the contents of the register in reverse order
;due to first in, last out rule for stack