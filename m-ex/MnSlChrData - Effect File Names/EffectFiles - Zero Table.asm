#To be inserted @ 8005b4f0
.include "../../Globals.s"
.include "../Header.s"

.set  REG_Count,5
.set  REG_EffectFileTotal,6

#Init
  li  REG_Count,0
  addi  r3,r3,0x8
  lwz REG_EffectFileTotal,OFST_Metadata_EffectCount(rtoc)
Loop:
  mulli r7,REG_Count,0xC
  stwx r4,r7,r3
  addi  REG_Count,REG_Count,1
  cmpw REG_Count,REG_EffectFileTotal
  blt Loop

#im skipping 8005b6e0 because i think my loop accompishes it
  branch  r12,0x8005b5d4
