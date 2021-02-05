#To be inserted @ 80260db0
.include "../../../Globals.s"
.include "../../Header.s"

# update CSP
  
  addi	r3, r19, 0
  li  r4,0
  li  r5,0
  li  r6,1
  branchl r12,0x8025d5ac

Exit: