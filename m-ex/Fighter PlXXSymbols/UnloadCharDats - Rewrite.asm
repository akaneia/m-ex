#To be inserted @ 800852d4
.include "../../Globals.s"
.include "../Header.s"

.set  REG_ftData,7
.set  REG_costumeData,8
.set  REG_animData,9
.set  REG_resultsAnimData,10

#12,11,10,6
.set  REG_Count,12
.set  REG_CostumeCount,11

#Init
  li  REG_Count,0
  lwz REG_animData,OFST_MnSlChrAnimCount(rtoc)
  lwz REG_resultsAnimData,OFST_GmRstPointers(rtoc)
Loop:
#Init as 0
  li  r3,0
  stw r3,0x0(REG_ftData)      #ftData
  stw r3,0x4(REG_ftData)      #ftFunction
  stw r3,0x0(REG_animData)    #anim pointer
  stw r3,0x0(REG_resultsAnimData)   #anim pointer - results

CostumeLoopInit:
  li  REG_CostumeCount,0
  b CostumeLoopInc
CostumeLoop:
#Zero Costume
  lwz r3,0x0(REG_costumeData)   #Get costume data pointer
  mulli r4,REG_CostumeCount,24
  add r4,r3,r4                  #get this costume
  li  r3,0
  stw r3,0x0(r4)                #zero costume
  stw r3,0x8(r4)                #zero costume
#Inc
  addi  REG_CostumeCount,REG_CostumeCount,1
CostumeLoopInc:
#Get num of costumes
  lbz r3,0x4(REG_costumeData)
  cmpw  REG_CostumeCount,r3
  blt CostumeLoop

IncLoop:
  addi  REG_animData,REG_animData,8
  addi  REG_costumeData,REG_costumeData,8
  addi  REG_ftData,REG_ftData,ftDataPointers_Stride
  addi  REG_resultsAnimData,REG_resultsAnimData,GmRstPointers_Stride
  addi  REG_Count,REG_Count,1
  lwz r3,OFST_Metadata_InternalIDCount(rtoc)
  cmpw REG_Count,r3
  blt Loop

Exit:
  li  r3,0
  load  r5,0x804598b8
  branch  r12,0x800853dc
