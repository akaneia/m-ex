#To be inserted @ 801a8a88
.include "../../Globals.s"
.include "../Header.s"

# edit x position to be -75
  lis r0, 0xC296
  stw r0, 0x38(r31)


