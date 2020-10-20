#To be inserted @ 801a9c38
.include "../../../Globals.s"
.include "../../Header.s"

# get table
  lwz r3,OFST_mexData(rtoc)
  lwz r3,Arch_Fighter(r3)
  lwz r3,Arch_Fighter_EndAdventure(r3)

# get fighters string
  mulli r4,r30,4
  lwzx r3,r3,r4
