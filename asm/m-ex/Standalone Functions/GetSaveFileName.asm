#To be inserted @ 803d70a8
.include "../../Globals.s"
.include "../Header.s"

lwz r3,OFST_Metadata(rtoc)
lwz r3,0x3C(r3)
cmpwi r3, 0
beq Orig

lwz r3,0x10(r3)
cmpwi r3, 0
bne Exit

Orig:
load r3,0x803bac5c

Exit:
blr
