#To be inserted @ 8007512c
.include "../../Globals.s"
.include "../Header.s"

lwz  r3,OFST_mexData(rtoc)
lwz  r3,Arch_FighterFunc(r3)
lwz  r0,Arch_FighterFunc_onShadowRender(r3) 