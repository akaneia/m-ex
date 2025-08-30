#To be inserted @ 80017a58
.include "../../../Globals.s"
.include "../../Header.s"

blt Loop

lbz r0,0x0D(r30)
cmpwi r0,0x0
bne Exit
branch r12,0x800179dc

Loop:
branch r12,0x80017a04

Exit:
branch r12,0x80017a5c