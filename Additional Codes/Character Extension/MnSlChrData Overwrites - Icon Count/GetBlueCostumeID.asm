#To be inserted @ 801692c0
.include "../../../Globals.s"
.include "../Header.s"

lwz r12,OFST_Metadata_CSSIconCount(rtoc)
addi  r12,r12,1
cmpw	r0, r12
