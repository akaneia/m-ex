#To be inserted @ 8017752c
.include "../../Globals.s"
.include "../Header.s"

#Load File
  subi	r3, r13, 18756
  subi	r4, r13, 24352
  branchl r12,0x80016f80

#Init Archive
  lwz	r3,18756(r13)
  lwz r3,0x0(r3)
  addi  r4,sp,0x0
  subi	r5, r4, 26712
  branchl r12,0x80016af0

Injection_Exit:
  lwz	r0, 0x0010 (r30)
