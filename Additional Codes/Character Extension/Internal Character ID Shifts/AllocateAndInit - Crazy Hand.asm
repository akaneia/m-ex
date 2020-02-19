#To be inserted @ 800692fc
.include "../../../Globals.s"
.include "../Header.s"

lwz r12,OFST_Metadata_InternalIDCount(r12)
subi  r12,r12,5
cmpw	r0, r12
