#To be inserted @ 802f6770
.include "../../Globals.s"
.include "../Header.s"


# get symbol from ifall
  load  r3,0x804d6d5c
  lwz r3,0x0(r3)
  bl  StockSymbol
  mflr r4
  branchl r12,0x80380358
  stw r3,OFST_stc_icons(r13)
  load  r3,0x804d6d5c
  lwz r3,0x0(r3)
  bl  EmblemSymbol
  mflr r4
  branchl r12,0x80380358
  stw r3,OFST_eblm_matanimjoint(r13)

  b Exit

StockSymbol:
blrl
.string "Stc_icns"
.align 2

EmblemSymbol:
blrl
.string "Eblm_matanim_joint"
.align 2

Exit:
    lwz	r0, 0x0024 (sp)