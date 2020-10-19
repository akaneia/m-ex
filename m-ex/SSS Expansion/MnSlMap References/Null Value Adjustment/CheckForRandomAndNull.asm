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
# Check for hidden preview ID
  mulli r0,r3,SSS_Stride
  add r3,r31,r0
  lbz r3,0x9(r3)
  extsb r3,r3
  cmpwi r3,-1
  beq NoModelPreview

  b Exit
NoModelPreview:
  branch  r12,0x8025a1d8

Exit:
  lwz	r3, 0 (r30)