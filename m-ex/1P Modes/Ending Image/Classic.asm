#To be inserted @ 801a9c28
.include "../../../Globals.s"
.include "../../Header.s"

# get table
  lwz r3,OFST_mexData(rtoc)
  lwz r3,Arch_Fighter(r3)
  lwz r3,Arch_Fighter_EndClassic(r3)

# get fighters string
  mulli r4,r31,4
  lwzx r3,r3,r4
