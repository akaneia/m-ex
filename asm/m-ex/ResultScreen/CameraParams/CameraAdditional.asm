#To be inserted @ 8017a520
.include "../../../Globals.s"
.include "../../Header.s"

cmpwi r23,0
beq Original

add r3,r23,r5
subi r0,r3,0x690
b Exit

Original:
add r0,r30,r5

Exit:
