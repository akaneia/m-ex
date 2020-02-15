#To be inserted @ 80026664
.include "../../../../Globals.s"
.include "../../Header.s"

#orig pointer is 80433710, indicated by addi 14096

lwz r5,OFST_SSMStruct(rtoc)
addi  r4,r5,0x274
addi  r5,r5,0x194
