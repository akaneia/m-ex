#To be inserted @ 8007f830
.include "../../Globals.s"
.include "../Header.s"

lwz  r12,OFST_mexData(rtoc)
lwz  r12, Arch_FighterFunc(r12)
lwz  r0,Arch_FighterFunc_onKnockback(r12)