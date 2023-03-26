#To be inserted @ 801c253c
.include "../../../Globals.s"
.include "../../Header.s"

# check if index is stage -1
# -1 is used for m-ex stage index
  cmpwi r0,-1
  beq Exit

  cmpw r0,r3
  b Exit

NotEqual:
  cmpwi r0,0

Exit:
