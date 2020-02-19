#To be inserted @ 800cc750
.include "../../../Globals.s"
.include "../Header.s"

lwz r12,OFST_Metadata_InternalIDCount(rtoc)
subi  r12,r12,6
cmpw	r3, r12
