#To be inserted @ 80266984
.include "../../../Globals.s"
.include "../../Header.s"

#Check for mexSelectChr
  lwz	r3, -0x49D0 (r13)
  bl  mexSelectChr
  mflr  r4
  branchl r12,0x80380358
  cmpwi r3,0
  beq Original
#Store pointer
  stw r3,OFST_mexSelectChr(r13)
  b Exit

mexSelectChr:
blrl
.string "mexSelectChr"
.align 2

Original:
#Store null pointer to mexSelectChr
  li  r3,0
  stw r3,OFST_mexSelectChr(r13)
Exit:
#Orig codeline
  lwz	r3, -0x49D0 (r13)
