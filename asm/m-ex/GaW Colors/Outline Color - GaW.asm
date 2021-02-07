#To be inserted @ 8014a364
.include "../../Globals.s"
.include "../Header.s"

.set REG_FighterData, 31

# costume indexed
  lbz	r0, 0x0619 (REG_FighterData)
  mulli r0,r0,8
# Get gaw colors
  lwz r4,OFST_mexData(rtoc)
  lwz r4,Arch_Misc(r4)
  lwz r4,Misc_GawColors(r4)
  add r4,r4,r0
  lwz r4,0x4(r4)
  stw r4,0x2434(REG_FighterData)
  stw r4,0x614(REG_FighterData)

lwz	r0, 0x001C (sp)