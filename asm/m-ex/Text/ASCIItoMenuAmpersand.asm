#To be inserted @ 803a68d0
.include "../../Globals.s"
.include "../Header.s"

cmplwi r10, 0x26
bne Exit

li r8,0x0B
stbx r8,r3,r9
li r8,0x00
addi r9,r9,1
stw r8,0x10(sp)
li r10,0x81
li r31,0x95

branch r12,0x803a6b08

Exit:
cmplwi r10, 0x27