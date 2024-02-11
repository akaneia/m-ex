#To be inserted at 800D65EC

loc_0x0:
  bl loc_0x3C
  .single 0.589999973773956
  .single 80
  .single 9.99999974737875E-5
  .single 0
  .single 0

loc_0x18:
  fabs f1, f1
  lfs f2, 4(r4)
  lfs f3, 8(r4)
  fmsubs f1, f1, f2, f3
  fctiwz f1, f1
  stfd f1, 12(r4)
  lwz r6, 16(r4)
  addi r6, r6, 0x2
  blr 

loc_0x3C:
  lfs f0, 148(r4)
  mflr r4
  lbz r6, 1648(r5)
  cmpwi r6, 0x1
  bge- loc_0x78
  lfs f1, 1568(r5)
  bl loc_0x18
  mullw r0, r6, r6
  lfs f1, 1572(r5)
  bl loc_0x18
  mullw r6, r6, r6
  add r0, r0, r6
  cmpwi r0, 0x1900
  ble- loc_0x78
  lfs f0, 0(r4)

loc_0x78: