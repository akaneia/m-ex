#To be inserted @ 8025bbe4
.include "../../Globals.s"
.include "../Header.s"

lwz r4,OFST_Menu_SSS(rtoc)
mulli	r3, r3, SSS_Stride
add r3,r3,r4
lwz r3,0x1C(r3)

Exit:
branch r12,0x8025bbf8