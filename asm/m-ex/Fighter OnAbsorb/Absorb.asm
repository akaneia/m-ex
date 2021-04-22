#To be inserted @ 8006d654
.include "../../Globals.s"
.include "../Header.s"

.set  REG_PlayerGObj,3
.set  REG_PlayerData,31

lwz  r12,OFST_mexData(rtoc)
lwz  r12, Arch_FighterFunc(r12)
lwz  r0,Arch_FighterFunc_onAbsorb(r12)