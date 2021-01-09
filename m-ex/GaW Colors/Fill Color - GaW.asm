#To be inserted @ 8014a42c
.include "../../Globals.s"
.include "../Header.s"

.set REG_FighterData, 31

# Get gaw colors
  lwz r4,OFST_mexData(rtoc)
  lwz r4,Arch_Misc(r4)
  lwz r4,Misc_GawColors(r4)
# costume indexed
  lbz	r0, 0x0619 (REG_FighterData)
  mulli r0,r0,8
  add r4,r4,r0

