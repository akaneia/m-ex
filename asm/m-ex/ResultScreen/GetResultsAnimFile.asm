#To be inserted @ 80160438
.include "../../Globals.s"
.include "../Header.s"

#Get anim pointers
  lwz r4,OFST_GmRstAnimFileNames(rtoc)
#Get characters pointer
  mulli r3,r3,0x4
  lwzx  r3,r3,r4
  blr
