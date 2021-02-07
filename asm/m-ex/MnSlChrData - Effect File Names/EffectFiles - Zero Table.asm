#To be inserted @ 8005b4f0
.include "../../Globals.s"
.include "../Header.s"

.set  REG_Count,5
.set  REG_EffectFileTotal,6

#Init
  li  REG_Count,0
  addi  r3,r3,0x8
  lwz REG_EffectFileTotal,OFST_Metadata_EffectCount(rtoc)
Archive_Loop:
  mulli r7,REG_Count,0xC
  stwx r4,r7,r3
  addi  REG_Count,REG_Count,1
  cmpw REG_Count,REG_EffectFileTotal
  blt Archive_Loop

#Now zero EffBehaviorTable pointers
  li  REG_Count,0
  li  r4,0
  lwz r3,OFST_effBehaviorTable(rtoc)
EffBehaviorTable_Loop:
  mulli r7,REG_Count,0x4
  stwx r4,r7,r3
  addi  REG_Count,REG_Count,1
  cmpw REG_Count,REG_EffectFileTotal
  blt EffBehaviorTable_Loop

#im skipping 8005b6e0 because i think my loop accomplishes it
  branch  r12,0x8005b5d4
