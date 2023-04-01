#To be inserted @ 801b3e04
.include "../../../Globals.s"
.include "../../Header.s"

lwz r5,OFST_Metadata_CSSIconCount(rtoc)
addi r5,r5,1