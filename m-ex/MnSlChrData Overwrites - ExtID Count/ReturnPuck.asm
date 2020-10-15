#To be inserted @ 8025fe4c
.include "../../Globals.s"
.include "../Header.s"

lwz r12,OFST_Metadata_CSSIconCount(rtoc)
addi r12,r12,1
cmpw r4,r12
