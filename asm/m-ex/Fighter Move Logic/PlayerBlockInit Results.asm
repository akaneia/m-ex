#To be inserted @ 800be8b4
.include "../../Globals.s"
.include "../Header.s"

lwz r4,OFST_mexData(rtoc)
lwz r4,Arch_FighterFunc(r4)
lwz r4,Arch_FighterFunc_MoveLogicDemo(r4)
