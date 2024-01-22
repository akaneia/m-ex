#To be inserted @ 802599ec

loc_0x0:
  lis r9, 0x804D
  stwu r1, -24(r1)
  ori r9, r9, 0x3EE0
  mfcr r12
  lwz r9, 0(r9)
  mflr r0
  stw r31, 20(r1)
  lis r6, 0x803F
  stw r12, 8(r1)
  lis r4, 0x803F
  li r31, 0x154
  stw r0, 28(r1)
  lwzx r31, r31, r2
  stw r29, 12(r1)
  cmpwi cr4, r31, 0x0
  lwz r5, 7368(r9)
  ori r6, r6, 0x6D0
  ori r4, r4, 0x9FC
  stw r30, 16(r1)
  li r30, 0x100
  lwzx r30, r30, r2

loc_0x54:
  ble- cr4, loc_0x8C
  lbz r7, 11(r6)
  mr r9, r30
  mtctr r31

loc_0x64:
  lwz r10, 28(r9)
  cmpw r10, r7
  bne+ loc_0x84
  lbz r8, 10(r6)
  lwz r10, 4(r9)
  sraw r8, r5, r8
  rlwimi r10, r8, 30, 1, 1
  stw r10, 4(r9)

loc_0x84:
  addi r9, r9, 0x20
  bdnz+ loc_0x64

loc_0x8C:
  addi r6, r6, 0x1C
  cmpw r6, r4
  bne+ loc_0x54
  lis r9, 0x8037
  rlwinm r3, r31, 2, 0, 29
  ori r9, r9, 0xF1E4
  mtctr r9
  bctrl 
  mr r29, r3
  ble- cr4, loc_0x164
  mtctr r31
  mr r10, r30
  li r8, 0x0
  li r3, 0x0

loc_0xC4:
  lwz r9, 4(r10)
  rlwinm r7, r3, 2, 0, 29
  addi r10, r10, 0x20
  andis. r6, r9, 0x4000
  rlwinm r9, r9, 0, 1, 31
  stw r9, -28(r10)
  beq- loc_0xE8
  stwx r8, r29, r7
  addi r3, r3, 0x1

loc_0xE8:
  addi r8, r8, 0x1
  bdnz+ loc_0xC4
  cmpwi r3, 0x0
  beq- loc_0x164
  lis r9, 0x8038
  ori r9, r9, 0x580
  mtctr r9
  bctrl 
  lis r10, 0x8037
  ori r10, r10, 0xF1B0
  mr r9, r3
  mtctr r10
  mr r3, r29
  rlwinm r9, r9, 2, 0, 29
  lwzx r31, r29, r9
  bctrl 
  rlwinm r9, r31, 5, 0, 26
  add r30, r30, r9
  mr r3, r31
  lwz r9, 4(r30)
  oris r9, r9, 0x8000
  stw r9, 4(r30)
  lwz r0, 28(r1)
  lwz r12, 8(r1)
  lwz r29, 12(r1)
  mtlr r0
  lwz r30, 16(r1)
  mtcrf 0x08, r12
  lwz r31, 20(r1)
  addi r1, r1, 0x18
  blr 

loc_0x164:
  lis r9, 0x8037
  mr r3, r29
  ori r9, r9, 0xF1B0
  li r31, 0x0
  mtctr r9
  bctrl 
  lwz r0, 28(r1)
  lwz r12, 8(r1)
  mr r3, r31
  lwz r29, 12(r1)
  mtlr r0
  lwz r30, 16(r1)
  mtcrf 0x08, r12
  lwz r31, 20(r1)
  addi r1, r1, 0x18
  blr 

