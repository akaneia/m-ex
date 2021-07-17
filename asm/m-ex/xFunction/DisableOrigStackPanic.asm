#To be inserted at 80228af8
.include "../../Globals.s"
.include "../Header.s"

nop

# backup args
stw r3, -0x5014(r13)

li r3,-1
stw r3, -0x5008(r13)
stw r3, -0x500c(r13)
stw r3, -0x5010(r13)