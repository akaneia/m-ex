#To be inserted at 801c60c8
.include "../../Globals.s"
.include "../Header.s"

#ftX struct
  .set  grX_Code,0x0
  .set  grX_InstructionRelocTable,0x4
  .set  grX_InstructionRelocTableCount,0x8
  .set  grX_FunctionRelocTable,0xC
    .set  FunctionRelocTable_ReplaceThis,0x0
    .set  FunctionRelocTable_ReplaceWith,0x4
  .set  grX_FunctionRelocTableCount,0x10

.set  REG_PlayerData,31
.set  REG_Header,29
.set  REG_InternalID,28
.set  REG_grFunction,27

#Init
  lwz	r3, 0x0014 (sp)
  backup
  mr  REG_Header,r3
  load  r3,0x8049e6c8
  lwz REG_InternalID,0x88(r3)

#Get symbol offset from file
  mr  r3,REG_Header
  bl  grFunctionString
  mflr  r4
  branchl r12,0x80380358
  mr.  REG_grFunction,r3
  beq Exit

#Reloc
  lwz r3,grX_InstructionRelocTableCount(REG_grFunction)  #count
  lwz r4,grX_Code(REG_grFunction)                        #code
  lwz r5,grX_InstructionRelocTable(REG_grFunction)       #reloc table
  bl  Reloc
#Overload
  mr  r3,REG_grFunction
  lwz r4,OFST_mexData(rtoc)
  lwz r4,Arch_grFunction(r4)
  mulli r5,REG_InternalID,4
  lwzx  r4,r4,r5
  bl  Overload
  b FlushCache

grFunctionString:
blrl
.string "grFunction"
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
  #lwz r3,0x0(REG_FuncPointer)
  stw r8,0x0(REG_CodePointer)
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
  mr  REG_ftX,r3
  mr  REG_OverloadTable,r4
  lwz REG_RelocTable,grX_FunctionRelocTable(REG_ftX)
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
  mulli r4,r3,4
#Get ram offset for code
  lwz r3,FunctionRelocTable_ReplaceWith(REG_ThisElement)
  add r3,r3,REG_Code
#Overload
  stwx  r3,r4,REG_OverloadTable
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
  lwz r3,grX_FunctionRelocTableCount(REG_ftX)
  cmpw  REG_Count,r3
  blt Overload_Loop
Overload_Exit:
  blr
############################################
FlushCache:
#Flush instruction cache so code can be run from this file
  lwz r3,0x40(REG_Header)
  lwz r4,0x0(REG_Header)
  branchl r12,0x80328f50
Exit:
  restore
  lwz	r3, 0x0014 (sp)
