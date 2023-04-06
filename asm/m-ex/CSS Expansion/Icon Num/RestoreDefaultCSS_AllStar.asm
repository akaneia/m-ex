#To be inserted @ 801b62e8
.include "../../../Globals.s"
.include "../../Header.s"

lwz r5,OFST_Metadata_CSSIconCount(rtoc)
addi r0,r5,1