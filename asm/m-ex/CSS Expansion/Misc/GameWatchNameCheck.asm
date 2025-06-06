#To be inserted at 8026350c
.include "../../../Globals.s"
.include "../../Header.s"

mulli r0,r0,28
lwz r3,OFST_MnSlChrIconData(rtoc)
addi r3,r3,0xDC
add r3,r3,r0
lbz r3,0x01(r3)
cmpwi r3,3
