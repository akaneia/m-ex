#To be inserted at 80068b40
.include "../Globals.s"
.include "Header.s"

#ftX struct
  .set  ftX_Code,0x0
  .set  ftX_InstructionRelocTable,0x4
  .set  ftX_InstructionRelocTableCount,0x8
  .set  ftX_FunctionRelocTable,0xC
    .set  FunctionRelocTable_ReplaceThis,0x0
    .set  FunctionRelocTable_ReplaceWith,0x4
  .set  ftX_FunctionRelocTableCount,0x10

.set  REG_PlayerData,31
.set  REG_Header,29
.set  REG_InternalID,28
.set  REG_ftFunction,27
.set  REG_itFunction,27
.set  REG_kbFunction,27
.set  REG_clearCache,26

backup

#Init reg
  li  REG_clearCache,0

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
  beq ftFunction_Skip

#Reloc
  lwz r3,ftX_InstructionRelocTableCount(REG_ftFunction)  #count
  lwz r4,ftX_Code(REG_ftFunction)                        #code
  lwz r5,ftX_InstructionRelocTable(REG_ftFunction)       #reloc table
  bl  Reloc
#Overload
  mr  r3,REG_ftFunction
  lwz r4,OFST_mexData(rtoc)
  lwz r4,Arch_FighterFunc(r4)
  mr  r5,REG_InternalID
  bl  Overload
  li  REG_clearCache,1
ftFunction_Skip:






#Get symbol offset from file
  mr  r3,REG_Header
  bl  itFunctionString
  mflr  r4
  branchl r12,0x80380358
  mr.  REG_itFunction,r3
  beq itFunction_Skip

#Loop through all items
.set  REG_ItemCount,20
.set  REG_LoopCount,21
  lwz REG_ItemCount,0x0(REG_itFunction)
  li  REG_LoopCount,0
  cmpwi REG_ItemCount,0
  beq itFunction_Skip
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
  lwz r3,ftX_InstructionRelocTableCount(REG_ThisItem)  #count
  lwz r4,ftX_Code(REG_ThisItem)  #code
  lwz r5,ftX_InstructionRelocTable(REG_ThisItem)  #reloc table
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
  lwz REG_FuncPtrs,ftX_FunctionRelocTable(REG_ThisItem)
  lwz REG_Code,0x0(REG_ThisItem)
  li  REG_Count,0
  b itFunction_Overload_CheckLoop
itFunction_Overload_Loop:
  mulli r4,REG_Count,8
  add  r5,r4,REG_FuncPtrs
#Convert to code offset
  lwz r3,0x4(r5)
  add r3,r3,REG_Code
#get offset
  lwz r4,0x0(r5)
  mulli r4,r4,4
#Store to item table
  stwx  r3,r4,REG_ItemTable
itFunction_Overload_IncLoop:
  addi  REG_Count,REG_Count,1
itFunction_Overload_CheckLoop:
  lwz r3,ftX_FunctionRelocTableCount(REG_ThisItem)
  cmpw REG_Count,r3
  blt itFunction_Overload_Loop

itFunction_InitLoop:
  addi  REG_LoopCount,REG_LoopCount,1
  cmpw  REG_LoopCount,REG_ItemCount
  blt itFunction_Init

  li  REG_clearCache,1
itFunction_Skip:





#Get symbol offset from file
  mr  r3,REG_Header
  bl  kbFunctionString
  mflr  r4
  branchl r12,0x80380358
  mr.  REG_kbFunction,r3
  beq kbFunction_Skip
#Reloc
  lwz r3,ftX_InstructionRelocTableCount(REG_kbFunction)  #count
  lwz r4,ftX_Code(REG_kbFunction)                        #code
  lwz r5,ftX_InstructionRelocTable(REG_kbFunction)       #reloc table
  bl  Reloc
#Overload
  mr  r3,REG_kbFunction
  lwz r4,OFST_mexData(rtoc)
  lwz r4,Arch_KirbyFunction(r4)
  mr  r5,REG_InternalID
  bl  Overload
  li  REG_clearCache,1
kbFunction_Skip:

#Get symbol offset from file
  mr  r3,REG_Header
  bl  mexPatchString
  mflr  r4
  branchl r12,0x80380358
  mr.  REG_kbFunction,r3
  beq kbFunction_Skip
#Reloc
  lwz r3,ftX_InstructionRelocTableCount(REG_kbFunction)  #count
  lwz r4,ftX_Code(REG_kbFunction)                        #code
  lwz r5,ftX_InstructionRelocTable(REG_kbFunction)       #reloc table
  bl  Reloc
#Overload
  mr  r3,REG_kbFunction
  li  r4,0
  li  r5,0
  bl  Overload
  li  REG_clearCache,1
mexPatch_Skip:



  b CheckToFlushCache

ftFunctionString:
blrl
.string "ftFunction"
.align 2
kbFunctionString:
blrl
.string "kbFunction"
.align 2
mexPatchString:
blrl
.string "mexPatch"
.align 2
itFunctionString:
blrl
.string "itFunction"
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
Overload:
# r3 = ftX
# r4 = table
# r5 = player_data
#Copy function pointers - init
.set  REG_ftX,12
.set  REG_ThisElement,11
.set  REG_Code,10
.set  REG_OverloadTable,9
.set  REG_Count,8
.set  REG_RelocTable,7
.set  REG_InternalID,6
  mr  REG_ftX,r3
  mr  REG_OverloadTable,r4
  mr  REG_InternalID,r5
  lwz REG_RelocTable,ftX_FunctionRelocTable(REG_ftX)
  lwz REG_Code,0x0(REG_ftX)
  li  REG_Count,0
  b Overload_CheckLoop
Overload_Loop:
#Get this element
  mulli r3,REG_Count,8
  add REG_ThisElement,r3,REG_RelocTable
#Check if using index or function address
  lwz r3,FunctionRelocTable_ReplaceThis(REG_ThisElement)
  rlwinm. r0,r3,0,0x80000000
  bne Overload_FuncAddr

Overload_TableIndex:
#Get the table whose entry we are overloading
  mulli r3,r3,4
  lwzx  r4,r3,REG_OverloadTable
#Get ram offset for code
  lwz r3,FunctionRelocTable_ReplaceWith(REG_ThisElement)
  add r3,r3,REG_Code
#Update table entry
  mulli r5,REG_InternalID,4
  stwx  r3,r4,r5
  b Overload_IncLoop
Overload_FuncAddr:
#Get ram offset for code
  lwz r4,FunctionRelocTable_ReplaceWith(REG_ThisElement)
  add r4,r4,REG_Code
#Store branch to this code
  sub r4,r4,r3                          #Difference relative to branch addr
  rlwinm  r4,r4,0,6,29                  #extract bits for offset
  oris  r4,r4,0x4800                    #Create branch instruction from it
  stw r4,0x0(r3)         #place branch instruction
  b Overload_IncLoop

Overload_IncLoop:
  addi  REG_Count,REG_Count,1
Overload_CheckLoop:
  lwz r3,ftX_FunctionRelocTableCount(REG_ftX)
  cmpw  REG_Count,r3
  blt Overload_Loop
Overload_Exit:
  blr
############################################
CheckToFlushCache:
  cmpwi REG_ftFunction,0
  beq Exit
FlushCache:
#Flush instruction cache so code can be run from this file
  lwz r3,0x40(REG_Header)
  lwz r4,0x0(REG_Header)
  branchl r12,0x80328f50
Exit:
  restore
  li	r0, 0
