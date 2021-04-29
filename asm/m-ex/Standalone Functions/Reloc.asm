#To be inserted @ 803d7074
.include "../../Globals.s"
.include "../Header.s"

#r3 = xFunction ptr

###########################################
#Intialize
.set  REG_xFunction,31
.set  REG_Count,30
.set  REG_Code,29
.set  REG_RelocTable,28

  backup

  mr  REG_xFunction, r3
  lwz REG_Count,ftX_InstructionRelocTableCount(REG_xFunction)  #count
  lwz REG_Code,ftX_Code(REG_xFunction)                         #code
  lwz REG_RelocTable,ftX_InstructionRelocTable(REG_xFunction)  #reloc table

Reloc_Index:
.set REG_xFuncLookup, 27
# Check if max xFunctions indexed
  lwz REG_xFuncLookup,OFST_XFunctionLookup(rtoc)
  lwz r3,xFuncLookup_Num(REG_xFuncLookup)
  cmpwi r3,xFuncLookup_Max
  bge Error
# Check if this already exists for some reason
.set REG_LoopCount, 26
.set REG_xFuncNum, 25
.set REG_Curr, 24
  li REG_LoopCount, 0
  lwz REG_xFuncNum,xFuncLookup_Num(REG_xFuncLookup)
  addi REG_Curr, REG_xFuncLookup, xFuncLookup_Start     # get to xFunction ptr array
  b Reloc_Index_LoopCheck
Reloc_Index_Loop:
# if match exists, dont reloc/index again
  lwz r3,0x0(REG_Curr)
  cmpw r3,REG_xFunction
  beq Reloc_Exit
Reloc_Index_LoopInc:
  addi REG_LoopCount,REG_LoopCount,1
  addi REG_Curr,REG_Curr, xFuncLookup_Start_Size
Reloc_Index_LoopCheck:
  cmpw REG_LoopCount,REG_xFuncNum
  blt Reloc_Index_Loop
# Index it
  lwz r3,xFuncLookup_Num(REG_xFuncLookup)
  mulli r3, r3, xFuncLookup_Start_Size
  addi r5, REG_xFuncLookup, xFuncLookup_Start     # get to xFunction ptr array
  stwx REG_xFunction, r3, r5      # store to ptr array
# Inc num
  lwz r3,xFuncLookup_Num(REG_xFuncLookup)
  addi r3,r3,1
  stw r3,xFuncLookup_Num(REG_xFuncLookup)

Reloc_Loop:
.set  REG_CodePointer,27
.set  REG_FuncPointer,26
.set  REG_Flag,25
  lwz r3,0x0(REG_RelocTable)
  rlwinm  REG_Flag,r3,8,0x000000FF            #get flag
  rlwinm  r3,r3,0,0x00FFFFFF
  add REG_CodePointer,r3,REG_Code             #get code offset

#First check if a bl to an dol address
  lwz r3,0x4(REG_RelocTable)
  rlwinm  r0,r3,8,0x000000F0
  cmpwi r0,0x80 
  beq Reloc_DOLAddr
Reloc_CodeAddr:
  add REG_FuncPointer,r3,REG_Code             #get func offset
  b Reloc_CheckType
Reloc_DOLAddr:
  lwz REG_FuncPointer,0x4(REG_RelocTable)             #get func offset

Reloc_CheckType:
#Check flag type
  cmpwi REG_Flag,1
  beq Reloc_StaticAddress
  cmpwi REG_Flag,4
  beq Reloc_LoadAddress
  cmpwi REG_Flag,6
  beq Reloc_LoadAddress
  cmpwi REG_Flag,10
  beq Reloc_Branch
  cmpwi REG_Flag,26
  beq Reloc_Relative32Bit
  b Reloc_IncLoop
Reloc_StaticAddress:
  #lwz r3,0x0(REG_FuncPointer)
  stw REG_FuncPointer,0x0(REG_CodePointer)
  b Reloc_IncLoop
############################################
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
  b Reloc_IncLoop
############################################
Reloc_Branch:
#Store branch to this code
  sub r3,REG_FuncPointer,REG_CodePointer                          #Difference relative to branch addr
  rlwinm  r3,r3,0,6,29                  #extract bits for offset
  lwz r4,0x0(REG_CodePointer)         #place branch instruction
  or  r3,r3,r4
  stw r3,0x0(REG_CodePointer)         #place branch instruction
  b Reloc_IncLoop
############################################
Reloc_Relative32Bit:
#Store offset?
#Store branch to this code
  sub r3,REG_FuncPointer,REG_CodePointer                          #Difference relative to branch addr
  stw r3,0x0(REG_CodePointer)         #place branch instruction
  b Reloc_IncLoop
############################################
Reloc_IncLoop:
  addi  REG_RelocTable,REG_RelocTable,8
  subi  REG_Count,REG_Count,1
  cmpwi REG_Count,0
  bgt Reloc_Loop

Reloc_Exit:
  restore
  blr
##############################################


#############################################
Error:
#OSReport
  bl  ErrorString
  mflr  r3
  branchl r12,0x803456a8
#Assert
  bl  Assert_Name
  mflr  r3
  li  r4,0
  load  r5,0x804d3940
  branchl r12,0x80388220
Assert_Name:
blrl
.string "m-ex"
.align 2
ErrorString:
blrl
.string "error: over 20 xFunctions indexed\n"
.align 2
###############################################