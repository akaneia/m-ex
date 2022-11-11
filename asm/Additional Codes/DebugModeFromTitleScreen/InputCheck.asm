#To be inserted at 801a1cc4
.include "../../Globals.s"

# check for Y on title screen
  rlwinm.	r0, r31, 0, 0x800
  beq Exit
# enter debug menu
  branch r0, 0x801a1cd0

Exit:
  branch r0,0x801a1d24

DebugModeOn: