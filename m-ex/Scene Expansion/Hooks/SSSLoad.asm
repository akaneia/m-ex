#To be inserted @ 8025a9f8
.include "../../../Globals.s"
.include "../../Header.s"

# orig codeline
  branchl r12,0x80380358

# somehow check for a css sceneload function
  lwz r3,OFST_scSSSLoad(rtoc)
  cmpwi r3,0
  beq   Original
  mtctr r3
  bctrl

Exit:
 branch r12,0x8025b830

Original: