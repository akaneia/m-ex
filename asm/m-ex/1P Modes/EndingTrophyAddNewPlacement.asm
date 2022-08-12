#To be inserted @ 801a8c4c
.include "../../Globals.s"
.include "../Header.s"

  cmpwi r4, 0x19
  bne OriginalPosition

NewPosition:

# X position
  lis r3, 0xC2B4
  stw r3, 0x38(r31)

# Y position
  lis r3, 0xC25C
  stw r3, 0x40(r31)

# Update jobj
  mr r3, r31
  branchl r12, 0x803732e8
  branch r12, 0x801a8d34

OriginalPosition:
  cmplwi r31,0x0
