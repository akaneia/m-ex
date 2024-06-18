#To be inserted at 803a8840
.include "../../Globals.s"

lbz	r3, 0x004A (r31)
cmpwi r3, 0     # left align, no change
beq Exit
b Adjust

DATA:
blrl
.float -0.5
.float -1

Adjust:
  bl DATA
  mflr r12
  subi r3,r3,1
  mulli r3,r3,4
  lfs	f1, 0 (r31)
  lfs	f2, 0xC (r31)
  lfsx	f3, r3, r12
  lfs	f4, 0x24 (r31)
  fmuls f2,f2,f4
  fmadds f17,f2,f3,f1
  fadds f19, f17, f2
  b Exit

Exit:
  lwz	r0, 0x002C (r31)
