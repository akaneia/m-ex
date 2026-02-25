#To be inserted @ 800a1cf8
.include "../../Globals.s"
.include "../Header.s"

load r12, 0x8049e750
lwz r0, 0x00(r12)
cmpwi r0, 221
blt Original

StageOutOfBounds:
branch r12,0x800a1f14

Original:
lwz r0,0x60(r30)