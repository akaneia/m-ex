#To be inserted @ 8010a4d0
.include "../../../Globals.s"
.include "../../Header.s"

lwz r5,OFST_ftDataPointers(rtoc)
lwz r5,4*ftDataPointers_Stride(r5)
