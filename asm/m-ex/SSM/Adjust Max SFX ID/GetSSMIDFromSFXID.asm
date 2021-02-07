#To be inserted @ 8002313c
.include "../../../Globals.s"
.include "../../Header.s"

lwz r4,OFST_Metadata_SSMCount(rtoc)
addi  r4,r4,1
mulli r0,r4,10000
