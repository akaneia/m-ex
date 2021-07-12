#To be inserted @ 80264eec
.include "../../../Globals.s"
.include "../../Header.s"

lwz r4,OFST_Metadata_CSSIconCount(rtoc)
addi  r4,r4,1
