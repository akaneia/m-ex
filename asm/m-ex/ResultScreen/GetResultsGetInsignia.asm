#To be inserted @ 80176c40
.include "../../Globals.s"
.include "../Header.s"

#Get ID array
  lwz r4,OFST_GmRstInsigniaIDs(rtoc)
#Get characters ID
  lbzx  r0,r28,r4
#Exit
  branch  r12,0x80176c8c
