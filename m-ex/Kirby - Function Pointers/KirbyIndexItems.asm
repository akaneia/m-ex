#To be inserted @ 800f16ec
.include "../../Globals.s"
.include "../Header.s"

#Check if a nonspecial character
  lwz r6,OFST_Metadata_InternalIDCount(rtoc)
  cmplw	r4, r6
  bgt Exit
#Get characters init item function
  mulli r0,r4,4
  lwz  r3,OFST_KirbyInitItem(rtoc)
  lwzx  r12,r3,r0
  cmpwi r12,0
  beq Original
#Call our custom function
  mr  r3,r4   # fighter kind
  lwzx  r4,r5,r0  #KbCpData
  mtctr r12
  bctrl
  b Exit

Original:
  branch  r12,0x800f16f0

Exit:
  branch  r12,0x800f18f8
