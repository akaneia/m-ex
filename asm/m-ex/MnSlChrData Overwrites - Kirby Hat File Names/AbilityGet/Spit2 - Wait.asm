#To be inserted @ 8010a2ac
.include "../../../Globals.s"
.include "../../Header.s"

lwz r5,OFST_ftDataPointers(rtoc)
lwz r5,4*ftDataPointers_Stride(r5)
