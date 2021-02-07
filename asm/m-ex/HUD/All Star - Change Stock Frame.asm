#To be inserted @ 802f9888
.include "../../Globals.s"
.include "../Header.s"

.set  REG_ExternalID,31
.set  REG_InternalID,30
.set  REG_CostumeID,29

# get internal ID
  addi	r3, r28, 0
  li r4,0
  branchl r12,0x800325c8
  mr r4,r3

Exit:
  addi	r5, r29, 0
  addi	r3, r28, 0

