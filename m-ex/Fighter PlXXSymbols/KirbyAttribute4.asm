#To be inserted @ 800f5ae0
.include "../../Globals.s"
.include "../Header.s"

lwz  r3,OFST_ftDataPointers(rtoc)
lwz r3, 4*ftDataPointers_Stride (r3)
