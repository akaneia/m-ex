#To be inserted @ 8010935C
.include "../../../Globals.s"
.include "../../Header.s"

lwz  r4,OFST_ftDataPointers(rtoc)
lwz r4,4*ftDataPointers_Stride(r4)
