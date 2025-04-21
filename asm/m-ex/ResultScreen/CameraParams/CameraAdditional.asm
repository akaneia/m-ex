#To be inserted @ 8017a520
.include "../../../Globals.s"
.include "../../Header.s"

cmpwi r23,0
beq Original

subi r0,r23,0x90
b Exit

Original:
add r0,r30,r5

Exit:
