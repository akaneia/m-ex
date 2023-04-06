#To be inserted @ 801b34c8
.include "../../../Globals.s"
.include "../../Header.s"

lwz r0,OFST_Metadata_CSSIconCount(rtoc)
addi r0,r0,1