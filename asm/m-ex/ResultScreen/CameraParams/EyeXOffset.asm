#To be inserted @ 8017a4e4
.include "../../../Globals.s"
.include "../../Header.s"

cmpwi r23,0
beq Original

add r3,r23,r5
b Exit

Original:
add r3,r30,r5

Exit:
