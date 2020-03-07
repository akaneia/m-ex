#To be inserted at 80068b40
.include "../Globals.s"
.include "Header.s"

.set  REG_PlayerData,31
.set  REG_Header,29
.set  REG_InternalID,28
.set  REG_ftFunction,27
.set  REG_itFunction,26

backup

#Init reg
  li  REG_ftFunction,0
  li  REG_itFunction,0

#Get main dat file string
  lwz	REG_InternalID, 0x0004 (REG_PlayerData)
  lwz  r3,OFST_ftDataPointers(rtoc)
  mulli r4,REG_InternalID,ftDataPointers_Stride
  add r3,r3,r4
  lwz  REG_Header,0x4(r3)
#Get symbol offset from file
  mr  r3,REG_Header
  bl  ftFunctionString
  mflr  r4
  branchl r12,0x80380358
  mr.  REG_ftFunction,r3
  beq ftFunction_Overload_Exit

#Reloc
  lwz r3,0xC(REG_ftFunction)
  lwz r4,0x0(REG_ftFunction)
  lwz r5,0x8(REG_ftFunction)
  bl  Reloc

#Copy function pointers - init
.set  REG_ThisOffset,12
.set  REG_FuncPtrs,11
.set  REG_Code,10
.set  REG_FuncOffsets,9
.set  REG_Count,8
  lwz REG_FuncPtrs,0x4(REG_ftFunction)
  lwz REG_Code,0x0(REG_ftFunction)
  bl  ftFunction_Offsets
  mflr  REG_FuncOffsets
  li  REG_Count,0
ftFunction_Overload_Loop:
#Get this offset
  mulli REG_ThisOffset,REG_Count,4
  add REG_ThisOffset,REG_ThisOffset,REG_FuncOffsets
#Check if end
  lhz r3,0x0(REG_ThisOffset)
  extsh r3,r3
  cmpwi r3,-1
  beq ftFunction_Overload_Exit
#Get pointer to function
  mulli r3,REG_Count,4
  lwzx r3,r3,REG_FuncPtrs
#Check if exists
  cmpwi r3,-1
  beq ftFunction_Overload_IncLoop
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
ftFunction_Overload_IncLoop:
  addi  REG_Count,REG_Count,1
  b ftFunction_Overload_Loop
ftFunction_Overload_Exit:

#Get symbol offset from file
  mr  r3,REG_Header
  bl  itFunctionString
  mflr  r4
  branchl r12,0x80380358
  mr.  REG_itFunction,r3
  beq CheckToFlushCache

#Loop through all items
.set  REG_ItemCount,20
.set  REG_LoopCount,21
  lwz REG_ItemCount,0x0(REG_itFunction)
  li  REG_LoopCount,0
  cmpwi REG_ItemCount,0
  beq itFunction_Exit
itFunction_Init:
#Get this item
.set  REG_ThisItem,22
  addi r3,REG_itFunction,0x4
  mulli r4,REG_LoopCount,4
  lwzx  REG_ThisItem,r3,r4
#Ensure it exists
  cmpwi REG_ThisItem,0
  beq itFunction_InitLoop
#Reloc
  lwz r3,0xC(REG_ThisItem)  #count
  lwz r4,0x0(REG_ThisItem)  #code
  lwz r5,0x8(REG_ThisItem)  #reloc table
  bl  Reloc
#Copy function pointers - init
.set  REG_ThisOffset,12
.set  REG_FuncPtrs,11
.set  REG_Code,10
.set  REG_ItemTable,9
.set  REG_Count,8
#Get external item ID from internal
  mr  r3,REG_PlayerData
  mr  r4,REG_LoopCount
  bl  Item_GetItemTableFromInternal
  mr  REG_ItemTable,r3
#Init
  lwz REG_FuncPtrs,0x4(REG_ThisItem)
  lwz REG_Code,0x0(REG_ThisItem)
  li  REG_Count,0
itFunction_Overload_Loop:
  mulli r4,REG_Count,4
  lwzx  r3,r4,REG_FuncPtrs
#Check if null
  cmpwi r3,-1
  beq itFunction_Overload_IncLoop
#Convert to code offset
  add r3,r3,REG_Code
#Store to item table
  stwx  r3,r4,REG_ItemTable
itFunction_Overload_IncLoop:
  addi  REG_Count,REG_Count,1
  cmpwi REG_Count,15
  blt itFunction_Overload_Loop

itFunction_InitLoop:
  addi  REG_LoopCount,REG_LoopCount,1
  cmpw  REG_LoopCount,REG_ItemCount
  blt itFunction_Init
itFunction_Exit:
  b CheckToFlushCache

ftFunctionString:
blrl
.string "ftFunction"
.align 2
itFunctionString:
blrl
.string "itFunction"
.align 2

ftFunction_Offsets:
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
  .hword  OFST_onLanding,4
  .hword  OFST_onFSmash,4
  .hword  OFST_onUSmash,4
  .hword  OFST_onDSmash,4
  .hword  -1
  .align 2

###########################################
Reloc:
#Intialize pointers
.set  REG_Count,12
.set  REG_Code,11
.set  REG_RelocTable,10
  mr REG_Count,r3
  mr REG_Code,r4
  mr REG_RelocTable,r5
Reloc_Loop:
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
  beq Reloc_StaticAddress
  cmpwi REG_Flag,4
  beq Reloc_LoadAddress
  cmpwi REG_Flag,6
  beq Reloc_LoadAddress
  b Reloc_IncLoop
Reloc_StaticAddress:
  lwz r3,0x0(REG_FuncPointer)
  stw r3,0x0(REG_CodePointer)
  b Reloc_IncLoop
Reloc_LoadAddress:
#Now check if the low bits are signed
  rlwinm.  r3,REG_FuncPointer,17,0x1
  beq Reloc_CheckFlag
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
Reloc_CheckFlag:
#Check flag type
  cmpwi REG_Flag,4
  beq Reloc_Low16
  cmpwi REG_Flag,6
  beq Reloc_High16
Reloc_High16:
  rlwinm  r3,REG_FuncPointer,16,0x0000FFFF
  b Reloc_Store
Reloc_Low16:
  rlwinm  r3,REG_FuncPointer,0,0x0000FFFF
  b Reloc_Store
Reloc_Store:
  sth r3,0x0(REG_CodePointer)
Reloc_IncLoop:
  addi  REG_RelocTable,REG_RelocTable,8
  subi  REG_Count,REG_Count,1
  cmpwi REG_Count,0
  bgt Reloc_Loop
  blr
##############################################
Item_GetItemTableFromInternal:
.set  REG_ArticleID,12
.set  REG_PlayerData,11
#Init
  mr  REG_PlayerData,r3
  mr  REG_ArticleID,r4
#Get external item ID from internal
  lwz r3,OFST_mexData(rtoc)
  lwz r3,Arch_Fighter(r3)
  lwz r3,Arch_Fighter_MEXItemLookup(r3)
  lwz r4,0x4(REG_PlayerData)
  mulli r4,r4,MEXItemLookup_Stride
  add r3,r3,r4
  lwz r3,0x4(r3)
  mulli r4,REG_ArticleID,2
  lhzx r3,r3,r4
#Get item's table
  lwz r4,OFST_ItemsAdded(rtoc)
  cmpwi r3,43
  blt CommonItems
  cmpwi r3,161
  blt FighterItems
  cmpwi r3,208
  blt PokemonItems
  cmpwi r3,CustomItemStart
  blt StageItems
  b CustomItems
CommonItems:
  lwz r4,Arch_ItemsAdded_Common(r4)
  b GetTable
FighterItems:
  subi  r3,r3,43
  lwz r4,Arch_ItemsAdded_Fighter(r4)
  b GetTable
PokemonItems:
  subi  r3,r3,161
  lwz r4,Arch_ItemsAdded_Pokemon(r4)
  b GetTable
StageItems:
  subi  r3,r3,208
  lwz r4,Arch_ItemsAdded_Stages(r4)
  b GetTable
CustomItems:
  subi  r3,r3,CustomItemStart
  lwz r4,Arch_ItemsAdded_Custom(r4)
  b GetTable

GetTable:
  mulli r3,r3,0x3C
  add  r3,r3,r4
  blr
###########################################

CheckToFlushCache:
  cmpwi REG_ftFunction,0
  bne FlushCache
  cmpwi REG_itFunction,0
  beq Exit
FlushCache:
#Flush instruction cache so code can be run from this file
  lwz r3,0x40(REG_Header)
  lwz r4,0x0(REG_Header)
  branchl r12,0x80328f50
Exit:
  restore
  li	r0, 0
