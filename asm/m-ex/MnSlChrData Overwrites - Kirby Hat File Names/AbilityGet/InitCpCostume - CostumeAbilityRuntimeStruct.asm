#To be inserted @ 800ef118
.include "../../../Globals.s"
.include "../../Header.s"

rlwinm	r4, r21, 2, 0, 29  #get costume offset
lwz  r3,OFST_KirbyAbilityCostumeRuntimeStruct(rtoc)
lwzx r3,r3,r4
