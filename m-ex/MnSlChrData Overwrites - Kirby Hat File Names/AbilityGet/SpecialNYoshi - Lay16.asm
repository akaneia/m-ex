#To be inserted @ 8012cd90
.include "../../../Globals.s"
.include "../../Header.s"

lwz  r4,OFST_ftDataPointers(rtoc)
lwz r4,14*ftDataPointers_Stride(r4)
