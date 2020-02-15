#To be inserted @ 80026e60
.include "../../../../Globals.s"
.include "../../Header.s"

#orig pointer is 80433710, indicated by addi 14096

lwz r4,OFST_SSMStruct(rtoc)
addi  r0,r4,0x274
