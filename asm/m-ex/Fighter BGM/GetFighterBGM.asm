#To be inserted @ 8002305c
.include "../../Globals.s"
.include "../Header.s"

# check if under?
  cmpwi r3,0
  blt NotFound
  mulli r3,r3,BGM_Stride
  mulli r4,r4,2
  lwz  r5,OFST_FighterBGM(rtoc)
  add r3,r3,r5
  lhzx r3,r3,r4
  b Exit
  
NotFound:
  li r3,93

Exit:
  blr