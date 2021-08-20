#To be inserted @ 80263b3c
.include "../../../Globals.s"
.include "../../Header.s"

# check for null icon ID (same as count)
lwz r12,OFST_Metadata_CSSIconCount(rtoc)
cmpw r0, r12
bne Exit

# use ext ID 0
li r3, 0
branch r12,0x80263b48

Exit:
  mulli	r0, r0, 28