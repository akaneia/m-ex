#To be inserted at 8009A0B8

loc_0x0:
  cror 2, 0, 2
  beq- loc_0x40
  lis r9, 0x8007
  lbz r8, 1560(r4)
  subi r9, r9, 0x52F0
  lwz r10, 1872(r9)
  mulli r8, r8, 0xC
  addi r9, r9, 0x754
  rlwinm r10, r10, 6, 0, 25
  srawi r10, r10, 6
  add r9, r9, r10
  add r9, r9, r8
  lbz r9, 9(r9)
  cmplwi r9, 1
  ble- loc_0x44
  crset 2

loc_0x40:
  b 0xC

loc_0x44:
  crclr 2
