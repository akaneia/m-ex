#To be inserted @ 8007e7a8
.include "../../Globals.s"
.include "../Header.s"

lwz  r5,OFST_mexData(rtoc)
lwz  r5,Arch_FighterFunc(r5)
lwz  r0,Arch_FighterFunc_onUnknownItemRelated(r5)
