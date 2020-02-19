#To be inserted @ 8008a2f0
.include "../../../Globals.s"
.include "../Header.s"

lwz r12,OFST_Metadata_InternalIDCount(rtoc)
subi  r12,r12,5
cmpw	r3, r12
