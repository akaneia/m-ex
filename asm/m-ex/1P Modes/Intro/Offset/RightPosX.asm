#To be inserted @ 80184364
.include "../../../../Globals.s"
.include "../../../Header.s"

# check if custom ftDemoIntro file is loaded for this fighter
  lwz r11,OFST_mexData(rtoc)
  lwz r11,Arch_Fighter(r11)
  lwz r11,Arch_Fighter_DefineIDs(r11)
  lbz	r12, 0x00F4 (r31)
  mulli r12,r12,3
  add r11,r11,r12
  lbz r11,0x0(r11)  # internal ID
  mulli r11,r11,RuntimeIntroParam_Stride
  lwz r12,OFST_mexData(rtoc)
  lwz r12,Arch_Fighter(r12)
  lwz r12,Arch_Fighter_RuntimeIntroParam(r12)
  lwzx r11,r11,r12
  cmpwi r11,0
  beq NoCustom

# get param
  lfs	f0, 0x0 (r11)
  b Exit

NoCustom:
# original
  lfs	f0, 0x006C (r3)

Exit: