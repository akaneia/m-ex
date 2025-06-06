#To be inserted @ 80259c4c
.include "../../../../Globals.s"
.include "../../../Header.s"

#Check for null
  lwz r12,OFST_Metadata_SSSIconCount(rtoc)
  cmpw r3,r12
  beq Null
#Check for random
  slwi r4, r3, 5
  addi r4,r4,8
  lwz r12,OFST_Menu_SSS(rtoc)
  lbzx r12,r4,r12
  cmpwi r12,3
  beq Random

Icon:
  branch  r12,0x80259c84
Null:
  branch  r12,0x80259c64
Random:
  branch  r12,0x80259c74
