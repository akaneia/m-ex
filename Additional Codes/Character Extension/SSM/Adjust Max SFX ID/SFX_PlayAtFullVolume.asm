#To be inserted @ 800237b4
.include "../../../../Globals.s"
.include "../../Header.s"

lwz r6,OFST_Metadata_SSMCount(rtoc)
addi  r6,r6,1
mulli r0,r6,10000
