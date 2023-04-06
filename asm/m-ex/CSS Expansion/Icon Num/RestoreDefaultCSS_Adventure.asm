#To be inserted @ 801b51dc
.include "../../../Globals.s"
.include "../../Header.s"

lwz r0,OFST_Metadata_CSSIconCount(rtoc)
addi r0,r0,1