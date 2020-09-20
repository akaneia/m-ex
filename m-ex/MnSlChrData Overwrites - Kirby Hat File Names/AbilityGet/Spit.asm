#To be inserted @ 800f587c
.include "../../../Globals.s"
.include "../../Header.s"

lwz  r4,OFST_ftDataPointers(rtoc)
lwz r4,4*ftDataPointers_Stride(r4)
