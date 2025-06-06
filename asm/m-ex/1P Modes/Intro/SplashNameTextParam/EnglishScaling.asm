#To be inserted @ 80160eb4
.include "../../../../Globals.s"
.include "../../../Header.s"
.include "../GetGmIntroTable.s"

# check if custom ftDemoIntro file is loaded for this fighter
  mr	r12, r27
  branchl r11, GetGMIntroTable
  cmpwi r11,0
  beq NoCustom

# get param
# lfs f0,0x24(r11)

# defaul to 0
  bl DefaultScale
  mflr  r3
  lfs f0,0x0(r3)
  b Exit

DefaultScale:
blrl
.float 1.0

NoCustom:
# original
  lfs f0,0x84(r3)

Exit:
