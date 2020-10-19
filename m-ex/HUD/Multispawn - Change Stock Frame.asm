#To be inserted @ 802fa0b4
.include "../../Globals.s"
.include "../Header.s"

.set  REG_ExternalID,31
.set  REG_InternalID,30
.set  REG_CostumeID,29

# get internal ID
  add	r3, r31, r28
  lbz	r3, 0x047F (r3)
  li r4,0
  branchl r12,0x800325c8
  mr r4,r3

Exit:
  add	r5, r31, r28
  lbz	r3, 0x047F (r5)
  lbz	r5, 0x03FD (r5)

