#To be inserted at 8025dbb8
.include "../../../Globals.s"
.include "../../Header.s"

mulli r4,r21,0x1C
lwz r3,OFST_MnSlChrIconData(rtoc)
addi r3,r3,0xDC
add r3,r3,r4
lbz r3,0x01(r3)
cmpwi r3,3
