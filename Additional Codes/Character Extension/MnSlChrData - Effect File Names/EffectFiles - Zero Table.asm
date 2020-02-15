#To be inserted @ 8005b4f0
.include "../../../Globals.s"
.include "../Header.s"

.set  REG_Count,5

#Init
  li  REG_Count,0
  addi  r3,r3,0x8
Loop:
  mulli r6,REG_Count,0xC
  stwx r4,r6,r3
  addi  REG_Count,REG_Count,1
  cmpwi REG_Count,50 + NumOfAddedChars
  ble Loop

#im skipping 8005b6e0 because i think my loop accompishes it
  branch  r12,0x8005b5d4
