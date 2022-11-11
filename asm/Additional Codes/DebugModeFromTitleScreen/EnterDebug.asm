#To be inserted at 801b0940
.include "../../Globals.s"

bge DebugModeOn

# get inputs
  lwz	r0, 0 (r3)

# check for debug menu
  rlwinm.	r3, r0, 0, 0x800
  beq Exit

# enter debug menu
  branch r0, 0x801b0920

Exit: