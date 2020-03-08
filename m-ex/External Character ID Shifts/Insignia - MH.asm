#To be inserted @ 802f62fc
.include "../../Globals.s"
.include "../Header.s"

.set  masterHand,7
.set  wireMale,6
.set  wireFemale,5
.set  gigaBowser,4
.set  crazyHand,3
.set  sandbag,2
.set  popo,1

#Check for MH and CH
  lwz r12,OFST_Metadata_ExternalIDCount(rtoc)
  subi  r3,r12,masterHand
  cmpw	r28, r3
  beq isHand
  subi  r3,r12,crazyHand
  cmpw	r28, r3
  beq isHand
  b Exit

isHand:
  li  r28,27

Exit:
  branch r12,0x802f6314
