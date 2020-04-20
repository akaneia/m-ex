#To be inserted @ 802645f4
.include "../../../Globals.s"
.include "../../Header.s"

#Check for mexSelectChr
  lwz r3,OFST_mexSelectChr(r13)
  cmpwi r3,0
  beq Original

#Skip Original Code
  branch  r12,0x802647fc

Original:
  li	r3, 7
