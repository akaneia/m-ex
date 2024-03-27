#To be inserted @ 800c0158
.include "../../Globals.s"
.include "../Header.s"

lwz  r3,OFST_mexData(rtoc)
lwz  r3,Arch_FighterFunc(r3)
lwz  r0,Arch_FighterFunc_onActionStateChange(r3)