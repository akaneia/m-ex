#To be inserted @ 802ff870
.include "../../../Globals.s"
.include "../../Header.s"

# FGM Group
  lwz r3,OFST_Metadata_SSMCount(rtoc)
  bl Cast
  stfs f1,0x154(r31)

# BGM Group
  lwz r3,OFST_Metadata_BGMCount(rtoc)
  bl Cast
  stfs f1,0x194(r31)

b Exit

Cast:
  stwu	sp, -0x000C (sp)
  xoris r3,r3,0x8000
  lfd	f1, -0x35F8 (rtoc)
  stw r3,0x8(sp)
  lis r3,0x4330
  stw r3,0x4(sp)
  lfd f2,0x4(sp)
  fsubs f1,f2,f1
  addi	sp, sp, 0xC
  blr

Exit:
  lwz	r0, 0x0024 (sp)