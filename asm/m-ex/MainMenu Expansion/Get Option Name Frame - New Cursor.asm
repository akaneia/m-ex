#To be inserted @ 8022a010
.include "../../Globals.s"
.include "../Header.s"

.set  REG_OptionID, 27

# check if exists
  lwz r12,OFST_mexMenu(r13)
  cmpwi r12,0
  beq Original

# Get this menu
  lwz r12,mexMenu_MenuDef(r12)
  lbz	r0, 0 (r29)
  mulli	r0, r0, MenuDefStride
  add r12,r12,r0
  #lfs	f1, 0x4 (r12)
  #b Exit
# Get optdef
  lwz r12,MenuDef_OptDef(r12)
# Get this option
  mulli r3,REG_OptionID,OptDefStride
  add r12,r3,r12
# Get this frame
  lbz r3,OptDef_NameFrame(r12)
# Cast to float
  xoris r3,r3,0x8000
  lfd	f1, -0x35F8 (rtoc)
  stw r3,0x94(sp)
  lis r3,0x4330
  stw r3,0x90(sp)
  lfd f2,0x90(sp)
  fsubs f1,f2,f1
  mr	r3, r28
  b Exit


Original:
  fadds	f1,f2,f0

Exit: