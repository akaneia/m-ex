#To be inserted @ 8025ee60
.include "../../../Globals.s"
.include "../../Header.s"

# update CSP
  lbz	r5, 0x0073 (r3)
  mr  r3,r31
  mr  r4,r20
  li  r6,0
  branchl r12,0x8025d5ac

Exit:
  branch  r12,0x8025ee74