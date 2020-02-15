#To be inserted @ 8002749c
.include "../../../../Globals.s"
.include "../../Header.s"

#orig pointer is 80433710, indicated by addi 14096

lwz r6,OFST_SSMStruct(rtoc)
addi  r5,r6,0x194
addi  r6,r6,0x274
