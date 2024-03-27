#To be inserted @ 800c05b8
.include "../../Globals.s"
.include "../Header.s"

lwz  r12,OFST_mexData(rtoc)
lwz  r12,Arch_FighterFunc(r12)
lwz  r28,Arch_FighterFunc_onActionStateChange(r12)