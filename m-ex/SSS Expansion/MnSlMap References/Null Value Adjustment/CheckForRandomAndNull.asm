#To be inserted @ 8025a0f4
.include "../../../../Globals.s"
.include "../../../Header.s"

#Check for null
  lwz r12,OFST_Metadata_SSSIconCount(rtoc)
  cmpw r3,r12
  beq NoModelPreview
#Check for random
  subi  r12,r12,1
  cmpw r3,r12
  beq NoModelPreview
  b Exit
NoModelPreview:
  branch  r12,0x8025a1d8

Exit:
