#To be inserted @ 8014a7f8
.include "../../Globals.s"
.include "../Header.s"

.set REG_FighterData, 3

# costume indexed
  lbz	r0, 0x0619 (REG_FighterData)
  mulli r0,r0,8
# Get gaw colors
  lwz r3,OFST_mexData(rtoc)
  lwz r3,Arch_Misc(r3)
  lwz r3,Misc_GawColors(r3)
# Get fill
  add r3,r3,r0
  lwz r3,0x0(r3)
# store
  stw r3,0x0(r4)
  blr