#To be inserted @ 8012cd30
.include "../../../Globals.s"
.include "../../Header.s"

lwz  r3,OFST_ftDataPointers(rtoc)
lwz r3,14*ftDataPointers_Stride(r3)
