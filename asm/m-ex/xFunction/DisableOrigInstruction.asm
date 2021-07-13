#To be inserted at 80228c10
.include "../../Globals.s"
.include "../Header.s"

nop

# backup args
stw r3, -0x5008(r13)
stw r4, -0x500c(r13)
stw r5, -0x5010(r13)
stw r6, -0x5014(r13)