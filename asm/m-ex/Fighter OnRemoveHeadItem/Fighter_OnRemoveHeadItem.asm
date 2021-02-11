#To be inserted @ 8007f918
.include "../../Globals.s"
.include "../Header.s"

lwz  r4,OFST_mexData(rtoc)
lwz  r4,Arch_FighterFunc(r4)
lwz  r0,Arch_FighterFunc_onRemoveHeadItem(r4)