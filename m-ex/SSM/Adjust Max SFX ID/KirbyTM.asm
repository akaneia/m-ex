#To be inserted @ 8002356c
.include "../../../Globals.s"
.include "../../Header.s"

lwz r3,OFST_Metadata_SSMCount(rtoc)
addi  r3,r3,1
mulli r0,r3,10000
