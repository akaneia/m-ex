#To be inserted @ 80219230
.include "../../Globals.s"
.include "../Header.s"

# get fighter times
  lwz r4,OFST_mexData(rtoc)
  lwz r4,Arch_Fighter(r4)
  lwz r4,Arch_Fighter_RaceTimes(r4)
  mulli r3,r3,RaceTimes_Stride
  lwzx r3,r3,r4
  blr
