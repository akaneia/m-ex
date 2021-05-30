#To be inserted @ 80183c80
.include "../../../Globals.s"
.include "../../Header.s"

# original line
  lfs	f1, 0x006C (r4)

# check for m-ex fighter
  lbz	r12, 0x00F1 (r28)
  cmpwi r12,0x1A
  blt Exit

# use override value
  bl  Float
  mflr r12
  lfs f1,0x0(r12)
  b Exit

Float:
blrl
.float 2

Exit: