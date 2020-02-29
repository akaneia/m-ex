#To be inserted at 80068b40
.include "../Globals.s"
.include "Header.s"

.set  REG_PlayerData,31
.set  REG_Header,29
.set  REG_InternalID,28
.set  REG_ftFunction,27

backup

#Get main dat file string
  lwz	REG_InternalID, 0x0004 (REG_PlayerData)
  lwz  r3,OFST_ftDataPointers(rtoc)
  mulli r4,REG_InternalID,ftDataPointers_Stride
  add r3,r3,r4
  lwz  REG_Header,0x4(r3)
#Get symbol offset from file
  mr  r3,REG_Header
  bl  SymbolName
  mflr  r4
  branchl r12,0x80380358
  cmpwi r3,0
  beq Exit
  mr  REG_ftFunction,r3

#Intialize pointers
.set  REG_Count,12
.set  REG_Code,11
.set  REG_RelocTable,10
  lwz REG_Count,0xC(REG_ftFunction)
  lwz REG_Code,0x0(REG_ftFunction)
  lwz REG_RelocTable,0x8(REG_ftFunction)
InitPointers_Loop:
.set  REG_CodePointer,9
.set  REG_FuncPointer,8
.set  REG_Flag,7
  lwz r3,0x0(REG_RelocTable)
  rlwinm  REG_Flag,r3,8,0x000000FF            #get flag
  rlwinm  r3,r3,0,0x00FFFFFF
  add REG_CodePointer,r3,REG_Code             #get code offset
  lwz r3,0x4(REG_RelocTable)
  add REG_FuncPointer,r3,REG_Code             #get func offset
#Check flag type
  cmpwi REG_Flag,1
  beq InitPointers_StaticAddress
  cmpwi REG_Flag,4
  beq InitPointers_LoadAddress
  cmpwi REG_Flag,6
  beq InitPointers_LoadAddress
  b InitPointers_IncLoop
InitPointers_StaticAddress:
  lwz r3,0x0(REG_FuncPointer)
  stw r3,0x0(REG_CodePointer)
  b InitPointers_IncLoop
InitPointers_LoadAddress:
#Now check if the low bits are signed
  rlwinm.  r3,REG_FuncPointer,17,0x1
  beq InitPointers_CheckFlag
#Adjust this address to load a negative offset
.set  REG_NewHigh,6
.set  REG_NewLow,5
#High bits
  rlwinm  r3,REG_FuncPointer,16,0x0000FFFF
  addi  r3,r3,1
  slwi  REG_NewHigh,r3,16
#Low bits
  sub r3,REG_FuncPointer,REG_NewHigh
  rlwinm  REG_NewLow,r3,0,0x0000FFFF
  or  REG_FuncPointer,REG_NewHigh,REG_NewLow
InitPointers_CheckFlag:
#Check flag type
  cmpwi REG_Flag,4
  beq InitPointers_Low16
  cmpwi REG_Flag,6
  beq InitPointers_High16
InitPointers_High16:
  rlwinm  r3,REG_FuncPointer,16,0x0000FFFF
  b InitPointers_Store
InitPointers_Low16:
  rlwinm  r3,REG_FuncPointer,0,0x0000FFFF
  b InitPointers_Store
InitPointers_Store:
  sth r3,0x0(REG_CodePointer)
InitPointers_IncLoop:
  addi  REG_RelocTable,REG_RelocTable,8
  subi  REG_Count,REG_Count,1
  cmpwi REG_Count,0
  bgt InitPointers_Loop

#Copy function pointers - init
.set  REG_ThisOffset,12
.set  REG_FuncPtrs,11
.set  REG_Code,10
.set  REG_FuncOffsets,9
.set  REG_Count,8
  lwz REG_FuncPtrs,0x4(REG_ftFunction)
  lwz REG_Code,0x0(REG_ftFunction)
  bl  StoreFunctionPointer_Offsets
  mflr  REG_FuncOffsets
  li  REG_Count,0
CopyPointers_Loop:
#Get this offset
  mulli REG_ThisOffset,REG_Count,4
  add REG_ThisOffset,REG_ThisOffset,REG_FuncOffsets
#Check if end
  lhz r3,0x0(REG_ThisOffset)
  extsh r3,r3
  cmpwi r3,-1
  beq CopyPointers_Exit
#Get pointer to function
  mulli r3,REG_Count,4
  lwzx r3,r3,REG_FuncPtrs
#Check if exists
  cmpwi r3,-1
  beq CopyPointers_IncLoop
#Get ram address
  add r3,r3,REG_Code
#Get offset of rtoc
  lhz r4,0x0(REG_ThisOffset)
#Get pointer table addr
  lwzx  r4,r4,rtoc
#Store to
  lhz r5,0x2(REG_ThisOffset)
  mullw r5,REG_InternalID,r5
  stwx  r3,r5,r4
CopyPointers_IncLoop:
  addi  REG_Count,REG_Count,1
  b CopyPointers_Loop
CopyPointers_Exit:

#Flush instruction cache so code can be run from this file
  lwz r3,0x40(REG_Header)
  lwz r4,0x0(REG_Header)
  branchl r12,0x80328f50

  b Exit

SymbolName:
blrl
.string "ftFunction"
.align 2

StoreFunctionPointer_Offsets:
  blrl
  #indexed by order in ftFunction
  .hword  OFST_FighterOnLoad,4
  .hword  OFST_FighterOnDeath,4
  .hword  -4,4  #OFST_FighterOnUnk
  .hword  OFST_FighterMoveLogic,4
  .hword  OFST_FighterSpecialN,4
  .hword  OFST_FighterSpecialNAir,4
  .hword  OFST_FighterSpecialS,4
  .hword  OFST_FighterSpecialSAir,4
  .hword  OFST_FighterSpecialHi,4
  .hword  OFST_FighterSpecialHiAir,4
  .hword  OFST_FighterSpecialLw,4
  .hword  OFST_FighterSpecialLwAir,4
  .hword  -4,4  #OFST_FighterOnAbsorb
  .hword  -4,4  #OFST_FighterOnItemPickup
  .hword  -4,4  #OFST_FighterOnItemInvis
  .hword  -4,4  #OFST_FighterOnItemVis
  .hword  -4,4  #OFST_FighterOnItemDrop
  .hword  -4,4  #OFST_FighterOnItemCatch
  .hword  -4,4  #OFST_FighterOnItemUnk
  .hword  -4,4  #OFST_FighterOnUnkModelFlags1
  .hword  -4,4  #OFST_FighterOnUnkModelFlags2
  .hword  -4,4  #OFST_FighterOnHit
  .hword  -4,4  #OFST_FighterOnUnkEyeTexture
  .hword  -4,4  #OFST_FighterOnFrame
  .hword  -4,4  #OFST_FighterOnStateChange
  .hword  -4,4  #OFST_FighterOnRespawn
  .hword  -4,4  #OFST_FighterOnModelRender
  .hword  -4,4  #OFST_FighterOnShadowRender
  .hword  -4,4  #OFST_FighterOnMultiJump
  .hword  -4,4  #OFST_FighterOnStateChangeWhileEyeChanged
  .hword  -4,4  #OFST_FighterOnUnk2
  .hword  OFST_KirbyOnAbilityFunc,8
  .hword  OFST_KirbyOnAbilityFunc+0x4,8  #OFST_FighterOnKirbyLoseAbility
  .hword  OFST_KirbySpecialN,4
  .hword  OFST_KirbySpecialNAir,4
  .hword  OFST_KirbyOnAbilityTakeHit,4
  .hword  OFST_KirbyInitItem,4
  .hword  OFST_onFloat,4
  .hword  OFST_onDoubleJump,4
  .hword  OFST_onZair,4
  #.hword  OFST_onLanding,4
  .hword  -1
  .align 2

Exit:
  restore
  li	r0, 0
