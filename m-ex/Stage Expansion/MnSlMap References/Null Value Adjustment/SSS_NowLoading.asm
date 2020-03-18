#To be inserted @ 80259c4c
.include "../../../../Globals.s"
.include "../../../Header.s"

#Check for null
  lwz r12,OFST_Metadata_SSSIconCount(rtoc)
  cmpw r3,r12
  beq Null
#Check for random
  subi  r12,r12,1
  cmpw r3,r12
  beq Random

Icon:
  branch  r12,0x80259c84
Null:
  branch  r12,0x80259c64
Random:
  branch  r12,0x80259c74
