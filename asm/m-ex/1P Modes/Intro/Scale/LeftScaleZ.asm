#To be inserted @ 80183f08
.include "../../../../Globals.s"
.include "../../../Header.s"
.include "../GetGmIntroTable.s"

# check if custom ftDemoIntro file is loaded for this fighter
  lbz r12,0x0(r25)
  branchl r11, GetGMIntroTable
  cmpwi r11,0
  beq NoCustom

# get param
  lfs f1,0x10(r11)
  b Exit

NoCustom:
# original
  lfs	f1, 0x007C (r4)
Exit:
  li r11,1
  cmpwi r11,0 # stupid comparison because upcoming jobj assert