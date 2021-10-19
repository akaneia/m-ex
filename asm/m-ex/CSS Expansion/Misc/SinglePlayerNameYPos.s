#To be inserted at 8026512c
.include "../../../Globals.s"
.include "../../Header.s"

# this makes the single player CSS position the nametag text at joint 78
# y position, instead of hardcoding it.

# use y * -1
  bl Float
  mflr r4
  lfs f1,0x0(r4) # -1
  lfs f0, 0x00F0 (sp)
  fmuls f19,f0,f1
  stfs f19,0x4(r3)
  b Exit

Float:
blrl
.float -1
.align 2

Exit:
