#To be inserted at 801b0940
.include "../../Globals.s"

bge DebugModeOn

# get inputs
  lwz	r0, 0 (r3)

# check for debug menu
  rlwinm.	r3, r0, 0, 0x800
  beq CheckSoundTest
  branch r0, 0x801b0920

CheckSoundTest:
# check for sound test menu
  rlwinm.	r3, r0, 0, 0x400
  beq Exit
  branch r0, 0x801b090c

Exit: