#To be inserted @ 80023f70
.include "../../Globals.s"
.include "../Header.s"

lwz r12,OFST_Metadata_BGMCount(rtoc)
cmpw	r3, r12
