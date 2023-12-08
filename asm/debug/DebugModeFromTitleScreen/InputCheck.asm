#To be inserted at 801a1cc4
.include "../../Globals.s"

# check for Y on title screen
  rlwinm.	r0, r31, 0, 0x800
  bne DebugMenu
  rlwinm.	r0, r31, 0, 0x400
  bne SoundTest

  b Exit

DebugMenu:
SoundTest:
# store inputs and advance
  branch r0, 0x801a1cd0

Exit:
  branch r0,0x801a1d24