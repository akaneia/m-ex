#To be inserted @ 80085a44
.include "../../Globals.s"
.include "../Header.s"

#Get pointer to anim count
  lwz  r28,OFST_MnSlChrAnimCount(rtoc)
  add r28,r28,r0
  lwz r0,0x0(r28)
