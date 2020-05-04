#To be inserted @ 800C2734

loc_0x0:
  lmw r30, 16(r1)
  addi r1, r1, 0x4000
  lwz r0, 4(r1)
  mtlr r0
  blr
