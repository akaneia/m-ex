#To be inserted @ 800745f8
.include "../../Globals.s"
.include "../Header.s"

.set REG_FighterData,29
.set REG_JointNum,28

# Output string
  bl ErrorString
  mflr r3
# get fighter name
  lwz r4, OFST_mexData(rtoc)
  lwz r4, Arch_Fighter(r4)
  lwz r4, Arch_Fighter_NameText(r4)
  lwz r0, 0x4(REG_FighterData)
  mulli r0,r0,4
  lwzx r4,r4,r0
# get costume filename
  lwz r5, OFST_mexData(rtoc)
  lwz r5, Arch_Fighter(r5)
  lwz r5, Arch_Fighter_CostumeFileSymbols(r5)
  lwz r0, 0x4(REG_FighterData)
  mulli r0,r0,4
  lwzx r5,r5,r0
  lbz r0, 0x619 (REG_FighterData)
  mulli r0,r0,CostumeFileSymbols_Stride
  lwzx r5, r5, r0
  mr r6, REG_JointNum
# get number of joints
  lwz	r7, -0x515C (r13)
  lwz r0, 0x4(REG_FighterData)
  mulli r0,r0,4
  lwzx r7,r7,r0
  lwz r7,0x8(r7)
  branchl r0,0x803456a8
  branch r0,0x80074608

ErrorString:
blrl
.string "%s's costume \"%s\" has %d joints\nshould have %d joints\n"
.align 2
