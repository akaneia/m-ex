#To be inserted @ 80184670
.include "../../../../Globals.s"
.include "../../../Header.s"

# original
  lfs	f1, 0x0074 (r4)

# check for m-ex fighter
  lbz r11,0x0(r25)
  cmpwi r11,0x1A
  blt Exit

# get scale override
  lwz r12,OFST_mexData(rtoc)
  lwz r12,Arch_Fighter(r12)
  lwz r12,Arch_Fighter_GmRst_Scale(r12)
  mulli r11, r11, 4
  lfsx f1,r11,r12

Exit:
  cmpwi r11,0 # stupid comparison because upcoming jobj assert