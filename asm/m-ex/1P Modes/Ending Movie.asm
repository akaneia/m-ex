#To be inserted @ 801a6454
.include "../../Globals.s"
.include "../Header.s"

# get table
  lwz r4,OFST_mexData(rtoc)
  lwz r4,Arch_Fighter(r4)
  lwz r4,Arch_Fighter_EndMovie(r4)

# get table entry
  mulli r3,r3,4
  lwzx r3,r3,r4
  
Exit:
  branch r12,0x801a6468