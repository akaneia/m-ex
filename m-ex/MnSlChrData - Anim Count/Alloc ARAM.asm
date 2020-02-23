#To be inserted @ 80085a44
.include "../../Globals.s"
.include "../Header.s"

#temp load into r4
  lwz	r4, 0x0108 (r28)

#Get pointer to anim count
  lwz  r28,OFST_MnSlChrAnimCount(rtoc)
  add r28,r28,r0

#Move into expected register
  mr  r0,r4
