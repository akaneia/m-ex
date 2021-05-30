#To be inserted @ 80184364
.include "../../../Globals.s"
.include "../../Header.s"

# original line
  lfs	f0, 0x006C (r3)

# check for m-ex fighter
  lbz	r12, 0x00F4 (r31)
  cmpwi r12,0x1A
  blt Exit

# use override value
  bl  Float
  mflr r12
  lfs f0,0x0(r12)
  b Exit

Float:
blrl
.float 2

Exit: